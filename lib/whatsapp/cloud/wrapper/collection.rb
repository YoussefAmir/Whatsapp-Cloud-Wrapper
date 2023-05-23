require "ostruct"

module Whatsapp
    module Cloud
        module Wrapper
            class Collection
                attr_reader :data, :previous_cursor, :next_cursor
                
                def self.from_response(response, type:)
                    body = response.body
                    new(
                        data: parse_body(body, type),
                        previous_cursor: body.dig("paging", "previous"),
                        next_cursor: body.dig("paging", "next")
                    )
                end

                def self.parse_body(body, type)
                    response_data = body.dig("data")
                    response_data.is_a?(Array) ? response_data.map { |attrs| type.new(attrs) } : type.new(response_data)
                end

                def initialize(data:, previous_cursor:, next_cursor:)
                    @data = data
                    @previous_cursor = previous_cursor&.presence
                    @next_cursor = next_cursor&.presence
                end
            end
        end
    end
end
  
