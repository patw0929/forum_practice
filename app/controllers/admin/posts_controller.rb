# encoding: utf-8
class Admin::PostsController < ApplicationController
  layout "admin"

  before_filter :set_board

  # 編輯
  def edit
    @post = Post.find(params[:id])
  end

  # 編輯 (更新)
  def update
    @post = Post.find(params[:id])

    if @post.update_attributes(params[:post])
      redirect_to board_post_path(@board, @post), :notice => "文章已成功被更新。"
    else
      render :action => "edit"
    end
  end

  # 刪除
  def destroy
    @post = Post.find(params[:id])

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