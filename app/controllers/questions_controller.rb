class QuestionsController < ApplicationController

	def index
  		@questions = Question.all
  	end

  	def show
  		@question = Question.find(params[:id])
  	end

  	def new
  		@question = Question.new
  	end

  	def create
  		@question = Question.new(params.require(:question).permit(:title, :body))
  		if @question.save
  			flash[:notice] = "Question was saved"
  			redirect_to @question
  		else
  			flash[:error] = "Error saving your question. Try again"
  			render :new
  		end
  	end

  	def edit
    	@question = Question.find(params[:id])
  	end

	def update
    	@question = Question.find(params[:id])
    	if @question.update_attributes(params.require(:question).permit(:title, :body))
      		flash[:notice] =  "Question was updated"
      		redirect_to @question
    	else
      		flash[:error] = "There was an error saving the question. Please try again"
      		render :edit
    	end
  	end

  	def resolve
  		@question = Question.find(params[:question_id])
  		@question.resolved  ? @question.resolved = false : @question.resolved = true

  		if @question.save
  			flash[:notice]= "Questions was answered"
  		else
  			flash[:error] = "Question failed to answer"
  		end
  		redirect_to @question
  	end
end
