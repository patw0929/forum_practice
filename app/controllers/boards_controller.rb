class BoardsController < ApplicationController

  # TODO: 還不大懂這個的用途
  before_filter :set_board, only: [ :show, :edit, :update, :destroy ]

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

  # 編輯
  def edit
  end

  # 編輯 (更新)
  def update

    if @board.update_attributes(params[:board])
      redirect_to boards_path
    else
      render :action => "edit"
    end

  end

  # 刪除
  def destroy

    if @board.destroy
      redirect_to boards_path
    else
      render :action => "index"
    end

  end

  private

    def set_board
      @board = Board.find(params[:id])
    end

end
