class SessionsController < ApplicationController

  def new
    # Méthode qui crée un potin vide et l'envoie à une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
  end

  def create

    # cherche s'il existe un utilisateur en base avec l’e-mail
    user = User.find_by(email: params[:user_email])


    # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe
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

  def destroy

    session.delete(:user_id)
    redirect_to gossips_path


  end




end
