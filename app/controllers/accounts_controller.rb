class AccountsController < ApplicationController
    before_action :authenticate_account!
    before_action :set_account, only: [:profile, :edit, :update, :destroy]
    
    def index
        # user feed

        followers_ids = Follower.where(follower_id: current_account.id).map(&:following_id)
        followers_ids << current_account.id
        following_ids = Follower.where(follower_id: current_account.id).map(&:following_id)

        if current_account.admin?
            @posts = Post.active.order(created_at: :desc)
        else
            @posts = Post.where(account_id: followers_ids).active.order(created_at: :desc)
        end
        @comment = Comment.new

        following_ids << current_account.id
        @follower_suggestions = Account.where.not(id: following_ids).limit(5)


        
    end

    def profile
        # user profile
        @posts = @account.posts.active
    end

    def follow_account
        follower_id = params[:follow_id]
        if Follower.create!(follower_id: current_account.id, following_id: follower_id)
            flash[:success] = "You are now following this account"
        else
            flash[:danger] = "Unable to follow this account"
        end

        redirect_to dashboard_path

    end

    private

    def set_account
        @account = Account.find_by_username(params[:username])
    end
    
end
