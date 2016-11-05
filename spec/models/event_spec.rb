require 'rails_helper'

describe Event, type: :model do
  it { should validate_presence_of :title }
  it { should validate_presence_of :description }
  it { should validate_presence_of :author_id }
  it { should validate_presence_of :mode }
  it { should have_many :participations }
  it { should have_many(:users).through(:participations) }
end
