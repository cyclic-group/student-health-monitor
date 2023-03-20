class DoctorController < ApplicationController
    before_action :check_identity 

    def show_home 
        @problematic_reports = Report.all.to_a.filter { |r| r.problematic? } 
    end

    def new_message
        @message = Message.new
        @report = Report.find_by(id: params[:report_id])
    end 

    def create_message
        @message = Message.new message_params do |m|
            m.sender = @current_user
        end 

        if @message.save
            report = Report.find_by(id: params[:report_id])
            if report 
                report.responsed = true
                report.save 
            end
            flash[:success] = '发送成功'
            redirect_to doctor_home_path 
        else 
            flash.now[:warning] = '收件人不存在'
            render :new_message, status: 422
        end
    end

    private 
    def message_params 
        params.require(:message).permit(:receiver_id, :title, :content)
    end 

    # 检查访问者是否为校医
    def check_identity 
        unless @current_user.doctor? 
            flash.now[:warning] = "非校医账号"
            render 'session/new', status: 403 
        end 
    end
end
