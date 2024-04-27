class StoringsController < ApplicationController
  def index
    @storings = Storing.all
    render json: @storings
  end
end

