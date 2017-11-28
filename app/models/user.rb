class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  #無記入。長さがあれならエラー表示
  validates :name,
             presence: true,
             length: { minimum: 2, maximum: 20, }
  #無記入ok
  validates :introduction,
             length: { maximum: 50, }


  has_many :post_images
  has_many :books
  attachment :image

end
