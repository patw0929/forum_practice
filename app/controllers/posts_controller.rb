# encoding: utf-8
class PostsController < ApplicationController
  before_filter :set_board
  before_filter :authenticate_user!, :except => [:show, :index]

  # 首頁
  def index
    redirect_to board_path(@board)
  end

  # 單篇
  def show   
    @post = @board.posts.find(params[:id])
  end

  # 新增
  def new
    @post = @board.posts.build
  end

  # 新增 (寫入)
  def create
    @post = @board.posts.build(params[:post])
    @post.user_id = current_user.id

    if @post.save
      redirect_to board_posts_path(@board), :notice => "文章已成功建立。"
    else
      render :action => "new"
    end
  end

  # 編輯
  def edit
    @post = current_user.posts.find(params[:id])
  end

  # 編輯 (更新)
  def update
    @post = current_user.posts.find(params[:id])

    if @post.update_attributes(params[:post])
      redirect_to board_post_path(@board, @post), :notice => "文章已成功被更新。"
    else
      render :action => "edit"
    end
  end

  # 刪除
  def destroy
    @post = current_user.posts.find(params[:id])

    if @post.destroy
      redirect_to board_posts_path(@board)
    else
      render :action => "index"
    end
  end

  private
  def set_board
    @board = Board.find(params[:board_id])
  end

end