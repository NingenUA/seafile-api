module SeafileApi

  class Connect
    def list_dir_entry(path='/',repo=self.repo)
      get_list_dir_entry(repo,path)
    end
    def create_dir(path,repo=self.repo)
      post_create_dir(path,repo)
    end

    # You do not have permission to perform this action
    def del_dir(path,repo=self.repo)
      delete_directory(path,repo)
    end
    def download_dir(path,repo=self.repo)
      get_download_dir(path,repo)
    end
    # You do not have permission to perform this action
    def share_dir(email,path,perm="r",repo=self.repo,s_type="d")
      post_share_dir(repo,{"email"=> email, "path"=> path,"s_type"=> s_type,"perm"=> perm})
    end

    private
    #curl -H "Authorization: Token f2210dacd9c6ccb8133606d94ff8e6fd" -H 'Accept: application/json; indent=4' https://cloud.seafile.com/api2/repos/99b758e6-91ab-4265-b705-925367374cf0/dir/?p=/foo
    def get_list_dir_entry(repo,path)
      http = curl_get("repos/#{repo}/dir/?p=#{path}")
      JSON.parse(http.body_str)
    end


    #curl -d  "operation=mkdir" -v  -H 'Authorization: Tokacd9c6ccb8133606d94ff8e61d99b477fd' -H 'Accept: application/json; charset=utf-8; indent=4' https://cloud.seafile.com/api2/repos/dae8cecc-2359-4d33-aa42-01b7846c4b32/dir/?p=/foo
    def post_create_dir(path,repo)
      curl_post("#{self.host}/api2/repos/#{repo}/dir/?p=#{path}",{"operation"=>"mkdir"}).body_str
    end


   #curl -X DELETE -v  -H 'Authorization: Token f2210dacd3606d94ff8e61d99b477fd' -H 'Accept: application/json; charset=utf-8; indent=4' https://cloud.seafile.com/api2/repos/dae8cecc-2359-4d33-aa42-01b7846c4b32/dir/?p=/foo
    def delete_directory(path,repo)
      curl_delete("#{self.host}/api2/repos/#{repo}/dir/?p=#{path}").body_str
    end

    #curl -H 'Authorization: Token f2210dacd3606d94ff8e61d99b477fd' -H 'Accept: application/json; charset=utf-8; indent=4' https://cloud.seafile.com/api2/repos/dae8cecc-2359-4d33-aa42-01b7846c4b32/dir/download/?p=/foo
    def get_download_dir(path,repo)
      http = curl_get("repos/#{repo}/dir/download/?p=#{path}")
      cl_body_str(http)
    end

    #curl -v -X POST -d "emails=user@example.com&s_type=d&path=/dir&perm=r" -H 'Authorization: Token f2210dacd3606d94ff8e61d99b477fd' -H 'Accept: application/json; charset=utf-8; indent=4' https://cloud.seafile.com/api2/repos/dae8cecc-2359-4d33-aa42-01b7846c4b32/dir/share/
    def post_share_dir(repo,data)
      curl_post("#{self.host}/api2/repos/#{repo}/dir/share/",data).body_str

    end
  end

end