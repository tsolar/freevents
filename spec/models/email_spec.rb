require "rails_helper"

RSpec.describe Email, type: :model do
  describe "Validations" do
    it { should validate_presence_of :address }
    it { should validate_presence_of :emailable }

    it "should validate address is a valid email address" do
      email = FactoryBot.build :email, address: "email-no-valido"
      expect(email.valid?).to be false
      # expect(email.errors[:address]).to include I18n.t('activerecord.errors.models.email.attributes.address.invalid', default: I18n.t('errors.messages.invalid'))

      email = FactoryBot.build :email, address: "email-no-valido@"
      expect(email.valid?).to be false
      # expect(email.errors[:address]).to include I18n.t('activerecord.errors.models.email.attributes.address.invalid')

      email = FactoryBot.build :email, address: "email-no-valido@tampoco"
      expect(email.valid?).to be false
      # expect(email.errors[:address]).to include I18n.t('activerecord.errors.models.email.attributes.address.invalid')

      email = FactoryBot.build :email, address: "@tampoco"
      expect(email.valid?).to be false
      # expect(email.errors[:address]).to include I18n.t('activerecord.errors.models.email.attributes.address.invalid')

      email = FactoryBot.build :email, address: "email-valido@este-si.com"
      expect(email.valid?).to be true
      expect(email.errors[:address]).to be_empty

      email = FactoryBot.build :email, address: "email+valido@este-tambien.com"
      expect(email.valid?).to be true
      expect(email.errors[:address]).to be_empty
    end
  end

  describe "Relationships" do
    it { should belong_to :emailable }
  end

  describe "Create" do
    it "should create a valid email" do
      email = FactoryBot.create(:email)
      expect(email.valid?).to be true
      expect(email.persisted?).to be true
    end
  end

  describe "#to_s" do
    it "should return email address" do
      address = FFaker::Internet.email
      email = FactoryBot.create :email, address: address
      expect("#{email}").to eq address
    end
  end
end
