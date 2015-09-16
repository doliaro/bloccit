class VotesController < ApplicationController
   before_action :load_post_and_vote

    def up_vote
        update_vote!(1)
        redirect_to :back
    end
    def down_vote
        update_vote!(-1)
        redirect_to :back
    end
    private
    def load_post_and_vote
        @post = Post.find(params[:post_id])
        @vote = @post.votes.where(user_id: current_user.id).first
    end
    private
    def update_vote!(new_value)
        if @vote
            authorize @vote, :update?
            @vote.update_attribute(:value, 1)
        else
            @vote = current_user.votes.build(value: new_value, post: @post)
            authorize @vote, :create?
            @vote.save
        end
    end
end