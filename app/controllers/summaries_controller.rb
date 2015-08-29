class SummariesController < ApplicationController
    def new
        @post = Post.find(params[:post_id])
        @summary = Summary.new
    end

    def create
        @summaries = Summary.new(params.require(:summary, :description, :public))
        authorize @topic
        if @summary.save
            redirect_to @summary, notice: "Summary saved, nice"
        else
            flash[:error] = "There was an error. Try again"
            render :new
        end
    end

    def show
        @topic = Topic.find(params[:id])
        @posts = @topic.posts
        @summaries = @posts.summaries
    end
end