require 'rails_helper'

RSpec.describe "sf_cases/index", type: :view do
  before(:each) do
    assign(:sf_cases, [
      SfCase.create!(),
      SfCase.create!()
    ])
  end

  it "renders a list of sf_cases" do
    render
  end
end
