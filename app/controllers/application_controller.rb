class ApplicationController < ActionController::Base
    before_action :set_current_user

    protected
    
    def set_current_user
        @current_user ||= Person.find_by_id(session[:pid])
        unless @current_user 
            flash[:warning] = "请先登录"
            redirect_to login_path 
        end
    end
end
