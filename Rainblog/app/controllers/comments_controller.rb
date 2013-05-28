class CommentsController < ApplicationController
	def create
		@post = Post.find(params[:post_id])

		# Minor hack in order to get the user id assigned properly
		@comment = @post.comments.new(params[:comment])
		@comment.user_id = current_user.id
		
		respond_to do |format|
			if @comment.save
				format.html { redirect_to :back }
     			format.json { render json: @comment, status: :created }
			else
		        format.html { redirect_to @post, { alert: "The comment field can't be blank" } } # TODO superhacks to give feedback -- should use the errors hash, but how the hell does one even do that
		        format.json { render json: @comment.errors, status: :unprocessable_entity }
	      	end
      	end
	end

	def destroy

		@comment = Comment.find(params[:id])
		@comment.destroy

    	respond_to do |format|
      		format.html { redirect_to :back }
      		format.json { head :no_content }
	    end
	end
end
