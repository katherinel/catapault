require 'rails_helper'

RSpec.describe Tag, type: :model do
  it { should validate_uniqueness_of(:label).case_insensitive }
  it { should validate_presence_of(:label) }
end
