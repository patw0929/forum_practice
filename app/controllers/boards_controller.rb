class BoardsController < ApplicationController

  # 首頁
  def index
    @boards = Board.all
  end

  # 單篇
  def show
  end

end
