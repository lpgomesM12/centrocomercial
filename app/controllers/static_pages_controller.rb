class StaticPagesController < ApplicationController
  before_action :authenticate_user!
  def index
   @empresa = Empresa.new

   if params[:id]  != "" 
   
     @User = User.find(current_user.id)
     
     @User.empresa_id = params[:id]
     @User.save

   end

  end
end
