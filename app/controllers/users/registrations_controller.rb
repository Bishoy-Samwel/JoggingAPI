# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    respond_to :json

    private

    def respond_with(resource, _opts = {})
      resource.persisted? ? register_success : register_failed
    end

    def register_success
      render json: {
        code: 200,
        message: "Signed up.",
        user: current_user
      }, status: :ok
    end

    def register_failed
      render json: {message: "Signed up failure.", errors: @user.errors.full_messages}, status: :unprocessable_entity
    end
  end
end
