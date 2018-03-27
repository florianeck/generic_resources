module GenericResource

  mattr_accessor :resources

  def self.register_resource!(klass, permitted_attributes: [], overview_attributes: [], resource_deleteable: false)
    @@resources ||= {}
    @@resources[klass.name.underscore.gsub("/","_")] = {
      class: klass,
      permitted_attributes: permitted_attributes,
      overview_attributes: overview_attributes,
      resource_deleteable: resource_deleteable
    }
  end


  class UnregisteredResourceError < StandardError

  end

end