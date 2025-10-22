class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound do |e|
    render json: { error: e.message }, status: :not_found
  end

  private
  def paginate(scope)
    limit  = params[:limit].to_i > 0 ? params[:limit].to_i : 50
    offset = params[:offset].to_i >= 0 ? params[:offset].to_i : 0
    scope.limit(limit).offset(offset)
  end
end
