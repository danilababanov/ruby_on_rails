class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy, :increment]

  # GET /posts
  # GET /posts.json
  def index
    #if params[:publishing_post] == 'true'
    #  @posts = Post.publishing_post
    #else
    #  @posts = Post.all
    #end

    if params[:title]
      @posts = Post.where("title = ?", params[:title])
    else
      @posts = Post.all
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def increment
    @post.rating += 1
    @post.save
    redirect_to @post, notice: 'Liked!'
  end

  def info
    @posts = Post.random_content
    session[:secret_id] = 1
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :description, :publishing, :rating, {category_ids: []})
    end

    def check_auth
      if session[:user_id] != @post.user_id
        flash[:notice] = 'Error!'
        redirect_to posts_path
      end
    end
end
