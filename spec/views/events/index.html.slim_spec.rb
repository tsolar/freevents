# frozen_string_literal: true

require "rails_helper"
RSpec.describe "events/index", type: :view do
  include Pundit

  let(:user) { create(:user) }
  let!(:events) { assign(:events, create_list(:event, 2)) }

  before do
    # This is added because I get this exception
    # *** NoMethodError Exception: undefined method `policy' for #<#<Class:0x00557ec8942360>:0x00557ec89247c0>
    # Taken from https://github.com/varvet/pundit/issues/339
    allow(view).to receive(:policy) do |record|
      Pundit.policy(user, record)
    end
  end

  it "renders a list of events" do
    render
    assert_select ".events > .event > .link > a", text: events.first.to_s, count: 1
    assert_select ".events > .event > .link > a", text: events.second.to_s, count: 1
  end
end
