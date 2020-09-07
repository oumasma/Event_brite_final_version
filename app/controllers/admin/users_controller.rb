class Admin::UsersController < ApplicationController
    before_action :check_if_admin #quand on parle d'admin on parle du SUPERADMIN

    def index
       
        @total_users = User.all.count

    end

    def new 
         @user = User.new
    end

    def show
        
    end

    def create  
        @user = User.new(user_params)
        @user.save
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to admin_user_path
    end 

    private
    
    def check_if_admin
        unless current_user.is_admin
            flash[:alert] = "Vous ne pouvez pas accéder à cette page, car vous n'êtes pas admin"
            redirect_to events_path
        end
    end
end