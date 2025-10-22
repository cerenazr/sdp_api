module Api; module V1
  class SurveysController < ApplicationController
    before_action :set_user, only: [:index, :create]
    def index; render json: paginate(@user ? @user.surveys.order(:id) : Survey.order(:id)); end
    def show;  render json: Survey.find(params[:id]); end
    def create; survey = @user.surveys.create!(survey_params); render json: survey, status: :created; end
    def update; s = Survey.find(params[:id]); s.update!(survey_params); render json: s; end
    def destroy; Survey.find(params[:id]).destroy!; head :no_content; end
    private
    def set_user; @user = User.find(params[:user_id]) if params[:user_id]; end
    def survey_params; params.require(:survey).permit(:title, :status, :scale_id); end
  end
end; end
