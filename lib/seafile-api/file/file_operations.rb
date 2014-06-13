module SeafileApi
  class Connect
    private
     #!!!!!!!!!operation with file sections
     #curl -X DELETE -v  -H 'Authorization: Token f2210dacd3606d94ff8e61d99b477fd' -H 'Accept: application/json; charset=utf-8; indent=4' https://cloud.seafile.com/api2/repos/dae8cecc-2359-4d33-aa42-01b7846c4b32
     def delete(filename)
       token =get_sf_token
       url = "#{self.host}/api2/repos/#{self.repo}/file/?p=/#{filename}"
       c = curl_new(URI::encode(url),token)
       c.headers['Accept'] = "application/json; charset=utf-8; indent=4"
       c.http_delete()
       c.body_str
     end

     #TODO: Revert  is not working, some problem with put and 2  send objects
     #curl -v -X PUT -d "commit_id=a1ec20709675f4dc8db825cdbca296be245d189b&p=/foo.c" -H "Authorization: Token f2210dacd9c6ccb8133606d94ff8e61d99b477fd" -H 'Accept: application/json; indent=4' https://cloud.seafile.com/api2/repos/8f5f2222-72a8-454f-ac40-8397c5a556a8/file/revert/
     def revert(filename,commit_id)
       token =get_sf_token
       url = "#{self.host}/api2/repos/#{self.repo}/file/revert/"
       http = Curl.put(URI::encode(url)) do |http|
         http.multipart_form_post = true
         http.headers['Authorization'] = "Token #{token}"
         http.headers['Accept'] = "application/json; charset=utf-8; indent=4"
         http.content['commit_id']=commit_id
         http.content['p']= filename
       end
       http.body_str
     end


     #curl -v -d "operation=create" -H 'Authorization: Token f2210dacd9c6ccb8133606d94ff8e61d99b477fd' -H 'Accept: application/json; charset=utf-8; indent=4' https://cloud.seafile.com/api2/repos/dae8cecc-2359-4d33-aa42-01b7846c4b32/file/?p=/foo.c
     def create(filename)
       token =get_sf_token
       url = "#{self.host}/api2/repos/#{self.repo}/file/?p=/#{filename}"
       c = curl_new(URI::encode(url),token)
       c.headers['Accept'] = "application/json; charset=utf-8; indent=4"
       c.http_post(Curl::PostField.content('operation', 'create'))
       c.body_str
     end

     #curl -v -d "operation=move&dst_repo=affc837f-7fdd-4e91-b88a-32caf99897f2&dst_dir=/" -H 'Authorization: Token f2210dacd9c6ccb8133606d94ff8e61d99b477fd' -H 'Accept: application/json; charset=utf-8; indent=4' https://cloud.seafile.com/api2/repos/dae8cecc-2359-4d33-aa42-01b7846c4b32/file/?p=/foo.c
     def move(filename,dst_dir,dst_repo)
       token =get_sf_token
       url = "#{self.host}/api2/repos/#{self.repo}/file/?p=/#{filename}"
       c = curl_new(URI::encode(url),token)
       c.headers['Accept'] = "application/json; charset=utf-8; indent=4"
       c.http_post(Curl::PostField.content('operation', 'move'),Curl::PostField.content('dst_repo', dst_repo),Curl::PostField.content('dst_dir', dst_dir))
       c.body_str
     end

     #curl -d "dst_repo=73ddb2b8-dda8-471b-b7a7-ca742b07483c&dst_dir=/&file_names=foo.c" -H 'Authorization: Token f2210dacd9c6ccb8133606d94ff8e61d99b477fd' "https://cloud.seafile.com/api2/repos/c7436518-5f46-4296-97db-2fcba4c8c8db/fileops/copy/
     def copy(filename,dst_dir,dst_repo)
       token =get_sf_token
       url = "#{self.host}/api2/repos/#{self.repo}/fileops/copy/"
       c = curl_new(URI::encode(url),token)
       c.headers['Accept'] = "application/json; charset=utf-8; indent=4"
       c.http_post(Curl::PostField.content('dst_repo', dst_repo),Curl::PostField.content('dst_dir', dst_dir),Curl::PostField.content('file_names', filename))
       c.body_str
     end

     #curl -v -d "operation=rename&newname=newfoo.c" -H 'Authorization: Token f2210dacd9c6ccb8133606d94ff8e61d99b477fd' -H 'Accept: application/json; charset=utf-8; indent=4' https://cloud.seafile.com/api2/repos/dae8cecc-2359-4d33-aa42-01b7846c4b32/file/?p=/foo.c
     def rename(old_name,new_name)
       token =get_sf_token
       url = "#{self.host}/api2/repos/#{self.repo}/file/?p=/#{old_name}"
       c = curl_new(URI::encode(url),token)
       c.headers['Accept'] = "application/json; charset=utf-8; indent=4"
       c.http_post(Curl::PostField.content('operation', 'rename'),Curl::PostField.content('newname', new_name))
       c.body_str
     end
  end
end