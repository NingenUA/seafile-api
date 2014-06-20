module SeafileApi
  class Connect
    private
      #update file_
      #TODO: test
      #TODO: analise and optimization arguments needed for file upload;
      #TODO: add validation check
      #TODO: execption rescue
      def update(repo,data)
        http = curl_get("repos/#{repo}/update-link/")
        p http
        p http.body
        if is_http?(http)
          curb_post(cl_body_str(http),data).body_str
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
      def upload(file,repo)
        http = curl_get("repos/#{repo}/upload-link/")
        if is_http?(http)
          curb_post(http,data).body_str
        else
          "something wrong #{http.body_str}"
        end
      end

  end
end