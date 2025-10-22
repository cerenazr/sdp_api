module Api; module V1
  class QuestionsController < ApplicationController
    before_action :set_user, only: [:index, :create]
    def index; render json: paginate(@user ? @user.questions.order(:id) : Question.order(:id)); end
    def show;  render json: Question.find(params[:id]); end
    def create; q = @user.questions.create!(question_params); render json: q, status: :created; end
    def update; q = Question.find(params[:id]); q.update!(question_params); render json: q; end
    def destroy; Question.find(params[:id]).destroy!; head :no_content; end
    private
    def set_user; @user = User.find(params[:user_id]) if params[:user_id]; end
    def question_params; params.require(:question).permit(:body, :kind, :required, :scale_id); end
  end
end; end
