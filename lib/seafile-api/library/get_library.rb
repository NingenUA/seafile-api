module SeafileApi
  class Connect
    private
    #curl -H 'Authorization: Token f2210dacd9c6ccb8133606d94ff8e61d99b477fd' "https://cloud.seafile.com/api2/default-repo/"
    def get_default_lib
      curl_get("default-repo/").body_str
    end

    #curl -G -H 'Authorization: Token 24fd3c026886e3121b2ca630805ed425c272cb96' -H 'Accept: application/json; indent=4' https://cloud.seafile.com/api2/repos/632ab8a8-ecf9-4435-93bf-f495d5bfe975/
    def get_lib_info(repo_id)
      curl_get("repos/#{repo_id}/").body_str
    end

    #curl -H 'Authorization: Token f2210dacd9c6ccb8133606d94ff8e61d9b477fd' -H 'Accept: application/json; indent=4' https://cloud.seafile.com/api2/repos/dae8cecc-2359-4d33-aa42-01b7846c4b32/download-info/
    def get_lib_download_info(repo_id)
      curl_get("repos/#{repo_id}/download-info/").body_str
    end

    #curl -G -H ‘Authorization: Token 24fd3c026886e3121b2ca630805ed425c272cb96’ -H ‘Accept: application/json; indent=4’ https://cloud.seafile.com/api2/search/?q=keyword
    def get_searched_lib(keyword)
      curl_get("search/?q=#{keyword}").body_str
    end
    #curl -H 'Authorization: Token 24fd3c026886e3121b2ca630805ed425c272cb96' -H 'Accept: application/json; indent=4' https://cloud.seafile.com/api2/repos/
    def get_list_lib
      curl_get("repos/").body_str
    end
    #curl -H 'Authorization: Token f2210dacd9c6ccb8133606d94ff8e61d99b477fd' "https://cloud.seafile.com/api2/virtual-repos/"
    def get_list_virtual_lib
      curl_get("virtual-repos/").body_str
    end

    #curl -H 'Authorization: Token f2210dacd9c6ccb8133606d94ff8e61d9b477fd' -H 'Accept: application/json; indent=4' https://cloud.seafile.com/api2/repos/dae8cecc-2359-4d33-aa42-01b7846c4b32/dir/sub_repo/?p=/\&name=sub_lib
    def get_create_sub_lib(repo_id,p,name)
      curl_get("repos/#{repo_id}/dir/sub_repo/?p=#{p}&name=#{name}").body_str
    end

    #curl -H 'Authorization: Token f2210dacd9c6ccb8133606d94ff8e61d9b477fd' -H 'Accept: application/json; indent=4' https://cloud.seafile.com/api2/repos/dae8cecc-2359-4d33-aa42-01b7846c4b32/owner/
    def get_lib_owner(repo_id)
      curl_get("repos/#{repo_id}/owner/").body_str
    end

    #curl -H 'Authorization: Token f2210dacd9c6ccb8133606d94ff8e61d9b477fd' -H 'Accept: application/json; indent=4' https://cloud.seafile.com/api2/repos/dae8cecc-2359-4d33-aa42-01b7846c4b32/history/
    def get_lib_history(repo_id)
      curl_get("repos/#{repo_id}/history/").body_str
    end
  end

end