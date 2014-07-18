module SeafileApi
  class Connect
    def list_starred
      get_list_starred_files
    end
    def star_a_file(file,repo_id=self.repo)
      post_star_file({"repo_id" => repo_id, "p" => file})
    end
    def unstar_a_file(file,repo_id=self.repo)
      delete_unstar_file(repo_id,file)
    end

    private
    #https://cloud.seafile.com/api2/starredfiles/
    def get_list_starred_files
       JSON.parse(curl_get("starredfiles/").body_str)
    end
    #curl -v -d "repo_id=dae8cecc-2359-4d33-aa42-01b7846c4b32&p=/foo.md" -H 'Authorization: Token f2210dacd9c6ccb8133606d94ff8e61d99b477fd' -H 'Accept: application/json; charset=utf-8; indent=4' https://cloud.seafile.com/api2/starredfiles/
    def post_star_file(data)
      curl_post("#{self.host}/api2/starredfiles/",data).body_str
    end
    #curl -X DELETE -v  -H 'Authorization: Token f2210dacd9c6ccb8133606d94ff8e61d99b477fd' -H 'Accept: application/json; charset=utf-8; indent=4' 'https://cloud.seafile.com/api2/starredfiles/?repo_id=dae8cecc-2359-4d33-aa42-01b7846c4b32&p=/foo.md'
    def delete_unstar_file(repo_id,file)
      curl_delete("#{self.host}/api2/starredfiles/?repo_id=#{repo_id}&p=#{file}").body_str
    end
  end
end