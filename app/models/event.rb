class Event < ApplicationRecord
  belongs_to :user

  validates :title, :description, :user_id, :mode, presence: true

  enum mode: [:competitive]
end
