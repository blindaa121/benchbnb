class ApplicationController < ActionController::Base
    helper_method :require_signed_in, :current_user, :signed_in?

    def current_user 
        @current_user ||= User.find_by(session_token: session[:session_token])
    end 

    def sign_in!(user)
        @current_user = user 
        session[:session_token] = user.reset_session_token! 
    end 

    def sign_out!
        current_user.reset_session_token!
        session[:session_token] = nil
    end 

    def signed_in?
        !!current_user
    end 

    private 

    def require_signed_in
        unless current_user
            render json: { base: ['invalid credentials'] }, status: 401
        end
    end 

end
