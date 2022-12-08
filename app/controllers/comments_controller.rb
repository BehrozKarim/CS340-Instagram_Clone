class CommentsController < ApplicationController
    before_action :authenticate_account!
    
    def create
        @comment = Comment.new(post_params)
        @comment.account_id = current_account.id if account_signed_in?
        
        if @comment.save
            redirect_to dashboard_path, flash: { success: "Comment created successfully" }
        else
            redirect_to dashboard_path, flash: { danger: "Comment not created" }
        end
    end

    private

    def post_params
        params.require(:post).permit(:comment, :post_id)
    end
    
end