class CommentsController < ApplicationController
	#need to have a relationship between post and comment models

	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.create((params[:comment]).permit(:name, :comment))
		redirect_to @post.path(@post)
	end

	def destroy
	end

end
