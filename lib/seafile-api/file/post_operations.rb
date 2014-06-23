module SeafileApi
  class Connect
    private
      #update file_
      def post_update(repo,data)
        http = curl_get("repos/#{repo}/update-link/")
        if is_http?(http)
          curl_post(cl_body_str(http),data).body_str
        else
          "something wrong #{http.body}"
        end

      end
=begin
    400 Bad request
    440 Invalid filename
    441 File already exists
    442 File size is too large
    443 Out of quota
    500 Internal server error
=end
      def post_upload(repo,data)
        http = curl_get("repos/#{repo}/upload-link/")
        if is_http?(http)
          curl_post(cl_body_str(http),data).body_str
        else
          "something wrong #{http.body_str}"
        end
      end

  end
end