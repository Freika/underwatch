class Event < ApplicationRecord
  DIFFICULTIES = %w(Easy Medium Hard).freeze
  enum difficulty: DIFFICULTIES

  has_many :runs

  validates :title, presence: true
  validates :difficulty, presence: true
end
