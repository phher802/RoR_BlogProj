class CommentsController < ApplicationController
	#need to have a relationship between post and comment models

	def create
		@post = Post.find(params[:post_id])
	end

	def destroy
	end

end
