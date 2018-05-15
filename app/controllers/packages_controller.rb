class PackagesController < AdminController
    
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
    
    def package_params
      params.require(:property_package).permit(:name, :listing_period, :price, :listings_amount, :is_standard, :is_premium, :is_feature, :is_single, :is_multi)
    end
    
end