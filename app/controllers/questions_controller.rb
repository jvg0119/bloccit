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
    @question = Question.new(params.require(:question).permit(:title, :body, :resolved))
    # raise # this will short-circuit the method
    if @question.save
      flash[:notice] = "Question was saved."
      redirect_to @question
    else
      flash[:error] = "There was an error saving the question. Please try again."
      render :new
    end
  end

  def edit
    @questions = Question.find(params[:id])
  end

def update
    @question = Question.find(params[:id])
    if @question.update_attributes(params.require(:question).permit(:title, :body, :resolved))
      flash[:notice] = "The question was updated."
      redirect_to @question
    else
      flash[:error] = "There was a problem saving the question. Please try again."
      render "edit"
    end
  end


def destroy
  @question = Question.find(params[:id])
  @question.destroy
  redirect_to questions_path, :notice => "Your question has been deleted"
end

end

