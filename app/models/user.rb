class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
  has_many :posts

  # NOTE: attr_accessible (白名單) 與 attr_protected (黑名單) 擇一即可，一般建議用白名單
  # (避免用黑名單是因為有可能未來加新欄位之後，有需要排除的欄位卻忘了加)
  # attr_protected :is_admin

  # NOTE: 這個可以不用加，因為會自動對 boolean 欄位做相應的機制
  # def is_admin?
  #  is_admin
  # end
end