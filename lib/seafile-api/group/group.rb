module SeafileApi

  class Connect
    private

    #curl -X PUT -d "group_name=newgroup" -H 'Authorization: Token f2210dacd9c6ccb8133606d94ff8e61d99b477fd' "https://cloud.seafile.com/api2/groups/"

    def add_new_group(group_name)
      c = curl_put("#{self.host}/api2/groups/",{"group_name" => group_name})
      c.body_str
    end

    def get_list_groups
      curl_get("groups/").body_str
    end

  end

end