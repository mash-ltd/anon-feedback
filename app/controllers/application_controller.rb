class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!, :do_common_stuff
  
  def do_common_stuff
    @new_post = Post.new
    @projects = Project.all(order: "name ASC")
  end
end
