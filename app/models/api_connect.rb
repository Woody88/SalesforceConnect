class APIConnect
  include ActiveModel::Model
  attr_accessor :user, :password
  validates :api_key, :api_secret, presence: true

  # def connect!()
  #   return false unless self.valid?
  #   # Presume some API class... You'd store that authorization somewhere.
  #   API.authorize(self.api_key,self.api_secret)
  # end

  def valid?
    Salesforce.authenticate({user: self.user, password: self.password})
  end
end
