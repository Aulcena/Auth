class ApplicationController < ActionController::Base
    helper_method :current_user

    private
    
    def login!(user)
        @current_user = user
        session[:session_token] = self.session_token
    end

    def logout!
        current_user.try(:reset_session_token!)
        session[:session_token] = nil
    end

    def current_user
        return nil unless session[:session_token]
        @current_user ||= User.find_by(session: session[:session_token] )
    end
end