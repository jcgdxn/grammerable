class Gram < ApplicationRecord
  validates :message, presence: true
  validates :picture, presence: true


  # class Gram < ActiveRecord::Base
    mount_uploader :picture, PictureUploader
  # end

  belongs_to :user

end
