class PostsController < ApplicationController

	def index
	end

	#call post method and call a new post
	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)

		if @post.save
			redirect_to @post
		else
			render 'new'
		end
		
	end

	private
	#requiring params/a secruity feature of rails
	#if not initalized here, you can't pass data to the server
	def post_params
		params.require(:post).permit(:title, :content)
	end


end
