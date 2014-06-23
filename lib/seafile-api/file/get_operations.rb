module SeafileApi
  class Connect
    private
      def get_sf_token
          token_url = URI.parse("#{self.host}/api2/auth-token/")
          begin
            res = Net::HTTP.post_form(token_url, :username => self.user_name , :password => self.password)
          rescue Exception => e
            p "!!!!!!!!!!!!!!!! #{e}"
          end
          JSON.parse(res.body)["token"]
        end

        #curl -H 'Authorization: Token f2210dacd3606d94ff8e61d99b477fd' -H 'Accept: application/json; charset=utf-8; indent=4' https://cloud.seafile.com/api2/repos/dae8cecc-2359-4d33-aa42-01b7846c4b32/file/revision/?p=/foo.c\&commit_id=a1ec20709675f4dc8db825cdbca296be245d189b
        def get_link_file_revision(filename,commit_id,repo)
          http = curl_get("repos/#{repo}/file/revision/?p=#{filename}&commit_id=#{commit_id}")
          result(cl_body_str(http))
        end
        #!!! get file link method
        # maybe Errors
        # 400 Path is missing
        # 404 File not found
        # 520 Operation failed.
        def get_file_link(filename,repo)
          http = curl_get("repos/#{repo}/file/?p=#{filename}")
          result(cl_body_str(http))
        end
        def get_block(repo)
          http = curl_get("repos/#{repo}/upload-blks-link/")
          result(cl_body_str(http))
        end

        #curl -H 'Authorization: Token f2210dacd3606d94ff8e61d99b477fd' -H 'Accept: application/json; charset=utf-8; indent=4' https://cloud.seafile.com/api2/repos/dae8cecc-2359-4d33-aa42-01b7846c4b32/file/detail/?p=/foo.c
        #get file description
        def get_description(filename,repo)
          http = curl_get("repos/#{repo}/file/detail/?p=#{filename}")
          result(cl_body_str(http))
        end

        #curl -H 'Authorization: Token f2210dacd3606d94ff8e61d99b477fd' -H 'Accept: application/json; charset=utf-8; indent=4' https://cloud.seafile.com/api2/repos/dae8cecc-2359-4d33-aa42-01b7846c4b32/file/history/?p=/foo.c
        #get file History
        def get_history(filename,repo)
          http = curl_get("repos/#{repo}/file/history/?p=#{filename}")
          result(http.body_str.gsub('"', ''))
        end

     
  end
end