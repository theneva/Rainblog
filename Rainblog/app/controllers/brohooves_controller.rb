class BrohoovesController < ApplicationController

  # POST /brohooves
  # POST /brohooves.json
  def create

    @post = Post.find(params[:post_id])

    # Minor hack in order to get the user id assigned properly
    @brohoof = @post.brohooves.new(params[:brohoof])
    @brohoof.user_id = current_user.id

    respond_to do |format|
      @brohoof.save
      format.html { redirect_to :back }
      format.json { render json: @brohoof, status: :created }
    end
  end

  # DELETE /brohooves/1
  # DELETE /brohooves/1.json
  def destroy
    @brohoof = Brohoof.find(params[:id])
    @brohoof.destroy

    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end
end
