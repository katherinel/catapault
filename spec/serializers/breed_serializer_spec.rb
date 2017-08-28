require 'rails_helper'

RSpec.describe BreedSerializer, type: :serializer do
  describe "attributes" do
    let(:breed) { build(:breed) }
    it "should include name as an attribute" do
      serialized = JSON.parse(serialize(breed))
      expect(serialized["data"]["attributes"].keys).to include("name")
    end
  end
end