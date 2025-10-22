module Api; module V1
  class ResponsesController < ApplicationController
    before_action :find_parent
    def index; render json: paginate(@parent.responses.order(:id)); end
    def create; r = @parent.responses.create!(response_params); render json: r, status: :created; end
    private
    def find_parent
      @parent = params[:survey_id] ? Survey.find(params[:survey_id]) :
                params[:question_id] ? Question.find(params[:question_id]) : nil
      raise ActiveRecord::RecordNotFound, "Parent not found" unless @parent
    end
    def response_params; params.require(:response).permit(:value, :question_id, :user_id); end
  end
end; end
