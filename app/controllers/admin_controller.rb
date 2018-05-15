class AdminController < ApplicationController

    before_action :authenticate_user!
    before_action :authenticate_super_admin



private 
    def authenticate_super_admin
        # only super_admin can do agency creation and other operations
        unless current_user.has_role? :super_admin
          flash[:error] = "You don't have permission!"
          redirect_to dashboard_path
        end
    
     end
end
