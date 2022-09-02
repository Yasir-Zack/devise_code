class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]
    def index
      @posts = Post.all.order("created_at DESc")
    end
    def new 
      @post = Post.new
      authorize @post
    end
  
    def create
      @post = Post.new(post_params)
      @post.user = current_user
      authorize @post

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

    def show
    end
  
    def edit 
    end
  
    def destroy
      authorize @post
      @post.destroy
      respond_to do |format|
        format.html { redirect_to posts_path, notice: 'Post was successfully Deleted.' }
        format.json { head :no_content }
      end
      # redirect_to posts_path
    end
  
    def update
      authorize @post
      if @post.update(post_params)
        redirect_to @post, notice: 'Post was successfully update'
        else
          render 'edit'
      end    
    end 
    private
    def find_post
      @post = Post.find(params[:id])
    end  
     
    def post_params
      params.require(:post).permit(:title, :body)
    end
end
