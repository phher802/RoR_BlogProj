class PostsController < ApplicationController
	#gets all the posts/Loops through all posts in descending order
	def index
		@posts = Post.all.order("created_at DESC")
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

	def show
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		#server-side check
		if @post.update(post_params)
			redirect_to @post
		else
			render 'edit'
		end
	end

	def edit
		@post = Post.find(params[:id])
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy

		redirect_to posts_path
	end



	private
	#requiring params/a secruity feature of rails
	#if not initalized here, you can't pass data to the server
	def post_params
		params.require(:post).permit(:title, :content)
	end


end
