class ClassifiedListingsController < ApplicationController
  before_action :set_classified_listing, only: [:show, :edit, :update, :destroy]

  def index
    @classified_listings = ClassifiedListing.all
  end


  def show
  end


  def new
    @classified_listing = ClassifiedListing.new
  end


  def edit
  end


  def create
    @classified_listing = ClassifiedListing.new(classified_listing_params)

    respond_to do |format|
      if @classified_listing.save
        format.html { redirect_to @classified_listing, notice: 'Classified listing was successfully created.' }
        format.json { render :show, status: :created, location: @classified_listing }
      else
        format.html { render :new }
        format.json { render json: @classified_listing.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @classified_listing.update(classified_listing_params)
        format.html { redirect_to @classified_listing, notice: 'Classified listing was successfully updated.' }
        format.json { render :show, status: :ok, location: @classified_listing }
      else
        format.html { render :edit }
        format.json { render json: @classified_listing.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @classified_listing.destroy
    respond_to do |format|
      format.html { redirect_to classified_listings_url, notice: 'Classified listing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_classified_listing
      @classified_listing = ClassifiedListing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def classified_listing_params
      params.require(:classified_listing).permit(
        {category_ids: []},
        :title,
        :description,
        categories_attributes: [:id, :name, :_destroy]
      )
    end
end
