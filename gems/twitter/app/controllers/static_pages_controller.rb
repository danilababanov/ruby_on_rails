class StaticPagesController < ApplicationController
  def home
    if logged_in?
     @micropost = current_user.microposts.build
     @feed_items = current_user.feed.includes(:user).page(params[:page])
    end
  end
end
