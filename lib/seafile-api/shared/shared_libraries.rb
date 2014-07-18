module SeafileApi
  class Connect
    private
    #curl -v -H 'Authorization: Token f2210dacd9c6ccb8133606d94ff8e61d99b477fd' -H 'Accept: application/json; indent=4' https://cloud.seafile.com/api2/shared-repos/
    def get_list_shared_libraries
      JSON.parse(curl_get("shared-repos/").body_str)
    end

    #curl -X PUT -H 'Authorization: Token f2210dacd9c6ccb8133606d94ff8e61d99b477fd' "https://cloud.seafile.com/api2/shared-repos/7d42522b-1f6f-465d-b9c9-879f8eed7c6c/?share_type=group&user=user@example.com&group_id=1&permission=rw"
    def put_share_library(repo_id,share_type,user,group_id,permission)
      curl_put("#{self.host}/api2/shared-repos/#{repo_id}/?share_type=#{share_type}&user=#{user}group_id=#{group_id}&permission=#{permission}").body_str
    end

    #curl -X DELETE -H 'Authorization: Token f2210dacd9c6ccb8133606d94ff8e61d99b477fd' "https://cloud.seafile.com/api2/shared-repos/7d42522b-1f6f-465d-b9c9-879f8eed7c6c/?share_type=personal&user=user@example.com&group_id=0"
    def delete_unshare_library(repo_id,share_type,user,group_id)
      curl_delete("#{self.host}/api2/shared-repos/#{repo_id}/?share_type=#{share_type}&user=#{user}group_id=#{group_id}").body_str
    end

    #curl -H 'Authorization: Token f2210dacd9c6ccb8133606d94ff8e61d99b477fd' "https://cloud.seafile.com/api2/beshared-repos/"
    def get_list_beshared_libraries
      JSON.parse(curl_get("beshared-repos/").body_str)
    end
  end
end