class ClassfiedListsController < AdminController
  
  def index
    @lists = ClassfiedList.all
  end
  
  def new 
        @list = ClassfiedList.new 
  end
  
  def create  
      
      if ClassfiedList.create(list_params) 
          redirect_to classfied_lists_path, notice: 'List created successfully' 
      else
          @package = ClassfiedList.new(package_params)
          render :new
      end
  end
  
  def edit 
      @list = ClassfiedList.find(params[:id])
  end
  
  def update 
      @list =ClassfiedList.find(params[:id]) 
      
      if @list.update(list_params)
          redirect_to classfied_lists_path, notice: 'List updated successfully' and return
      end
  end
  
  private
  

  def list_params
    params.require(:classfied_list).permit(:title, :price, :time_length)
  end
end
