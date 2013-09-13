# encoding: utf-8
class BoardsController < ApplicationController
  # NOTE: before_filter
  # 可將 Controller 中重複的方法抽出，在進入 Action 之前用 before_action
  # :only => 代表只用在這幾個 Action 上
  # http://ihower.tw/rails3/actioncontroller.html
  before_filter :set_board, :only => [:show]

  # 首頁
  def index
    @boards = Board.all
  end

  # 單篇
  def show
    @posts = @board.posts.paginate(:page => params[:page], :per_page => 5)
  end

  private

  def set_board
    @board = Board.find(params[:id])
  end
end