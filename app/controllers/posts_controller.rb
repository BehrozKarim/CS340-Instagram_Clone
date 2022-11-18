class PostsController < ApplicationController

    def new
        @post = Post.new
    end
    

    def create
        @post = Post.new(post_params)
        if @post.save
            redirect_to dashboard_path, flash: { success: "Post created successfully" }
        else
            redirect_to new_post_path, flash: { error: "Post not created" }
        end
    end

    def show
        # @post = Post.find(params[:id])
    end

    private

    def post_params
        params.require(:post).permit(:image, :image_cache)
    end
    
end