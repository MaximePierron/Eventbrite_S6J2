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
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
    
        # Si le user n'est pas l'auteur on redirige vers la page du potin sans pouvoir l'éditer, gràce à is_not_author?
        is_not_author?
    
        if @user.update(first_name: params[:first_name],
          last_name: params[:last_name],
          description: params[:description])
    
          flash[:success] = "Les infos ont été modifié !"
          redirect_to user_path(@user)
        else
          render 'edit'
        end
      end

      def destroy
        @user = User.find(params[:id])
        
        if !is_not_author? 
          @user.destroy
          flash[:alert] = "Le compte a été effacé !"
          redirect_to root_path
        end
      end

    # méthode pour sécuriser l'édition et la suppression des users
    def is_not_author?
    if current_user != @user
      flash[:alert] = "Tu n'es pas propriétaire de ce compte !"
      redirect_to root_path
    end
  end

end
