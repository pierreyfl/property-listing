class StatsController < AdminController

  def index
    @stats = RoomVisit.joins(:room).select('rooms.id, room_visits.user_id, room_visits.email, sum(room_visits.time_spent) as time_spent').group(:room_id, :user_id)

  end
end