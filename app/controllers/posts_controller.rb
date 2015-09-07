c class PostsController < ApplicationController
   def show
     @topic = Topic.find(params[:topic_id])
     @post = Post.find(params[:id])
     authorize @post
   end

   def new
     @topic = Topic.find(params[:topic_id])
     @post = Post.new
     authorize @post
   end

   def edit
     @topic = Topic.find(params[:topic_id])
     @post = Post.find(params[:id])
     authorize @post
   end

   def create
     @topic = Topic.find(params[:topic_id])
     @post = Post.new(post_params)
     @post.user = current_user
     @post.topic = @topic
     authorize @post

     if @post.save
       flash[:notice] = "Post was saved."
       redirect_to [@topic, @post]

     else
       flash[:error] = "There was an error saving the post. Please try again."
       render :new
     end
   end

   def update
     @topic = Topic.find(params[:topic_id])
     @post = Post.find(params[:id])
     authorize @post

     if @post.update_attributes(post_params)
       flash[:notice] = "Post was updated."
       redirect_to [@topic, @post]
     else
       flash[:error] = "There was an error saving the post. Please try again."
       render :new
     end
   end

   def markdown_body
    render_as_markdown @post.body
   end

   def markdown_title
    render_as_markdown @post.title
   end

   private

   def render_as_markdown(markdown)
        renderer = Redcarpet::Render::HTML.new
        extensions = {fenced_code_blocks: true}
        redcarpet = Redcarpet::Markdown.new(renderer, extensions)
        (redcarpet.render markdown).html_safe
   end

    def post_params
      params.require(:post).permit(:title, :body)
    end
 end
