class LikesController < ApplicationController
    before_action :set_model
    def create
      @like = @model.likes.build(likes_params)
      if @like.save
      end
    end
    private
      def set_model
        @model = nil
        if params[discussion_id].present?
          @model = Discuttion.find(params[discussion_id])
        elsif (params[:comment_id].present?
          @model = Comment.find(params[:comment_id)
        end
      end
end
