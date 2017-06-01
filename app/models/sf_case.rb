class SFCase
  include ActiveModel::Model
  attr_accessor :id, :subject, :case_number
  @name = "Case"
  # validates :api_key, :api_secret, presence: true

  # def connect!()
  #   return false unless self.valid?
  #   # Presume some API class... You'd store that authorization somewhere.
  #   API.authorize(self.api_key,self.api_secret)
  # end

  def self.all
    Salesforce.query("Select Id, Subject, CaseNumber from Case")
  end

  def self.find(id_)
    sf_case = Salesforce.find(@name, id_)
    SFCase.new({id: sf_case["Id"],subject: sf_case["Subject"], case_number: sf_case["CaseNumber"]})
  end

  def self.destroy(id_)
    Salesforce.delete({object: @name, id: id_})
  end
end
