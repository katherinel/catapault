require 'rails_helper'

RSpec.describe TagSerializer, type: :serializer do
  describe "attributes" do
    let(:tag) { build(:tag) }
    it "should include label as an attribute" do
      serialized = JSON.parse(serialize(tag))
      expect(serialized["data"]["attributes"].keys).to include("label")
    end
  end
end