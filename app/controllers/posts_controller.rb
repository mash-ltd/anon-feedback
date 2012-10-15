class PostsController < ApplicationController

  def index
    @posts = Post.all(order: "created_at DESC")
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    @projects = Project.all(order: "name ASC")
  end

  def create
    @post = Post.new(params[:post])
    if @post.post_with_identity == '1'
      @post.user_id = current_user.id
    end
    if @post.save
      current_user.up_vote(@post)
      redirect_to post_path(@post), :notice => "Successfully created feedback."
    else
      render :action => 'new'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path, alert: "Successfully destroyed post."
  end

  ##################
  # Custom Methods #
  ##################

  def vote_up
    @post = Post.find(params[:id])
    begin
      current_user.up_vote(@post)
      redirect_to :back
      return
    rescue MakeVoteable::Exceptions::AlreadyVotedError
      redirect_to :back, alert: "You already voted up this post"
    end
  end

  def vote_down
    @post = Post.find(params[:id])
    begin
      current_user.down_vote(@post)
      redirect_to :back
      return
    rescue MakeVoteable::Exceptions::AlreadyVotedError
      redirect_to :back, alert: "You already voted down this post"
    end
  end

  def nullify_vote
    @post = Post.find(params[:id])
    begin
      current_user.unvote(@post)
      redirect_to :back
      return
    rescue MakeVoteable::Exceptions::NotVotedError
      redirect_to :back, alert: "You haven't voted on this feedback to remove it"
    end
  end
end