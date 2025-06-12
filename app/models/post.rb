class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  has_many_attached :media
  validates :title, :content, presence: true
end
