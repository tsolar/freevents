# frozen_string_literal: true

require "rails_helper"

RSpec.describe Email, type: :model do
  describe "Validations" do
    it { is_expected.to validate_presence_of :address }
    it { is_expected.to validate_presence_of :emailable }

    it "validates address is a valid email address" do
      email = build :email, address: "email-no-valido"
      expect(email.valid?).to be false
      # expect(email.errors[:address]).to include I18n.t('activerecord.errors.models.email.attributes.address.invalid', default: I18n.t('errors.messages.invalid'))

      email = build :email, address: "email-no-valido@"
      expect(email.valid?).to be false
      # expect(email.errors[:address]).to include I18n.t('activerecord.errors.models.email.attributes.address.invalid')

      email = build :email, address: "email-no-valido@tampoco"
      expect(email.valid?).to be false
      # expect(email.errors[:address]).to include I18n.t('activerecord.errors.models.email.attributes.address.invalid')

      email = build :email, address: "@tampoco"
      expect(email.valid?).to be false
      # expect(email.errors[:address]).to include I18n.t('activerecord.errors.models.email.attributes.address.invalid')

      email = build :email, address: "email-valido@este-si.com"
      expect(email.valid?).to be true
      expect(email.errors[:address]).to be_empty

      email = build :email, address: "email+valido@este-tambien.com"
      expect(email.valid?).to be true
      expect(email.errors[:address]).to be_empty
    end
  end

  describe "Relationships" do
    it { is_expected.to belong_to :emailable }
  end

  describe "Create" do
    it "creates a valid email" do
      email = create(:email)
      expect(email.valid?).to be true
      expect(email.persisted?).to be true
    end
  end

  describe "#to_s" do
    it "returns email address" do
      address = FFaker::Internet.email
      email = create :email, address: address
      expect(email.to_s).to eq address
    end
  end
end
