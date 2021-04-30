class CommentsController < ApplicationController
   before_action :set_comment, only: [:show, :edit, :update, :destroy]
 
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
  
  def create
    @comment = Comment.new(comment_params)
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
    def set_discusstion
      @discusstion = Discussion.find(params[:discussion_id])
      
    end
    
    def set_comment
      @comment = Comment.find(params[:id])
    end
    
    def comment_params
      params.require(:comment).permit(:content, :discussion_id)
    end
    
end
