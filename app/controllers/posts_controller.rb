class PostsController < ApplicationController
  before_action :current_user

  def index
    @posts = Post.all 
  end

  def new
    @post = Post.new
    @post.place_id = params["place_id"]
  end

  def create
    if @current_user
      @post = Post.new
      @post["title"] = params["post"]["title"]
      @post["description"] = params["post"]["description"]
      @post["posted_on"] = params["post"]["posted_on"]
      @post["place_id"] = params["post"]["place_id"]
      @post["user_id"] = @current_user["id"]
      @post.save

~~~~~~~~~~
def create
  if @current_user
    @post = Post.new
    @post["body"] = params["post"]["body"]
    @post["image"] = params["post"]["image"]
    @post.uploaded_image.attach(params["post"]["uploaded_image"])
    @post["user_id"] = @current_user["id"]
    @post.save

~~~~~~~~~
      
  else 
    flash["notice"] = "Login first"
  end
    redirect_to "/places/#{@post["place_id"]}"
  end

end
