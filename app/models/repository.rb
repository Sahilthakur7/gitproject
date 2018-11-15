class Repository < ApplicationRecord
  belongs_to :user, dependent: :destroy
  validates :name, presence: true
  validates :user , presence: true

  has_many_attached :code_files
end
