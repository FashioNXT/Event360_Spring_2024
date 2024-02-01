module ApplicationHelper
    def set_app
        # Select all the apps that are in the NxtApps table
        @apps = NxtApps.all.pluck(:name)
        
        temp = params[:app]
        @app = !temp.nil? && NxtApps.find_by(name: temp) ? temp : ''
      end
  
      def validate_login
        unless logged_in?
          flash[:login_errors] = 'User Not Logged-In. Please Log-In/Register'
          redirect_to '/'
        end
      end
end
