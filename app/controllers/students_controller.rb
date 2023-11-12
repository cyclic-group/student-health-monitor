class StudentsController < ApplicationController
    before_action :set_current_student

    def show_home
    end 

    def show_messages
        @messages = @current_student.messages.sort_by { |m| m.created_at }.reverse
        render :show_messages 
    end

    def show_message
        @message = Message.find_by(id: params[:id], receiver_id: [User::BROADCAST_ID, @current_student.id])
        if @message
            @message.unread = false
            @message.save
            render :show_message 
        else 
            flash.now[:warning] = '消息不存在'
            show_messages 
        end 
    end

    def show_account
    end

    def new_report
        @report = Report.new
    end

    def create_report 
        @report = Report.new report_params
        @report.reporter = @current_student
        if @report.save 
            flash[:success] = "打卡成功！"
            redirect_to student_home_path
        else  
            flash.now[:warning] = "填写错误！"
            render :new_report, status: 422
        end
    end

    private 
    def report_params
        params.require(:report).permit(:step_count, :sleep_hours, :remark, symptons: [])
    end

    # 若当前用户是学生，设置`@current_student`为该学生；否则另该用户重新登录
    def set_current_student
        @current_student ||= Student.find_by(id: @current_user.id)
        unless @current_student
            flash.now[:warning] = '非学生账号，请重新登录'
            render 'sessions/new', status: 403
        end
    end
end
