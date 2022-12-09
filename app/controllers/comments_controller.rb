class CommentsController < ApplicationController
    before_action :authenticate_account!
    
    def create
        @comment = Comment.new(comment_params)
        @comment.account_id = current_account.id if account_signed_in?
        
        if @comment.save
            return_url = params[:comment][:return_to].present? ? post_path(@comment.post.id) : dashboard_path
            redirect_to return_url, flash: { success: "Comment created successfully" }
        else
            redirect_to dashboard_path, flash: { danger: "Comment not created" }
        end
    end

    def destroy
        # return_url = post_path(@comment.post.id)
        
        @comment = Comment.find(params[:id])
        @comment.destroy
        # redirect_to return_url, flash: { success: "Comment deleted successfully" }
        redirect_to dashboard_path, flash: { success: "Comment created successfully" }
    end

    private

    def comment_params
        params.require(:comment).permit(:comment, :post_id)
    end
    
end