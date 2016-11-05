class Event < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :participations
  has_many :users, through: :participations

  validates :title, :description, :author_id, :mode, presence: true

  enum mode: [:competitive]
end
