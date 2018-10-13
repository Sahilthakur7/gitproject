class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :repositories

  def to_s
      name
  end

  def self.search(search)
      where("name LIKE ?","%#{search}%")
  end
end
