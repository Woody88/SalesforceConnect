require 'rails_helper'

RSpec.describe SFCase do
  it "query all" do
    sf_cases = SFCase.all
    expect(sf_cases.length).to be > 0
  end
end
