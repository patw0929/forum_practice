class PostsController < ApplicationController

  # 首頁
  def index

    @posts = Post.all

  end

  # 單篇
  def show
    @post = Post.find(params[:id])
  end

  # 新增
  def new
    @post = Post.new
  end

  # 新增 (寫入)
  def create
    @post = Post.new(params[:post])

    if @post.save
      redirect_to posts_path
    else
      render :action => "new"
    end
  end

  # 編輯
  def edit
    @post = Post.find(params[:id])
  end

  # 編輯 (更新)
  def update
    @post = Post.find(params[:id])

    if @post.update_attributes(params[:post])
      redirect_to posts_path
    else
      render :action => "edit"
    end
  end

  # 刪除
  def destroy

    @post = Post.find(params[:id])

    if @post.destroy
      redirect_to posts_path
    else
      render :action => "index"
    end

  end

end
