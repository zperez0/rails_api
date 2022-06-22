class ApplicationController < ActionController::API
  include Response

  # rescue_from ActiveRecord::RecordNotFound do |exception|
  #   json_response({ message: exception.message }, :not_found)

  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

  def render_not_found_response(exception)
    json_response({ message: exception.message }, :not_found)
  end

  def render_unprocessable_entity_response(exception)
    json_response({ message: exception.message }, :unprocessable_entity)
  end
end
