module SeafileApi
  class Connect
    private
      #update file_
      #TODO: analise and optimization arguments needed for file upload;
      #TODO: add validation check
      #TODO: execption rescue
      def update(file,target_file)
        token =get_sf_token
        http = curl_get("update-link/",token)
        if is_http?(http)
          url = cl_body_str(http)
          c = curl_new(URI::encode(url),token)
          c.http_post(Curl::PostField.file('file', file),Curl::PostField.content('filename', File.basename(file)),Curl::PostField.content('target_file', "/#{(target_file)}"))
          c.body_str
        else
          "something wrong #{http.body_str}"
        end

      end

      #upload file
      #TODO: analise and optimization arguments needed for file upload;
      #TODO: add validation check
      #TODO: execption rescue
=begin
    400 Bad request
    440 Invalid filename
    441 File already exists
    442 File size is too large
    443 Out of quota
    500 Internal server error
=end
      def upload(file)
        token = get_sf_token
        http = curl_get("upload-link/",token)
        if is_http?(http)
          url = cl_body_str(http)
          c = curl_new(URI::encode(url),token)
          c.http_post(Curl::PostField.file('file', file),Curl::PostField.content('filename',File.basename(file)) ,Curl::PostField.content('parent_dir', '/'))
          c.body_str
        else
          "something wrong #{http.body_str}"
        end
      end

  end
end