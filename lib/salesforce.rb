module Salesforce
  extend self

  def find(object, id)
    connect.find(object, id)
  end

  def query(object)
    connect.query(object)
  end

  def update(object, hash, clazz)
    obj = connect.update!(object, hash)
    obj ? create_obj(obj, clazz) : create_invalid_obj(clazz)
  end

  def create(object, hash, clazz)
    obj = connect.create!(object, hash)
    obj ? create_obj(obj, clazz) : create_invalid_obj(clazz)
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


  def create_obj(id, clazz)
    clazz.new({Id: id}).set_sf_valid(true)
  end

  def create_invalid_obj(clazz)
    obj = clazz.new
    obj.errors.add(:base, "Salesforce couldn't not create/update #{self}")
    obj.set_sf_valid(false)
  end
end
