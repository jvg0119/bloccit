class SummariesController < ApplicationController
  def show
  	
    @summary = Summary.find(params[:id])
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
  end    

  def new
    @summary = Summary.new
    @post = Post.find(params[:post_id])
    @topic = Topic.find(params[:topic_id])
  end

  def create
  	
    @topic = Topic.find(params[:topic_id])
    # @post = @topic.posts.find(params[:post_id])
    @post = Post.find(params[:post_id])
    @summary = @post.summary(params[:id])
    @summary = Summary.new(params.require(:summary).permit(:context))

    #authorize @topic
  	#@summary.save!
    if @summary.save!
  		redirect_to [@topic, @post] notice: "Summary was saved successfully."
  	else
  		flash[:error] = "Error creating summary. Please try again."
  		render :new
  	end
  end

end

