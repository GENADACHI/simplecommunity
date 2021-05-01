class CommentsController < ApplicationController
   before_action :set_discussion
 
  def index
    @discussion = Discussion.find(params[:discussion_id])
    @comment = Comment.all
  end
 
  def new
    @discussion = Discussion.find(params[:discussion_id])
    @comment = Comment.new
  end

  def edit
  end
  
  def show
    @comment = @discussion.comments.find(params[:id])
  end
  
  def create
    @comment = Comment.new(params[:id])
    @comment.discussion_id = params[:discussion_id]
    
    if @comment.save
      redirect_to discussion_path(@comment.discussion_id), notice: 'コメントが登録されました。'
    else
      render :new
    end
  end
  
  def update
    if @comment.update(comment_params)
      redirect_to discussion_path(@comment.discussion_id), notice: 'コメントが更新されました。'
    else
      render :edit
    end
  end
  
  def destroy
    @comment.destroy
      redirect_to discussion_path(@comment.discussion_id), notice: 'コメントは削除されました。'
  end
  
  private
  def set_discussion
    @discussion = Discussion.find(params[:discussion_id])
  end
end