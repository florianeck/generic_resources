require "generic_resources/engine"
require "generic_resources/acts_as_generic_resource"
require "generic_resource"
require 'gem_config'
require 'kaminari'

module GenericResources
  include GemConfig::Base

  with_configuration do
    has :controller_filters, classes: [String, Array]
    has :parent_controller, default: 'ApplicationController'
    has :per_page, default: 50
  end
end
