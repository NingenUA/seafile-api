module SeafileApi
  class Connect
    private
     #!!!!!!!!!operation with file sections
     #curl -X DELETE -v  -H 'Authorization: Token f2210dacd3606d94ff8e61d99b477fd' -H 'Accept: application/json; charset=utf-8; indent=4' https://cloud.seafile.com/api2/repos/dae8cecc-2359-4d33-aa42-01b7846c4b32
     def delete_file(filename,repo)
       curl_delete("#{self.host}/api2/repos/#{repo}/file/?p=#{filename}").body_str
     end

     #curl -v -X PUT -d "commit_id=a1ec20709675f4dc8db825cdbca296be245d189b&p=/foo.c" -H "Authorization: Token f2210dacd9c6ccb8133606d94ff8e61d99b477fd" -H 'Accept: application/json; indent=4' https://cloud.seafile.com/api2/repos/8f5f2222-72a8-454f-ac40-8397c5a556a8/file/revert
     def post_revert(filename,commit_id,repo)
       curl_put("#{self.host}/api2/repos/#{repo}/file/revert",{"commit_id" => commit_id,"p" => filename }).body_str
     end


     #curl -v -d "operation=create" -H 'Authorization: Token f2210dacd9c6ccb8133606d94ff8e61d99b477fd' -H 'Accept: application/json; charset=utf-8; indent=4' https://cloud.seafile.com/api2/repos/dae8cecc-2359-4d33-aa42-01b7846c4b32/file/?p=/foo.c
     def post_file(filename,repo)
       curl_post("#{self.host}/api2/repos/#{repo}/file/?p=#{filename}",{"operation"=> "create"}).body_str
     end

     #curl -v -d "operation=move&dst_repo=affc837f-7fdd-4e91-b88a-32caf99897f2&dst_dir=/" -H 'Authorization: Token f2210dacd9c6ccb8133606d94ff8e61d99b477fd' -H 'Accept: application/json; charset=utf-8; indent=4' https://cloud.seafile.com/api2/repos/dae8cecc-2359-4d33-aa42-01b7846c4b32/file/?p=/foo.c
     def post_move(filename,src_repo,data)
       curl_post("#{self.host}/api2/repos/#{src_repo}/file/?p=#{filename}",data).body_str
     end

     #curl -d "dst_repo=73ddb2b8-dda8-471b-b7a7-ca742b07483c&dst_dir=/&file_names=foo.c" -H 'Authorization: Token f2210dacd9c6ccb8133606d94ff8e61d99b477fd' "https://cloud.seafile.com/api2/repos/c7436518-5f46-4296-97db-2fcba4c8c8db/fileops/copy/
     def post_copy(src_repo,data)
       curl_post("#{self.host}/api2/repos/#{src_repo}/fileops/copy/",data).body_str
     end

     #curl -v -d "operation=rename&newname=newfoo.c" -H 'Authorization: Token f2210dacd9c6ccb8133606d94ff8e61d99b477fd' -H 'Accept: application/json; charset=utf-8; indent=4' https://cloud.seafile.com/api2/repos/dae8cecc-2359-4d33-aa42-01b7846c4b32/file/?p=/foo.c
     def post_rename(old_name,repo,data)
       curl_post("#{self.host}/api2/repos/#{repo}/file/?p=#{old_name}",data).body_str
     end
  end
end