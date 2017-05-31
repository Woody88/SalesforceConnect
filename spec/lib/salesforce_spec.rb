require 'rails_helper'

RSpec.describe Salesforce do
  let(:case_id) { "5006A0000026sgDQAQ" }
  let(:case_number) { "00001000" }
  let(:object_type) { "Case" }

  let(:new_case) { {object: "Case", status: "new", origin: "Web", subject: "created from SalesforceConnect", description: "Test!"} }
  it "authenticates" do
    expect(Salesforce.authenticate!.class).to eq(Restforce::Mash)
  end

  it "query case 5006A0000026sgDQAQ" do
    sf_case = Salesforce.query("select Id,Status, Description, CaseNumber, Subject from Case where Id = '#{case_id}'").first
    expect(sf_case.CaseNumber).to eq(case_number)
  end

  it "finds case 5006A0000026sgDQAQ" do
    sf_case =  Salesforce.find("Case", case_id)
    expect(sf_case.CaseNumber).to eq(case_number)
  end

  it "creates a case" do
    sf_case_id = Salesforce.create(new_case)
    sf_case =  Salesforce.find(object_type, sf_case_id)
    expect(sf_case.Id).to eq(sf_case_id)
  end

  it "creates a case" do
    response = Salesforce.update({object: object_type, id: "5006A0000026sgDQAQ", subject: "Updated by SalesforceConnect"})
    expect(response).to be(true)
  end

  it "deletes a case" do
     sf_case_id = Salesforce.create(new_case.merge({subject: "This case should not be on Salesforce. From SalesforceConnect"}))
     response = Salesforce.delete({object: object_type, id: sf_case_id})
     expect(response).to be(true)
  end
end
