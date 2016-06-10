class ApplicationController < ActionController::API
  include Knock::Authenticable
  include Pundit
  after_action :verify_authorized, except: :index
  after_action :verify_policy_scoped, only: :index

  def permitted_params(record)
    policy = policy(record)
    attributes = policy.send(:permitted_attributes)
    params.require(:data).require(:attributes).permit(attributes)
  end

  def respond_with_errors(object)
    render json: object,
           status: :unprocessable_entity,
           adapter: :json_api,
           serializer: ActiveModel::Serializer::ErrorSerializer
  end
end
