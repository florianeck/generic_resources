require "generic_resources/engine"
require "generic_resources/acts_as_generic_resource"
require "generic_resource"
require 'gem_config'


module GenericResources
  include GemConfig::Base

  with_configuration do
    has :controller_filters, classes: [String, Array]
    has :parent_controller, default: 'ApplicationController'
  end
end
