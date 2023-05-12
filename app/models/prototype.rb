class Prototype < ApplicationRecord
  has_many :comments
  has_one_attached :image

  validates :image, presence: true
  validates :title, presence: true
  validates :catch_copy, presence: true
  validates :concept, presence: true

  belongs_to :user

end