class Run < ApplicationRecord
  belongs_to :event
  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true
  validates :user_id, presence: true
end
