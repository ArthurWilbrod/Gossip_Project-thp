class GossipsController < ApplicationController
  def index
    # Méthode qui récupère tous les potins et les envoie à la view index (index.html.erb) pour affichage
  end

  def show
    #@comment=Comment.create(content: "", user_id: 1, gossip_id: params[:id])
    # Méthode qui récupère le potin concerné et l'envoie à la view show (show.html.erb) pour affichage
  end

  def new
    # Méthode qui crée un potin vide et l'envoie à une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
  unless current_user
    flash[:danger] = "Please log in."
    redirect_to new_session_path
  else
  end

  end

  def create

    puts params
    if current_user
      user_id_to_add = current_user.id
    else
      user_id_to_add = User.all.first.id
    end
    user_id = current_user.id
    gossip= Gossip.create(title: params[:gossip_title], content: params[:gossip_content], user_id: user_id_to_add)
    puts gossip
    redirect_to gossips_path
    # Méthode qui créé un potin à partir du contenu du formulaire de new.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params (ton meilleur pote)
    # Une fois la création faite, on redirige généralement vers la méthode show (pour afficher le potin créé)
  end

  def edit
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    else
      @gossip= Gossip.find(params[:id])
    end



    # Méthode qui récupère le potin concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
  end

  def update
    @gossip= Gossip.find(params[:id])
    puts params.inspect
    gossip_params = params.require(:gossip).permit(:title,:content)

    #@gossip = Gossip.find(params[:id])
    if @gossip.update(gossip_params)
      redirect_to gossip_path(params[:id])
    else
      render :edit
    end
    #else
      #render :edit
    #end
    # Méthode qui met à jour le potin à partir du contenu du formulaire de edit.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params
    # Une fois la modification faite, on redirige généralement vers la méthode show (pour afficher le potin modifié)
  end

  def destroy
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    else

      @gossip = Gossip.find(params[:id])
      @gossip.destroy
      redirect_to gossips_path
  end


    # Méthode qui récupère le potin concerné et le détruit en base
    # Une fois la suppression faite, on redirige généralement vers la méthode index (pour afficher la liste à jour)
  end
end
