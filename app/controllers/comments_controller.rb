class CommentsController < ApplicationController
   before_action :set_discussion
 
  def index
    @discussion = Discussion.find(params[:discussion_id])
    @comment = Comment.all
  end
 
  def new
    @discussion = Discussion.find(params[:discussion_id])
    @member = current_member
    @comment = Comment.new
  end

  def edit
    @discussion = Discussion.find(params[:discussion_id])
    @comment = @discussion.comments.find(params[:id])
  end
  
  def show
    @comment = @discussion.comments.find(params[:id])
  end

  def create
    @comment =  @discussion.comments.build(comment_params)
    if @comment.save
      redirect_to discussion_path(@discussion), notice: 'コメントが登録されました'
    else
      render :'discussions/show'
    end
  end
  
  def update
    @comment = @discussion.comments.find(params[:id])
    if @comment.update(comment_params)
      redirect_to discussion_path(@comment.discussion_id), notice: 'コメントが更新されました。'
    else
      render :edit
    end
  end
  
  def destroy
    @comment = @discussion.comments.find(params[:id])
    @comment.destroy
      redirect_to discussion_path(@comment.discussion_id), notice: 'コメントは削除されました。'
  end
  
  private
  def set_discussion
    @discussion = Discussion.find(params[:discussion_id])
  end
  
  def comment_params
    params.require(:comment).permit(:content)
  end
end