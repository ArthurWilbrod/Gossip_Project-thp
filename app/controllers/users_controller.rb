class UsersController < ApplicationController

  def new
    # Méthode qui crée un potin vide et l'envoie à une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
  end

  def create
    puts "ICICICIIC"
    puts params
    user= User.create(first_name: params[:first_name], last_name: params[:last_name],description:  params[:description],email:  params[:email],age:  params[:age].to_i,city_id:  City.all.first.id,password:  params[:user_password])
    puts user
    if user && user.authenticate(params[:user_password])
      log_in(user)

      flash.now[:notice] = "You have successfully log in"
      redirect_to gossips_path
      # redirige où tu veux, avec un flash ou pas
    else
      puts "EROROROR"
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end

  end



end
