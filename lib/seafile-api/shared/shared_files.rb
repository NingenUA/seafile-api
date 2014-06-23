module SeafileApi
  class Connect
    private
    #curl -H 'Authorization: Token f2210dacd9c6ccb8133606d94ff8e61d99b477fd' "https://cloud.seafile.com/api2/shared-files/"
    def get_list_shared_files
      curl_get("shared-files/").body_str
    end
    #curl -H 'Authorization: Token f2210dacd9c6ccb8133606d94ff8e61d99b477fd' "https://cloud.seafile.com/api2/f/ad93cd0d66/"
    def get_shared_file_link(file_t)
      curl_get("f/#{file_t}/").body_str
    end

    #curl -H 'Authorization: Token f2210dacd9c6ccb8133606d94ff8e61d99b477fd' "https://cloud.seafile.com/api2/s/f/c5aa5f0219/"
    def get_private_shared_file_link(file_t)
      curl_get("s/f/#{file_t}/").body_str
    end

    #curl -H 'Authorization: Token f2210dacd9c6ccb8133606d94ff8e61d99b477fd' "https://cloud.seafile.com/api2/f/ad93cd0d66/detail/"
    def get_share_file_detail(file_t)
      curl_get("f/#{file_t}/detail/").body_str
    end

    #curl -H 'Authorization: Token f2210dacd9c6ccb8133606d94ff8e61d99b477fd' "https://cloud.seafile.com/api2/s/f/c5aa5f0219/detail/"
    def get_private_shared_file_detail(file_t)
      curl_get("s/f/#{file_t}/detail/").body_str
    end

    #curl -v -X DELETE -H 'Authorization: Token f2210dacd9c6ccb8133606d94ff8e61d99b477fd' "https://cloud.seafile.com/api2/shared-files/?t=94aace406a"
    def delete_shared_file(file_t)
      curl_delete("#{self.host}/api2/shared-links/?t=#{file_t}").head.split()[2]
    end
  end

end