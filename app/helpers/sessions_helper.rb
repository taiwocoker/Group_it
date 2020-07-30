module SessionsHelper
    def log_in(user)
        session[:author_id] = user.id
      end
    
      def current_user
        User.find_by(id: session[:author_id])
      end
    
      def logged_in?
        !current_user.nil?
      end
    
      def require_user
        redirect_to login_path unless logged_in?
      end
end
