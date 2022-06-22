require "active_support/concern"

module Response
  def json_response(object, status = :ok)
    render json: object, status: status
  end
end

# module Response
#   extended ActiveSupport::Concern

#   included do
#     def json_response(object, status = :ok)
#       render json: object, status: status

#       rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
#       rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

#       def render_not_found_response(exception)
#         json_response({ message: exception.message }, :not_found)
#       end

#       def render_unprocessable_entity_response(exception)
#         json_response({ message: exception.message }, :unprocessable_entity)
#       end
#     end
#   end
# end
