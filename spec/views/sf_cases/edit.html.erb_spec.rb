require 'rails_helper'

RSpec.describe "sf_cases/edit", type: :view do
  before(:each) do
    @sf_case = assign(:sf_case, SfCase.create!())
  end

  it "renders the edit sf_case form" do
    render

    assert_select "form[action=?][method=?]", sf_case_path(@sf_case), "post" do
    end
  end
end
