class LikesController < ApplicationController
  def update
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    else
      puts "icLLLLi"
      puts params[:gossip_id]
      @gossip = Gossip.find(params[:gossip_id])
      if Like.create(gossip_id: params[:gossip_id],user_id: current_user.id)

        permitted = params.require(:gossip).permit(:gossip_like)
        Gossip.find(params[:gossip_id]).update!(permitted)

        @gossip = Gossip.find(params[:gossip_id])
        gossip_params = params.require(:gossip).permit(:gossip_like)

        #@gossip = Gossip.find(params[:id])
        if @comment.update(gossip_params)
          puts params[:gossip_id]

          redirect_to gossips_path
        else
          render :edit
        end
      end
    end
  end

end
