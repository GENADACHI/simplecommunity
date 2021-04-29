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
  end
  
  def create
    @comment =  @discussion.comments.build(params_comment)
    if @comment.save
      redirect_to discussion_path(@discussion), notice: 'コメントが登録されました。'
    else
      render 'discusstion/show'
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
    if @comment.destroy
      redirect_to discussion_path(@comment.discussion_id), notice: 'コメントは削除されました。'
    else
      render 'discusstion/show'
    end
  end
  
  private
    def set_discusstion
      @discusstion = Discussion.find(params[:discussion_id])
    end
end
