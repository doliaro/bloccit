class CommentsController < ApplicationController

    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.new(comment_params)
        @comment.user_id = current_user.id
        authorize @comment

        if @comment.save
            flash[:notice] = "Comment was saved."
        else
            flash[:error] = "There was an error saving the comment. Please try again."
        end
        redirect_to [@post.topic, @post]
    end

    def destroy
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
        authorize @comment

        if @comment.destroy
          flash[:notice] = "Comment was removed."
        else
          flash[:error] = "Comment couldn't be deleted. Try again."
        end
        redirect_to [@post.topic, @post]
   end

    private
    def comment_params
       params.require(:comment).permit(:body)
    end
end
