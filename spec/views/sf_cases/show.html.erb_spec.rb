require 'rails_helper'

RSpec.describe "sf_cases/show", type: :view do
  before(:each) do
    @sf_case = assign(:sf_case, SfCase.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
