class BoardsController < ApplicationController

  # 首頁
  def index
    @boards = Board.all
  end

  # 單篇
  def show
  end

  # 新增
  def new
    @board = Board.new
  end

  # 新增 (寫入)
  def create
    @board = Board.new(params[:board])

    if @board.save
      redirect_to boards_path
    else
      render :action => "new"
    end 
  end

end
