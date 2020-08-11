class UsersController < ApplicationController

	def new
    @user = User.new
    end

    def create

        @user = User.new(email: params[:email],
        password: params[:password],
        password_confirmation: params[:password_confirmation]
        )

        if @user.save
            flash[:success] = "Bienvenue #{@user.first_name}!"
            log_in(@user)
            redirect_to root_path #Affiche l'index des gossips
        else
            render 'new' # Reste sur la view de gossips New.
        end   
    end

    def show
        @user = User.find(params[:id])
    end

    def index
    end

    def edit
    end

    def update
    end

    def destroy
    end
end
