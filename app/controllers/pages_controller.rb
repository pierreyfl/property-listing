class PagesController < ApplicationController
  def home
    @rooms = Room.where(active: true).limit(3)
    # STEP 1
    if params[:search].present? && params[:search].strip != ""
      session[:loc_search] = params[:search]
    end

    # STEP 2
    if session[:loc_search] && session[:loc_search] != ""
      @rooms_address = Room.where(active: true).near(session[:loc_search], 5, order: 'distance')
    else
      @rooms_address = Room.where(active: true).all
    end

    # STEP 3
    @search = @rooms_address.ransack(params[:q])
    @rooms = @search.result

    @arrRooms = @rooms.to_a
    # STEP 4
    if (params[:start_date] && params[:end_date] && !params[:start_date].empty? && !params[:end_date].empty?)

      start_date = Date.parse(params[:start_date])
      end_date = Date.parse(params[:end_date])

      @rooms.each do |room|

        not_available = room.reservations.where(
        "((? <= start_date AND start_date <= ?)
        OR (? <= end_date AND end_date <= ?)
        OR (start_date < ? AND ? < end_date))
        AND status = ?",
        start_date, end_date,
        start_date, end_date,
        start_date, end_date,
        1
        ).limit(1)

        not_available_in_calendar = room.calendars.where(
        "status = ? AND ? <= day AND day <= ?",
        1, start_date, end_date
        ).limit(1)

        if not_available.length > 0 || not_available_in_calendar.length > 0
          @arrRooms.delete(room)
        end
      end
    end
  end

  def search
    @rooms_address = Room.where(active: true).all

    filters = {}

    if params[:q][:accommodate_gteq] && params[:q][:accommodate_gteq] != "" && params[:q][:accommodate_gteq] != "0"
      filters[:home_type] = { gte: params[:q][:accommodate_gteq] }
    end

    if is_bed_room_range?(params)
      filters[:bed_room] = params[:q][:bed_room_gteq].to_i..params[:q][:bed_room_lteq].to_i
    elsif params[:q][:bed_room_lteq] && params[:q][:bed_room_lteq] != "" && params[:q][:bed_room_lteq] != "0"
      filters[:bed_room] = { lte: params[:q][:bed_room_lteq] }
    elsif params[:q][:bed_room_gteq] && params[:q][:bed_room_gteq] != "" && params[:q][:bed_room_gteq] != "0"
      filters[:bed_room] = { gte: params[:q][:bed_room_gteq] }
    end

    if is_bath_room_range?(params)
      filters[:bath_room] = params[:q][:bath_room_gteq].to_i..params[:q][:bath_room_lteq].to_i
    elsif params[:q][:bath_room_lteq] && params[:q][:bath_room_lteq] != "" && params[:q][:bath_room_lteq] != "0"
      filters[:bath_room] = { lte: params[:q][:bath_room_lteq] }
    elsif params[:q][:bath_room_gteq] && params[:q][:bath_room_gteq] != "" && params[:q][:bath_room_gteq] != "0"
      filters[:bath_room] = { gte: params[:q][:bath_room_gteq] }
    end

    if is_price_range?(params)
      filters[:price] = params[:q][:price_gteq].to_f - 1..params[:q][:price_lteq].to_f + 1
    elsif params[:q][:price_lteq] && params[:q][:price_lteq] != "" && params[:q][:price_lteq] != "0"
      filters[:price] = { lte: params[:q][:price_lteq] }
    elsif params[:q][:price_gteq] && params[:q][:price_gteq] != "" && params[:q][:price_gteq] != "0"
      filters[:price] = { gte: params[:q][:price_gteq] }
    end

    if params[:q][:is_tv_eq] && params[:q][:is_tv_eq] != ""
      filters[:is_tv] = params[:q][:is_tv_eq]
    end

    if params[:q][:is_kitchen_eq] && params[:q][:is_kitchen_eq] != ""
      filters[:is_kitchen] = params[:q][:is_kitchen_eq]
    end

    if params[:q][:is_internet_eq] && params[:q][:is_internet_eq] != ""
      filters[:is_internet] = params[:q][:is_internet_eq]
    end

    if params[:q][:is_heating_eq] && params[:q][:is_heating_eq] != ""
      filters[:is_heating] = params[:q][:is_heating_eq]
    end

    if params[:q][:is_air_eq] && params[:q][:is_air_eq] != ""
      filters[:is_air] = params[:q][:is_air_eq]
    end

    if params[:q][:room_type_eq_any] && params[:q][:room_type_eq_any] != ""
      filters[:room_type] = params[:q][:room_type_eq_any]
    end

    # STEP 3
    search = "*"

    if params[:search] && params[:search] != ""
      search = params[:search]      
    end

    @rooms = @rooms_address.search search, where: filters, match: :word_middle

    @arrRooms = @rooms.to_a
    # STEP 4
    if (params[:start_date] && params[:end_date] && !params[:start_date].empty? && !params[:end_date].empty?)

      start_date = Date.parse(params[:start_date])
      end_date = Date.parse(params[:end_date])

      @rooms.each do |room|

        not_available = room.reservations.where(
        "((? <= start_date AND start_date <= ?)
        OR (? <= end_date AND end_date <= ?)
        OR (start_date < ? AND ? < end_date))
        AND status = ?",
        start_date, end_date,
        start_date, end_date,
        start_date, end_date,
        1
        ).limit(1)

        not_available_in_calendar = room.calendars.where(
        "status = ? AND ? <= day AND day <= ?",
        1, start_date, end_date
        ).limit(1)

        if not_available.length > 0 || not_available_in_calendar.length > 0
          @arrRooms.delete(room)
        end
      end
    end    
  end

  def index
    @rooms = Room.where(active: true).limit(3)
    # STEP 1
    if params[:search].present? && params[:search].strip != ""
      session[:loc_search] = params[:search]
    end

    # STEP 2
    if session[:loc_search] && session[:loc_search] != ""
      @rooms_address = Room.where(active: true).near(session[:loc_search], 5, order: 'distance')
    else
      @rooms_address = Room.where(active: true).all
    end

    # STEP 3
    @search = @rooms_address.ransack(params[:q])
    @rooms = @search.result

    @arrRooms = @rooms.to_a
    # STEP 4
    if (params[:start_date] && params[:end_date] && !params[:start_date].empty? && !params[:end_date].empty?)

      start_date = Date.parse(params[:start_date])
      end_date = Date.parse(params[:end_date])

      @rooms.each do |room|

        not_available = room.reservations.where(
        "((? <= start_date AND start_date <= ?)
        OR (? <= end_date AND end_date <= ?)
        OR (start_date < ? AND ? < end_date))
        AND status = ?",
        start_date, end_date,
        start_date, end_date,
        start_date, end_date,
        1
        ).limit(1)

        not_available_in_calendar = room.calendars.where(
        "status = ? AND ? <= day AND day <= ?",
        1, start_date, end_date
        ).limit(1)

        if not_available.length > 0 || not_available_in_calendar.length > 0
          @arrRooms.delete(room)
        end
      end
    end
  end

  private

  def is_bed_room_range?(params)
    return params[:q][:bed_room_gteq] && 
            params[:q][:bed_room_gteq] != "" && 
            params[:q][:bed_room_gteq] != "0" && 
            params[:q][:bed_room_lteq] && 
            params[:q][:bed_room_lteq] != "" && 
            params[:q][:bed_room_lteq] != "0"
  end

  def is_bath_room_range?(params)
    return params[:q][:bath_room_gteq] && 
            params[:q][:bath_room_gteq] != "" && 
            params[:q][:bath_room_gteq] != "0" && 
            params[:q][:bath_room_lteq] && 
            params[:q][:bath_room_lteq] != "" && 
            params[:q][:bath_room_lteq] != "0"
  end

  def is_price_range?(params)
    return params[:q][:price_gteq] && 
            params[:q][:price_gteq] != "" && 
            params[:q][:price_gteq] != "0" && 
            params[:q][:price_lteq] && 
            params[:q][:price_lteq] != "" && 
            params[:q][:price_lteq] != "0"
  end
end
