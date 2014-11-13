class SpamsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])

    @post.mark_as_spam!
  end
end 