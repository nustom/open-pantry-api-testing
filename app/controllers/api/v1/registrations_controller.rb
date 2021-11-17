class Api::V1::RegistrationsController < Devise::RegistrationsController
  def create
    build_resource user_params
    resource.save
    sign_up(resource_name, resource) if resource.persisted?
    render json: {user: resource}
  end


  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
