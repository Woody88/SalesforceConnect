module Salesforce
  extend self

  def connect
    client = Restforce.new(password: ENV["SF_PASS"],
                           username: ENV["SF_USERNAME"],
                           security_token: ENV["SF_SECRET_TOKEN"],
                           client_id: ENV["SF_CLIENT_ID"],
                           client_secret: ENV["SF_CLIENT_SECRET"],
                           instance_url: "https://na50.salesforce.com"
                           )
  end

end
