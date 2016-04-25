module GenericResource

  mattr_accessor :resources

  def self.register_resource!(klass, permitted_attributes: [])
    @@resources ||= {}
    @@resources[klass.name.underscore] = {
      class: klass,
      permitted_attribues: permitted_attributes
    }
  end


  class UnregisteredResourceError < StandardError

  end

end