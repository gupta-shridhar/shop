# frozen_string_literal: true

class GraphqlController < ApplicationController
  protect_from_forgery with: :null_session

  def execute
    unless authorized?
      return render json: { errors: [{ message: "Unauthorized" }] }, status: :unauthorized
    end

    variables = prepare_variables(params[:variables])
    context = { current_token: request.headers['Authorization'].to_s.split(' ').last }
    result = ShopApiSchema.execute(params[:query], variables:, context:)
    render json: result
  end

  private

  def authorized?
    token = request.headers['Authorization'].to_s.split(' ').last
    ActiveSupport::SecurityUtils.secure_compare(token.to_s, ENV.fetch('API_TOKEN', ''))
  rescue KeyError
    false
  end

  # # Handle variables in form data, JSON body, or a blank value
  def prepare_variables(variables_param)
    case variables_param
    when String
      if variables_param.present?
        JSON.parse(variables_param) || {}
      else
        {}
      end
    when Hash
      variables_param
    when ActionController::Parameters
      variables_param.to_unsafe_hash # GraphQL-Ruby will validate name and type of incoming variables.
    when nil
      {}
    else
      raise ArgumentError, "Unexpected parameter: #{variables_param}"
    end
  end
end
