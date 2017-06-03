module SalesforceProtocol
  @sf_valid

  def all
    Salesforce.query("Select Id, Subject, CaseNumber from #{@name}")
  end

  def attributes
    @FIELDS
  end

  def create(hash)
    obj = self.ancestors[0].new(hash.symbolize_keys)
    obj.valid? ? Salesforce.create(@name, hash, self.ancestors[0]) : obj
  end

  def update(hash)
    obj = self.ancestors[0].new(hash.symbolize_keys)
    obj.valid? ? Salesforce.update(@name, hash, self.ancestors[0]) : obj
  end

  def find(id_)
    sf_case = extract_fields( Salesforce.find(@name, id_).symbolize_keys.except!(:attributes) )
    SFCase.new(sf_case)
  end

  def extract_fields(hash)
    new_hash = {}
    @FIELDS.each { |x| new_hash[x] = hash[x] }
    new_hash
  end

  def destroy(id_)
    Salesforce.delete({object: @name, id: id_})
  end

  def set_sf_valid(value)
    @sf_valid = value
    self
  end

  def sf_valid?
    @sf_valid
  end
end
