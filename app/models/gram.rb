class Gram < ApplicationRecord
  validates :message, presence: true
  validates :picture, presence: true
  has_many :comments


  # class Gram < ActiveRecord::Base
    mount_uploader :picture, PictureUploader
  # end

  belongs_to :user

end
