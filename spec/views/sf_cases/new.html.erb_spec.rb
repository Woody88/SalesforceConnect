require 'rails_helper'

RSpec.describe "sf_cases/new", type: :view do
  before(:each) do
    assign(:sf_case, SfCase.new())
  end

  it "renders new sf_case form" do
    render

    assert_select "form[action=?][method=?]", sf_cases_path, "post" do
    end
  end
end
