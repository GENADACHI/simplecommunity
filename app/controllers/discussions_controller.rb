class DiscussionsController < ApplicationController
  def index
    @discussions = Discussion.page(params[:page]).per(3)
  end

  def show
    @discussion = Discussion.find(params[:id])
    @comments = @discussion.comments.includes(:member).all
  end

  def new
    @discussion = Discussion.new
  end

  def edit
    @discussion = Discussion.find(params[:id])
  end
  
  def create
    @discussion = Discussion.new(discussion_params)
    if @discussion.save
      redirect_to @discussion, notice: "ディスカッションテーマ「#{@discussion.theme}」を登録しました。"
    else
      render:new
    end
  end
  
  def update
    discussion = Discussion.find(params[:id])
    if discussion.update(discussion_params)
    redirect_to discussions_url, notice: "ディスカッションテーマ「#{discussion.theme}」を更新しました。"
    else
      render:new
    end
  end
    
  def destroy
    discussion = Discussion.find(params[:id])
    discussion.destroy
    redirect_to discussions_url, notice: "ディスカッションテーマ「#{discussion.theme}」を削除しました。"
  end
  
private
  def discussion_params
    params.require(:discussion).permit(:theme, :description)
  end
end
