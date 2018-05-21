class AdminRoomsController < AdminController
  def index
    @rooms = Room.where(:active => nil)
  end

  def show
    @room = Room.find(params[:id])
  end

  def update
    room = Room.find(params[:id])

    room.active = true
    room.save
  end
end