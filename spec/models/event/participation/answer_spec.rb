# frozen_string_literal: true

require "rails_helper"

RSpec.describe Event::Participation::Answer, type: :model do
  describe "Relationships" do
    it {
      is_expected.to belong_to(:attendee)
        .class_name("Event::Attendee")
        .with_foreign_key(:event_participation_id)
        .inverse_of(:answer)
    }
  end

  it {
    is_expected.to validate_inclusion_of(:will_attend)
      .in_array(%w[yes no maybe])
      .allow_nil(true)
  }

  it { is_expected.to allow_value(nil).for(:did_attend) }
end
