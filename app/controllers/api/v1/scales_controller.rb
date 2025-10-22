module Api; module V1
  class ScalesController < ApplicationController
    def index;  render json: paginate(Scale.order(:id)); end
    def show;   render json: Scale.find(params[:id]); end
    def create; scale = Scale.create!(scale_params); render json: scale, status: :created; end
    def update; s = Scale.find(params[:id]); s.update!(scale_params); render json: s; end
    def destroy; Scale.find(params[:id]).destroy!; head :no_content; end
    private
    def scale_params; params.require(:scale).permit(:title, :version, :doi); end
  end
end; end
