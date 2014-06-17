module SeafileApi
  class Connect
    private
    #curl -H 'Authorization: Token f2210dacd9c6ccb8133606d94ff8e61d99b477fd' "https://cloud.seafile.com/api2/shared-files/"
    def get_list_shared_files
      token = get_sf_token
      http = curb_get("shared-repos/",token)
      http.body_str
    end

    #curl -H 'Authorization: Token f2210dacd9c6ccb8133606d94ff8e61d99b477fd' "https://cloud.seafile.com/api2/f/ad93cd0d66/"
    def get_shared_file_link(file_t)
      token = get_sf_token
      http = curb_get("f/#{file_t}/",token)
      http.body_str
    end

    #curl -H 'Authorization: Token f2210dacd9c6ccb8133606d94ff8e61d99b477fd' "https://cloud.seafile.com/api2/s/f/c5aa5f0219/"
    def get_private_shared_file_link(file_t)
      token = get_sf_token
      http = curb_get("s/f/#{file_t}/",token)
      http.body_str
    end

    #curl -H 'Authorization: Token f2210dacd9c6ccb8133606d94ff8e61d99b477fd' "https://cloud.seafile.com/api2/f/ad93cd0d66/detail/"
    def get_share_file_detail(file_t)
      token = get_sf_token
      http = curb_get("f/#{file_t}/",token)
      http.body_str
    end

    #curl -H 'Authorization: Token f2210dacd9c6ccb8133606d94ff8e61d99b477fd' "https://cloud.seafile.com/api2/s/f/c5aa5f0219/detail/"
    def get_private_shared_file_detail(file_t)
      token = get_sf_token
      http = curb_get("s/f/#{file_t}/detail/",token)
      http.body_str
    end

    #curl -v -X DELETE -H 'Authorization: Token f2210dacd9c6ccb8133606d94ff8e61d99b477fd' "https://cloud.seafile.com/api2/shared-files/?t=94aace406a"
    def del_shared_file(file_t)
      token =get_sf_token
      url = "#{self.host}/api2/shared-links/?t=#{file_t}"
      c = curl_new(url,token)
      c.headers['Accept'] = "application/json; charset=utf-8; indent=4"
      c.http_delete()
      c.body_str
    end
  end

end