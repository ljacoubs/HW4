class PlacesController < ApplicationController
  before_action :current_user
  
  def index
    @places = Place.all
    @posts = Post.all
  end

  def show
    @place = Place.find_by({ "id" => params["id"] })
    @posts = Post.where({ "place_id" => @place["id"] })
  end

  def new
    @place = Place.new
  end

  def create
    if @current_user
    @place = Place.new
    @place["name"] = params["place"]["name"]
    @place["user_id"] = @current_user["id"]
    @place.save
    else 
      flash["notice"] = "Login first"
    end
    redirect_to "/places"
  end
end
