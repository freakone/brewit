module Api
  module Internal
    class BetaUsersController < ApiController
      def index
        render json: BetaUser.all
      end

      def create
        gate = Gate.rules do
          required :name
          required :email
        end
        result = gate.verify(params)
        if result.valid?
          beta_user = BetaUser.create!(result.attributes)
          BetaUserMailer.welcome_email(beta_user).deliver_now
          render json: beta_user, status: 201
        else
          render json: {status: "error", message: "Invalid params" }, status: 400
        end
      end
    end
  end
end
