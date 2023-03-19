class DoctorController < ApplicationController
    before_action :check_identity 

    def show_home  
    end

    def new_message
        @message = Message.new
    end 

    def create_message
        @message = Message.new message_params do |m|
            m.sender = @current_user
        end 

        if @message.save 
            flash[:success] = '发送成功'
            redirect_to doctor_message_path
        else 
            flash.now[:warning] = '填写错误'
            render doctor_message_path, status: 422
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
