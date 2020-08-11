class EventsController < ApplicationController
    before_action :authenticate_user, only: [:new, :create, :show]
  
    def new
    @event = Event.new
    end
  
    def create
      @event = Event.new(start_date: params[:start_date],
        duration: params[:duration],
        title: params[:title],
        description: params[:description],
        price: params[:price],
        location: params[:location],
        user_id: params[user_id])
  
      if @event.save
        flash[:success] = "Evènement ajouté !"
        redirect_to events_path #Affiche l'index des events
      else
        render 'new' # Reste sur la view de events New.
      end
    end
  
    def show
      # On stock dans une variable l'entrée de la BDD qui
      # correspond à notre event via le paramètre récupéré dans l'URL
      @event = Event.find(params[:id])
    end
  
    def index
      # On récupère tous les events dans une variable
      @all_events = Event.all.reverse # On applique reverse pour avoir les derniers events en premier
      puts "*"*60
      puts "Fetching database for events"
      # On vérifie que tout fonctionne sur le server avec des puts dans le terminal
      puts "-"*60    
      puts @all_events 
      puts "*"*60
    end
  
    def edit
      @event = Event.find(params[:id])
  
      # Si l'utilisateur n'est pas l'auteur on redirige vers la page du potin sans pouvoir l'éditer
      is_not_author? 
    end
  
    def update
      @event = Event.find(params[:id])
  
      # Si le user n'est pas l'auteur on redirige vers la page du potin sans pouvoir l'éditer, gràce à is_not_author?
      is_not_author?
  
      if @event.update(start_date: params[:start_date],
        duration: params[:duration],
        title: params[:title],
        description: params[:description],
        price: params[:price],
        location: params[:location])
  
        flash[:success] = "L'évènement a été modifié !"
        redirect_to event_path
      else
        render 'edit'
      end
    end
  
    def destroy
      @event = Event.find(params[:id])
      
      if !is_not_author? 
        @event.destroy
        flash[:alert] = "L'évènement a été effacé !"
        redirect_to events_path
      end
    end
  
    # méthode pour sécuriser l'édition et la suppression des gossips
    def is_not_author?
      if current_user != @event.user
        flash[:alert] = "Tu n'es pas l'auteur de cet évènement!"
        redirect_to event_path
      end
    end
end
  