module SeafileApi
  class Connect
    def list_groups
      get_list_groups
    end
    #TODO: check why page unavailable
    def add_group(group_name)
      add_new_group(group_name)
    end

    private

    #curl -X PUT -d "group_name=newgroup" -H 'Authorization: Token f2210dacd9c6ccb8133606d94ff8e61d99b477fd' "https://cloud.seafile.com/api2/groups/"
    def add_new_group(group_name)
      token = get_sf_token
      url = "#{self.host}/api2/groups"
      c = curl_new(url,token)
      c.http_put(Curl::PostField.content('group_name', group_name))
      c.body_str
    end
    def get_list_groups
      token = get_sf_token
      http = curb_get("groups/",token)
      http.body_str
    end
  end
end