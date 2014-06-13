module SeafileApi
  class Connect
    private

    def result(result)
      if !result.scan('File not found').empty?
        "File not found"
      elsif !result.scan('Path is missing').empty?
        "Path is missing"
      elsif !result.scan('Operation failed').empty?
        "Operation failed"
      elsif !result.scan('http').empty?
        "#{result}"
      else
        "#{result}"
      end
    end

    def is_http?(http)
      !http.body_str.gsub('"', '').scan('http').empty?
    end

    def cl_body_str(http)
      http.body_str.gsub('"', '')
    end

    def curl_new(url,token)
      c = Curl::Easy.new(url)
      c.multipart_form_post = true
      c.headers['Authorization'] = "Token #{token}"
      c
    end

    def curl_get(url,token)
      Curl.get(URI::encode("#{self.host}/api2/repos/#{self.repo}/#{url}")) do|http|
        http.headers['Authorization'] = "Token #{token}"
      end
    end

  end
end