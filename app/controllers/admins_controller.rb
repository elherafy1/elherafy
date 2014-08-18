class AdminsController < ApplicationController
  before_filter :correct_admin, only: [:edit, :update]
  before_filter :admin_user, only: :destroy

def edit

end

def new
  
end

def update
   if @workerer.update_attributes(worker_params)
      sign_in @admin
      flash[:notice] = "Profile updated"
      redirect_to @worker
      #handel a successful update
    else
     render 'edit'
   end
end





end