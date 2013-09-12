# encoding: utf-8
class Admin::BoardsController < ApplicationController
  layout "admin"

  # NOTE: before_filter
  # 可將 Controller 中重複的方法抽出，在進入 Action 之前用 before_action
  # :only => 代表只用在這幾個 Action 上
  # http://ihower.tw/rails3/actioncontroller.html
  before_filter :require_is_admin
  before_filter :set_board, :only => [:show, :edit, :update, :destroy]

  # 首頁
  def index
    @boards = Board.all
  end

  # 新增
  def new
    @board = Board.new
  end

  # 新增 (寫入)
  def create
    @board = Board.new(params[:board])

    if @board.save
      redirect_to board_path(@board), :notice => "版塊成功地被建立了。"
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
      redirect_to board_path(@board), :notice => "版塊成功地被建立了。"
    else
      render :action => "edit"
    end
  end

  # 刪除
  def destroy
    if @board.destroy
      redirect_to admin_boards_path
    else
      render :action => "index"
    end
  end

  private
  def set_board
    @board = Board.find(params[:id])
  end

end