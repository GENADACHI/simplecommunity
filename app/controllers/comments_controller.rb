class CommentsController < ApplicationController
   before_action :set_discusstion
 
  def new
    @comment = Comment.new
  end

  def edit
  end
  
  def create
    @comment =  @discussion.comments.build(params_comment)
    if @comment.save
      redirect_to discussion_path(@discussion), notice: 'コメントが登録されました'
    else
      render 'discusstion/show'
    end
  end
  private
    def set_discusstion
      @discusstion = Discusstion.find(params[:discussion_id])
    end
end
