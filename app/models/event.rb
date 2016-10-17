class Event < ApplicationRecord
  DIFFICULTIES = %w(Easy Medium Hard).freeze
  enum difficulty: DIFFICULTIES

  validates :title, presence: true
  validates :difficulty, presence: true
end
