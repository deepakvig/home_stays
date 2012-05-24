class SearchController < ApplicationController
  def new
    @search = Search.new
  end

  def create
    @search = Search.new(params[:search])
    if @search.valid?
      @results, @pending_capacity = @search.bookings
    end
  end

end
