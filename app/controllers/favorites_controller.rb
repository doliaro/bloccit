class FavoritesController < ApplicationController
    def create
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.build(post: post)
    authorize favorite

     if favorite.save
        flash[:notice] = "Success!"
        redirect_to [post.topic, post]
       # Add code to generate a success flash and redirect to post
       # Remember the path shortcut: [post.topic, post]
     else
        flash[:notice] = "Failure"
        redirect_to [post.topic, post]
       # Add code to generate a failure flash and redirect to post
     end
   end

    def destroy
        post = Post.find(params[:post_id])
        favorite = Favorite.find(params[:id])
        authorize favorite
        # Get the post from the params
        # Find the current user's favorite with the ID in the params

        if favorite.destroy
            flash[:notice] = "Success!"
            redirect_to [post.topic, post]
        # Flash success and redirect to @post
        else
            flash[:notice] = "Failure"
            redirect_to [post.topic, post]
        # Flash error and redirect to @post
        end
    end
end
