class UserappController < ApplicationController

def login 
  resource = User.find_for_database_authentication(email: params[:email])

  return invalid_login_attempt unless resource

  if resource.valid_password?(params[:password])
    render :json => resource
  else
    render :json => false
  end 
end	

end
