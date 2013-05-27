class BrohoovesController < ApplicationController

  # POST /brohooves
  # POST /brohooves.json
  def create
    @brohoof = Brohoof.new(params[:brohoof])

    respond_to do |format|
      if @brohoof.save
        format.html { redirect_to @brohoof, notice: 'Brohoof was successfully created.' }
        format.json { render json: @brohoof, status: :created, location: @brohoof }
      else
        format.html { render action: "new" }
        format.json { render json: @brohoof.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /brohooves/1
  # DELETE /brohooves/1.json
  def destroy
    @brohoof = Brohoof.find(params[:id])
    @brohoof.destroy

    respond_to do |format|
      format.html { redirect_to brohooves_url }
      format.json { head :no_content }
    end
  end
end
