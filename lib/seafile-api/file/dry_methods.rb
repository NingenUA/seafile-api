
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

     def curl_post(url,data={})
      c = Curl::Easy.new(URI::encode(url))
      c.multipart_form_post = true
      c.headers['Authorization'] = "Token #{get_sf_token}"
      data.delete_if { |key, value| value.nil? }
      p_data = data.map do |key, value|
        if key != 'file'
          Curl::PostField.content(key, value)
        else
          Curl::PostField.file(key, value)
        end
      end
      c.http_post(p_data)
      c
     end

    def curl_get(url)
      Curl.get(URI::encode("#{self.host}/api2/#{url}")) do|http|
        http.headers['Authorization'] = "Token #{get_sf_token}"
      end
    end
    def curl_put(url,data={})
      c = Curl::Easy.new(URI::encode(url))
      c.headers['Authorization'] = "Token #{get_sf_token}"
      c.headers['Content-Type'] = 'application/json'
      data.delete_if { |key, value| value.nil? }
      c.put_data= data.to_json
      c.post
      c
    end
    def curl_delete(url,data={})
      c = Curl::Easy.new(URI::encode(url))
      c.headers['Authorization'] = "Token #{get_sf_token}"
      c.headers['Content-Type'] = 'application/json'

      c.put_data= data.to_json unless data ==''
      c.http_delete()
      c
    end

  end
end