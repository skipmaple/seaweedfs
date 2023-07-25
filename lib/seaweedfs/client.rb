module Seaweedfs
  class Client

    attr_reader :endpoint, :adapter

    def initialize(endpoint:, adapter: Faraday.default_adapter)
      @endpoint = normalize_endpoint(endpoint)
      @adapter = adapter
    end

    def connection(other_endpoint=nil)
      @connection ||= Faraday.new(other_endpoint || endpoint) do |conn|
        conn.request :json

        # conn.response :dates
        conn.response :json, content_type: "application/json"

        conn.adapter adapter
      end
    end

    def file
      FileResource.new(self)
    end

    def status
      Object.new connection.get("cluster/status?pretty=y").body
    end

    private

    def normalize_endpoint(endpoint)
      endpoint = "http://#{endpoint}" unless endpoint.start_with?('http')
      uri = URI.parse(endpoint)
      uri = URI.parse("http://#{endpoint}") unless uri.scheme

      if uri.scheme != 'http' && uri.scheme != 'https'
        fail Error, "Only HTTP and HTTPS endpoint are accepted."
      end

      uri
    end

  end
end
