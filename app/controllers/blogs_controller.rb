class BlogsController < ApplicationController

before_action :move_to_index, except: [:index, :show]

  def index
    @blogs = Blog.page(params[:page]).per(5).order("created_at DESC")
  end

  def new
    @blog = Blog.new
  end

  def create
   @blog = Blog.new(blog_params)
   @blog.save
   redirect_to root_path
  end

  def destroy
    blog = Blog.find(params[:id])
    blog.destroy
    redirect_to root_path
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    blog = Blog.find(params[:id])
    blog.update(blog_params)
    redirect_to root_path
  end

  private
    def blog_params
      params.require(:blog).permit(:title, :text)
    end

    def move_to_index
      redirect_to root_path unless user_signed_in?
    end

end
