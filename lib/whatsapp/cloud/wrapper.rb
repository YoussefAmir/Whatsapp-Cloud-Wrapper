# frozen_string_literal: true

require_relative "wrapper/version"
require_relative "wrapper/client"
require_relative "wrapper/error"
require_relative "wrapper/object"
require_relative "wrapper/collection"
require_relative "wrapper/objects/access_token"
require_relative "wrapper/objects/instance"

module Whatsapp
  module Cloud
    module Wrapper
      autoload :Client, "wrapper/client"
      autoload :Error, "wrapper/error"
      autoload :Object, "wrapper/object"
      autoload :Collection, "wrapper/collection"

      autoload :Instance, "wrapper/objects/instance"
      autoload :AccessToken, "wrapper/objects/access_token"
    end
  end
end
