require "rails_helper"

RSpec.describe Entity::Organization, type: :model do
  describe "Validations" do
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of(:name).scoped_to(:type) }
    it "should permit existence of two organizations with the same name, but different type" do
      organization1 = create(:entity_organization, name: "org1", type: "")
      expect(organization1.valid?).to be true
      expect(organization1.persisted?).to be true

      organization2 = create(:entity_organization, name: "org1", type: "hola")
      expect(organization2.valid?).to be true
      expect(organization2.persisted?).to be true
      expect(organization2.name).to eq "org1"

      organization3 = build(:entity_organization, name: "org1", type: "")
      expect(organization3.valid?).to be false
      expect(organization3.errors[:name]).not_to be_empty
    end

  end
end
