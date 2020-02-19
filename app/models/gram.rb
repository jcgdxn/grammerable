class Gram < ApplicationRecord
  validates :message, presence: true
  validates :picture, presence: true
  belongs_to :user
  has_many :comments

  mount_uploaders :picture, PictureUploader

end
