class Participation < ApplicationRecord
  belongs_to :user
  belongs_to :event

  scope :approved, -> { where(approved: true) }
  scope :unapproved, -> { where(approved: false) }
end
