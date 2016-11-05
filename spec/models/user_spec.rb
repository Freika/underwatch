require 'rails_helper'

describe User, type: :model do
  it { should validate_uniqueness_of :battletag }
  it { should validate_presence_of :battletag }
  it { should validate_presence_of :region }
  it { should validate_presence_of :timezone }
  it { should have_many :events }
end
