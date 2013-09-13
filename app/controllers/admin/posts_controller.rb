# encoding: utf-8
class Admin::PostsController < ApplicationController
  layout "admin"

  before_filter :require_is_admin
  before_filter :set_board
  before_filter :set_post

  # 編輯
  def edit
  end

  # 編輯 (更新)
  def update
    if @post.update_attributes(params[:post])
      redirect_to board_post_path(@board, @post), :notice => "文章已成功被更新。"
    else
      render :action => "edit"
    end
  end

  # 刪除
  def destroy
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

  def set_post
    @post = Post.find(params[:id])
  end
end