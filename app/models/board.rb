class Board < ActiveRecord::Base
  attr_accessible :name
  has_many :posts
  scope :recent, :order => "updated_at DESC"
end
