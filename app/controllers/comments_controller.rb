class CommentsController < ApplicationController
   before_action :set_discusstion
 
  def index
    @discussion = Discussion.find(params[:discussion_id])
    @comment = Comment.all
  end
 
  def new
    @discussion = Discussion.find(params[:discussion_id])
    @comment = Comment.new
  end

  def edit
    @discussion = Discussion.find(params[:discussion_id])
    @comment = Comment.find(params[:id])
  end
  
  def create
    @comment = Comment.new(comment_params)
    @comment.discussion_id = params[:discussion_id]
    
    if @comment.save
      redirect_to discussion_path(@comment.discussion_id), notice: 'コメントが登録されました。'
    else
      render :new
    end
  end
  
  def updated
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
    def set_discusstion
      @discusstion = Discussion.find(params[:discussion_id])
    end
    
    def comment_params
      params.require(:comment).permit(:content, :discussion_id)
    end
    
end
