class StudentsController < ApplicationController
    before_action :set_current_student

    def show_home
    end 
    
    def show_message
    end

    def show_account
    end

    def edit_report
        @report = Report.new
    end

    def create_report 
        @report = Report.new report_params
        @report.reporter = @current_user
        if @report.save
            flash[:success] = "打卡成功！"
            redirect_to student_home_path
        else  
            flash.now[:warning] = "填写错误！"
            render :new_report, status: :unprocessable_entity
        end
    end

    private 
    def report_params
        params.require(:report).permit(:step_count, :sleep_hours, symptons: [])
    end

    def set_current_student
        @current_student ||= Student.find_by(id: @current_user.id)
        unless @current_student
            flash.now[:warning] = '非学生账号'
            render 'session/new', status: 403
        end
    end
end
