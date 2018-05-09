class PackagesController < ApplicationController
    before_action :authenticate_user!
    before_action :authenticate_super_admin
    
    def index
        @packages = PropertyPackage.all 
    end
    
    def new 
        @package = PropertyPackage.new 
    end
    
    def create  
        
        if PropertyPackage.create(package_params) 
            redirect_to packages_path, notice: 'Package created successfully' 
          
        else
            @package = PropertyPackage.new(package_params)
            render :new
        end

    
    end
    
    def edit 
        @package = PropertyPackage.find(params[:id])
    end
    
    def update 
        @package =PropertyPackage.find(params[:id]) 
        
        if @package.update(package_params)
            redirect_to packages_path, notice: 'Package updated successfully' and return
        end
    end
    
    private
    
    def authenticate_super_admin
        # only super_admin can do agency creation and other operations
        unless current_user.has_role? :super_admin
          flash[:error] = "You don't have permission!"
          redirect_to dashboard_path
        end
    
     end
    def package_params
      params.require(:property_package).permit(:name, :listing_period, :price, :listings_amount, :is_standard, :is_premium, :is_feature, :is_single, :is_multi)
    end
    
end