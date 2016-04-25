module GenericResources
  module ActsAsGenericResource

    extend ActiveSupport::Concern

    included do
      extend ClassMethods
    end

    module ClassMethods
      def acts_as_generic_resource(permitted_attributes: [])
        if permitted_attributes.empty?
          permitted_attributes = self.column_names - ['id', 'created_at', 'updated_at']
        end

        GenericResource.register_resource!(self, permitted_attributes: permitted_attributes)
      end
    end

  end
end

ActiveRecord::Base.send :include, GenericResources::ActsAsGenericResource