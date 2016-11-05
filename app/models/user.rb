class User < ApplicationRecord
  extend FriendlyId
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  friendly_id :battletag, use: :slugged

  enum region: [:eu, :us]

  validates :battletag, :region, :timezone, presence: true
  validates :battletag, uniqueness: true

  has_many :events
  has_many :participations
  has_many :events, through: :participations, as: :games

  def battletag_slugified
    battletag.gsub('#', '-')
  end
end
