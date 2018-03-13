require "rails_helper"

RSpec.describe Event::Participation::Answer, type: :model do
  describe "Relationships" do
    it {
      should belong_to(:attendee)
        .class_name("Event::Attendee")
        .with_foreign_key(:event_participation_id)
        .inverse_of(:answer)
    }

  end

  it {
    should validate_inclusion_of(:will_attend)
      .in_array(["yes", "no", "maybe"])
      .allow_nil(true)
  }

  it { should allow_value(nil).for(:did_attend) }
end
