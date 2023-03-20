class AdminController < ApplicationController
    before_action :check_identity
    # 主页
    def show_home
    end

    # 发布公告页面
    def new_announcement
        @announcement = Message.new
    end

    # 处理提交的公告
    def create_announcement
        @announcement = Message.new announcement_params
        @announcement.sender = @current_user 
        @announcement.receiver_id = User::BROADCAST_ID

        if @announcement.save 
            flash[:success] = "发布成功"
            redirect_to admin_home_path
        else  
            flash.now[:warning] = "表格错误或服务器故障"
            render :new_announcement, status: 422 
        end
    end

    def edit_password
    end

    def update_password
        student = Student.find_by(id: params[:id]) 
        new_password = params[:password]
        if student && !new_password.blank?
            student.user.password = new_password 
            if student.user.save 
                flash[:success] = '密码修改成功'
                redirect_to admin_home_path
            else  
                flash.now[:warning] = '系统故障，请稍后再试'
                render :edit_password, status: 500 
            end
        else 
            flash.now[:warning] = '该学生用户不存在或密码无效'
            render :edit_password, status: 422
        end 
    end

    private 
    def check_identity 
        unless @current_user.admin?
            flash.now[:warning] = "非管理员账号，请重新登录"
            render 'sessions/new', status: 403
        end
    end

    def announcement_params 
        params.require(:message).permit(:title, :content)
    end
end
