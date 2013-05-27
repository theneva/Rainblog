class CommentsController < ApplicationController
	def create
		@post = Post.find(params[:post_id])

		# Minor hack in order to get the user id assigned properly
		@comment = @post.comments.new(params[:comment])
		@comment.user_id = current_user.id
		
		respond_to do |format|
			if @comment.save
				redirect_to post_path(@post)
			else
		        format.html { redirect_to @post, { notice: "The comment field can't be blank" } } # TODO superhacks to give feedback -- should use the errors hash, but how the hell does one even do that
		        format.json { render json: @user.errors, status: :unprocessable_entity }
	      	end
      	end
	end

	def destroy
		@comment = Comment.find(params[:id])
		@comment.destroy

    	respond_to do |format|
      		format.html { redirect_to posts_url }
      		format.json { head :no_content }
	    end
	end
end
