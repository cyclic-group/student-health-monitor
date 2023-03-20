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
