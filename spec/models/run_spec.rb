require 'rails_helper'

describe Run, type: :model do
  it { should belong_to(:event) }
  it { should belong_to(:user) }
end
