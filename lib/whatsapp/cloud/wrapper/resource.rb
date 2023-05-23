module Whatsapp
    module Cloud
        module Wrapper
            class Resource
                attr_reader :client

                def initialize(client)
                    @client = client
                end

                def get_request(url, params: [], headers: {})
                    client.connection.get(url, params, default_headers.merge(headers))
                end

                def default_headers
                    {Authorization: "Bearer #{client.access_token}"}
                end
            end
        end
    end
end
  
