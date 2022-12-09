class PostsController < ApplicationController
    before_action :authenticate_account!
    before_action :set_post, only: [:show]
    before_action :find_post, only: [:edit, :update, :destroy]
    def new
        @post = Post.new
    end
    

    def create
        @post = Post.new(post_params)
        @post.account_id = current_account.id if account_signed_in?
        
        if @post.save
            redirect_to dashboard_path, flash: { success: "Post created successfully" }
        else
            redirect_to new_post_path, flash: { error: "Post not created" }
        end
    end

    def show
        # @post = Post.find(params[:id])
        @comment = Comment.new
    end

    def update
        # @post = Post.find(params[:id])
        @post.update(post_params)
        redirect_to post_path(@post)
    end

    def edit
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
    
        redirect_to dashboard_path
    end

    private

    def set_post
        @post = Post.find(params[:id]) if params[:id].present?
    end

    def find_post
        @post = Post.find_by id: params[:id]
        return if @post
        flash[:danger] = "Post does not exist"
        redirect_to dashboard_path
    end

    def post_params
        params.require(:post).permit(:description, :image, :image_cache)
    end
    
end