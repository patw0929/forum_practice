class AddBoardIdToPost < ActiveRecord::Migration
  def change
    add_column :posts, :board_id, :integer
  end

  # NOTE: 原本是寫 self.up 跟 self.down，但在 Rails 3 之後可以用 change 方法來取代，
  # 會自動做相應的動作。
  #
  # def self.down
  #   remove_column :posts, :board_id
  # end
end