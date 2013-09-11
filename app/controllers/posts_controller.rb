# encoding: utf-8
class PostsController < ApplicationController

  # 首頁
  def index

    @board = Board.find(params[:board_id])
    redirect_to board_path(@board)

  end

  # 單篇
  def show
 
    @board = Board.find(params[:board_id])   
    @post = @board.posts.find(params[:id])
  
  end

  # 新增
  def new
    
    @board = Board.find(params[:board_id])
    @post = @board.posts.build
  
  end

  # 新增 (寫入)
  def create
    
    @board = Board.find(params[:board_id])
    @post = @board.posts.build(params[:post])

    if @post.save
      redirect_to(board_posts_path(@board), :notice => "文章已成功建立。")
    else
      render :action => "new"
    end
  end

  # 編輯
  def edit

    @board = Board.find(params[:board_id])
    @post = @board.posts.find(params[:id])

  end

  # 編輯 (更新)
  def update
    
    @board = Board.find(params[:board_id])
    @post = @board.posts.find(params[:id])

    if @post.update_attributes(params[:post])
      redirect_to(board_post_path(@board, @post), :notice => "文章已成功被更新。")
    else
      render :action => "edit"
    end
  end

  # 刪除
  def destroy

    @board = Board.find(params[:board_id])
    @post = @board.posts.find(params[:id])

    if @post.destroy
      redirect_to(board_posts_path(@board))
    else
      render :action => "index"
    end

  end

end
