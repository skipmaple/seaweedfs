module Seaweedfs
  class FileResource < Resource

    def dir_assign
      Object.new post_request('dir/assign', body: {}).body
    end

    def upload(file_path, fid, public_url)
      public_url = enforce_uri_schema(public_url)
      url = URI.join(public_url, fid).to_s

      Faraday::Request.register_middleware(multipart: Faraday::Multipart::Middleware)

      conn = Faraday.new(url) do |f|
        f.request :multipart
      end

      payload = { file: Faraday::FilePart.new(file_path, ::MimeMagic.by_path(file_path), ::File.basename(file_path)) }
      response = conn.post('', payload)

      File.new JSON.parse(response.body) rescue nil
    end

    def delete(fid, public_url)
      public_url = enforce_uri_schema(public_url)
      url = URI.join(public_url, fid).to_s
      response = Faraday.delete(url)

      Object.new JSON.parse(response.body)
    end

    def url(fid, public_url)
      url = "#{public_url}/#{fid}"
      url = "http://#{url}" unless url.start_with?('http')
      url
    end

    def read(fid, public_url)
      url = url(fid, public_url)
      response = Faraday.get(url)

      response.body
    end

    private

    def enforce_uri_schema(url)
      return url if url.start_with?('http://') || url.start_with?('https://')
      "http://#{url}"
    end

  end
end
