class ApplicationController < ActionController::Base
    before_action :set_current_user

    protected
    
    def set_current_user
        @current_user ||= User.find_by_id(session[:user_id])
        unless @current_user 
            flash.now[:warning] = "请先登录"
            render 'sessions/new', status: 401
        end
    end

    def render_404
        render file: "#{Rails.root}/public/404.html", status: 404
    end
end
