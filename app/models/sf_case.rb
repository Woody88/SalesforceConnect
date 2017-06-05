class SFCase
  include ActiveModel::Model
  include SalesforceProtocol
  @name = "Case"
  @FIELDS = [:Id, :Subject, :CaseNumber, :Origin, :Status, :Priority, :id]
  attr_accessor(*@FIELDS,)

  class << self
    include SalesforceProtocol
  end
end
