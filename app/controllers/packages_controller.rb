class PackagesController < AdminController

  def index
    respond_to do |format|
      format.html { render :index and return }
      format.json { render json: PropertyPackage.all }
    end

  end

  def new
    @package = PropertyPackage.new
  end

  def create
    package = PropertyPackage.new
    package.name = params[:name]
    package.price = params[:price]
    package.listings_amount = params[:listings_amount]
    package.listing_period = params[:listing_period]
    package.is_standard = params[:type] == 'standard'
    package.is_premium = params[:type] == 'premium'
    package.is_feature = params[:type] == 'featured'

    package.is_single = params[:single_multi] == 'single'
    package.is_multi = params[:single_multi] == 'multi'

    if package.save!
      render json: package and return
    end

    render json: package.errors, status: :unprocessable_entity


  end

  def edit
    @package = PropertyPackage.find(params[:id])
  end

  def update
    package =PropertyPackage.find(params[:id])

    package.name = params[:name]
    package.price = params[:price]
    package.listings_amount = params[:listings_amount]
    package.listing_period = params[:listing_period]
    package.is_standard = params[:type] == 'standard'
    package.is_premium = params[:type] == 'premium'
    package.is_feature = params[:type] == 'featured'

    package.is_single = params[:single_multi] == 'single'
    package.is_multi = params[:single_multi] == 'multi'

    if package.save!
      render json: package and return
    end

    render json: package.errors, status: :unprocessable_entity
  end

  def destroy
    PropertyPackage.delete(params[:id])
  end

  private

  def package_params
    params.require(:property_package).permit(:name, :listing_period, :price, :listings_amount, :type, :single_multi)
  end

end