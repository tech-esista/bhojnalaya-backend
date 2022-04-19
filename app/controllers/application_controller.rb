class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  def render_result_json(object)
    obj = {
      status: 'success',
      contents: object
    }
    render json: obj
  end

  def render_success_message(message)
    obj = {
      status: 'success',
      message: message
    }
    render json: obj
  end

  def render_error_message(message)
    obj = {
      status: 'error',
      message: message
    }
    render json: obj
  end

  def has_sufficient_params(api_params)
    api_params.each do |key|
      unless params[key].present?
        render_error_message "#{key.humanize} not present!"
        return false
      end
    end
    true
  end
end
