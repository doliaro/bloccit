class TopicsController < ApplicationController
    before_action :set_topic, only: [:show, :edit, :update]

    def index
        @topics = Topic.paginate(page: params[:page])
        #@topics = Topic.paginate(page: params[:page], per_page: 100)
        authorize @topics
    end

    def new
        @topic = Topic.new
        authorize @topic
    end

    def show
        @posts = @topic.posts.paginate(page: params[:page], per_page: 100)
        authorize @topic
    end

    def edit
        authorize @topic
    end

    def create
        @topic = Topic.new(topic_params)
        authorize @topic
        if @topic.save
            redirect_to @topic, notice: "Topic was saved successfully."
        else
            flash[:error] = "Error creating topic. Please try again."
            render :new
        end
    end

    def update
        authorize @topic
        if @topic.update_attributes(topic_params)
            redirect_to @topic
        else
            flash[:error] = "Error saving topic. Please try again."
            render :edit
        end
    end

    def destroy
        @topic = set_topic
        authorize @topic
        
        if @topic.destroy
            flash[:notice] = "\"#{@topic.name}\" was deleted successfully."
            redirect_to topics_path
        else
            flash[:error] = "There was an error deleting the topic."
            render :show
        end
    end

    private

        def set_topic
            @topic = Topic.find(params[:id])
        end

        def topic_params
            params.require(:topic).permit(:name, :description, :public)
        end
end
