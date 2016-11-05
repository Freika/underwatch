require 'rails_helper'

describe Event, type: :model do
  it { should validate_presence_of :title }
  it { should validate_presence_of :description }
  it { should validate_presence_of :user_id }
  it { should validate_presence_of :mode }
end
