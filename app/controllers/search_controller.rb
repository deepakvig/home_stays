class SearchController < ApplicationController
  def new
    @search = Search.new
  end

  def create
    @search = Search.new(params[:search])
    if @search.valid?
      booked_rooms = @search.bookings
      total_rooms = Room.all
      p booked_rooms 
      redirect_to root_url
    else
      render :action => 'new'
    end
  end

end
