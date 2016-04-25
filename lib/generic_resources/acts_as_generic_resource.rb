module GenericResources
  module ActsAsGenericResource

    extend ActiveSupport::Concern

    included do
      extend ClassMethods
    end

    module ClassMethods
      def acts_as_generic_resource(permitted_attributes: [], overview_attributes: [])
        if permitted_attributes.empty?
          permitted_attributes = (self.try(:column_names) || []) - ['id', 'created_at', 'updated_at']
        end

        if overview_attributes.empty?
          overview_attributes = permitted_attributes
        end

        GenericResource.register_resource!(self, permitted_attributes: permitted_attributes, overview_attributes: overview_attributes)
      end
    end

  end
end

ActiveRecord::Base.send :include, GenericResources::ActsAsGenericResource
