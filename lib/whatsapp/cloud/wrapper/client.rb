require "faraday"

module Whatsapp
  module Cloud
    module Wrapper
      class Client
        BASE_URL = "https://graph.facebook.com".freeze
        VERSION = "v15.0"
        SUBSCRIBTIONS_PATH = "subscribed_apps".freeze #webooks endpoint
        PHONE_NUMBERS_PATH = "phone_numbers".freeze
        MESSAGES_PATH = "messages".freeze

        attr_reader :access_token, :adapter

        def initialize(access_token:, adapter: Faraday.default_adapter)
          @access_token = access_token
          @adapter = adapter
        end

        def debug_token(token: nil)
          input_token = token || access_token
          Collection.from_response connection.get("debug_token?input_token=#{input_token}", {}, {Authorization: "Bearer #{input_token}"}), type: AccessToken
        end

        def connection
          @connection ||= Faraday.new do |conn|
            conn.url_prefix = BASE_URL
            conn.request :json
            conn.response :json, content_type: "application/json"
            conn.adapter adapter
          end
        end

        def inspect
          "#<Whatsapp::Cloud::Wrapper::Client>"
        end
      end
    end
  end
end
  
