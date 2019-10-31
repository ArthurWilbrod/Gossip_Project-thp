class CommentsController < ApplicationController
  def update
  end

  def create
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    else
      comment = Comment.create(content:params[:user_comment],user_id:current_user.id,gossip_id:params[:gossip_id])
      puts "Created"
      puts comment.id
      redirect_to gossip_path(params[:gossip_id])
    end
  end

  def destroy
    @comment = Comment.find(params[:id].to_i)
    unless current_user && (current_user.id == @comment.user_id)
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    else
      puts "icicici"
      puts params
      @comment = Comment.find(params[:id].to_i)
      @comment.destroy
      redirect_to gossip_path(params[:gossip_id])
    end
  end

  def edit
    @comment= Comment.find(params[:id].to_i)
    unless current_user && (current_user.id == @comment.user_id)
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    else
      @comment= Comment.find(params[:id].to_i)
    end


    # Méthode qui récupère le potin concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
  end

  def update
    @comment= Comment.find(params[:id].to_i)
    unless current_user && (current_user.id == @comment.user_id)
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    else
      @comment= Comment.find(params[:id].to_i)
      puts params.inspect
      comment_params = params.require(:comment).permit(:content)

      #@gossip = Gossip.find(params[:id])
      if @comment.update(comment_params)
        puts params[:gossip_id]

        redirect_to gossip_path(params[:gossip_id])
      else
        render :edit
      end
      end
    #else
      #render :edit
    #end
    # Méthode qui met à jour le potin à partir du contenu du formulaire de edit.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params
    # Une fois la modification faite, on redirige généralement vers la méthode show (pour afficher le potin modifié)
  end
end
