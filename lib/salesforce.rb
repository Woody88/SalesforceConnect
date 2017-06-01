module Salesforce
  extend self


  def find(object, id)
    connect.find(object, id)
  end

  def query(object)
    connect.query(object)
  end

  def update(hash)
    connect.update(hash[:object], hash.except(:object))
  end

  def create(hash)
    connect.create!(hash[:object], hash.except(:object))
  end

  def delete(hash)
    connect.destroy(hash[:object], hash[:id])
  end

  def authenticate!
    connect.authenticate!
  end

  def authenticate(hash)
    begin
      connect_(hash).authenticate!
      true
    rescue => ex
      false
    end
  end

  private
  def connect
    Restforce.new(password: ENV["SF_PASS"],
                  username: ENV["SF_USERNAME"],
                  security_token: ENV["SF_SECRET_TOKEN"],
                  client_id: ENV["SF_CLIENT_ID"],
                  client_secret: ENV["SF_CLIENT_SECRET"])
  end

  def connect_(hash)
    Restforce.new(password: hash[:password],
                  username: hash[:user],
                  security_token: ENV["SF_SECRET_TOKEN"],
                  client_id: ENV["SF_CLIENT_ID"],
                  client_secret: ENV["SF_CLIENT_SECRET"])
  end
end
