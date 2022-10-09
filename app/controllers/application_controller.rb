class ApplicationController < ActionController::API
  skip_before_action :verify_authenticity_token,  raise: false
  include Pundit::Authorization

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    render :json => { :error => 'Unotharized request' }, :status => 401
  end
end
