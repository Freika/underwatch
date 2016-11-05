class User < ApplicationRecord
  extend FriendlyId
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  friendly_id :battletag, use: :slugged

  enum region: [:eu, :us]
end
