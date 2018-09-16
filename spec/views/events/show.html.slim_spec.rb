require "rails_helper"

RSpec.describe "events/show", type: :view do
  include Pundit

  before(:each) do
    @event = assign(:event, create(:event))

    # This is added because I get this exception
    # *** NoMethodError Exception: undefined method `policy' for #<#<Class:0x00557ec8942360>:0x00557ec89247c0>
    # Taken from https://github.com/varvet/pundit/issues/339
    allow(view).to receive(:policy) do |record|
      Pundit.policy(@user, record)
    end
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/#{@event.title}/)
    expect(rendered).to match(/#{@event.description}/)
  end
end
