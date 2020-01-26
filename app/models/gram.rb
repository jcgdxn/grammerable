class Gram < ApplicationRecord
  validates :message, presence: true

  belong_to :user
end
