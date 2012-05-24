class SearchController < ApplicationController
  def new
    @search = Search.new
    @results = []
  end

  def create
    @search = Search.new(params[:search])
    if @search.valid?
      booked_rooms = @search.bookings
      total_rooms = Room.where("capacity >= ?",@search.number_of_guests.to_i )
      p total_rooms
      @results = total_rooms - booked_rooms
    end
    render :action => 'new'
  end

end
