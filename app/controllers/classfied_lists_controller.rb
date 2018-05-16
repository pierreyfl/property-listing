class ClassfiedListsController < AdminController
  
  def index
    respond_to do |format|
      format.html { render :index and return }
      format.json { render json: ClassfiedList.all }
    end
  end
  
  def new 
        @list = ClassfiedList.new 
  end
  
  def create  
    list = ClassfiedList.new
    list.title = params[:title]
    list.price = params[:price]
    list.time_length = params[:time_length]

    if list.save!
      render json: list and return
    end

    render json: list.errors, status: :unprocessable_entity

  end
  
  def edit 
      @list = ClassfiedList.find(params[:id])
  end
  
  def update
    list = ClassfiedList.find(params[:id])
    list.title = params[:title]
    list.price = params[:price]
    list.time_length = params[:time_length]

    if list.save!
      render json: list and return
    end

    render json: list.errors, status: :unprocessable_entity
  end


  def destroy
    ClassfiedList.delete(params[:id])
  end
  
  private
  

  def list_params
    params.require(:classfied_list).permit(:title, :price, :time_length)
  end
end
