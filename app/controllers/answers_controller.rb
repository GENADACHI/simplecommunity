class AnswersController < ApplicationController
    def index
        redirect_to '/discussions'
    end

    def show
        redirect_to '/discussions'
    end

    def new 
        @comment = Comment.find(params[:comment_id])
        @answer = Answer.new
    end

    def edit 
        redirect_to '/discussions'
    end

    def create 
        @answer =  Answer.new(answer_params)
          if @answer.save 
            redirect_to '/discussions'
          else
            render :'discussions/show'
          end
    end
    
    def update
        redirect_to '/discussions'
    end

    def destroy
        redirect_to '/discussions'
    end

    private
    def set_answer
        @answer = Answer.find(params[:id])
    end
       
    def answer_params
        params.require(:answer).permit(:comment_id, :content)
    end
  
end
