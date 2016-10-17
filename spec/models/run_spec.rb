require 'rails_helper'

describe Run, type: :model do
  it { should belong_to(:event) }
  it { should belong_to(:user) }
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
end
