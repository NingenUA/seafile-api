require 'net/http'
require 'json'
require 'curb'
include URI
module SeafileApi
  class Files
    def self::get_link(filename)
      get_file_link(filename)
    end
    def self::get_token
      get_sf_token
    end
    def self::get_description(filename)
      get_file_description(filename)
    end
    def self::get_link_revision(filename,commit_id)
      get_link_file_revision(filename,commit_id)
    end
    def self::get_history(filename)
      get_file_history(filename)
    end
    def self::get_block_link
      get_block
    end

    def self::upload(file)
      put_file(file)
    end
    def self::update(file,target_file=nil)
      update_file(file,(target_file ||File.basename(file) ))
    end

    def self::create(filename)
      create_file(filename)
    end
    def self::rename(old_name,new_name)
        rename_file(old_name,new_name)
    end
    def self::copy(filename,dst_dir='/',dest_repo=SeafileApi::Config.repo)
      copy_file(filename,dst_dir,dest_repo)
    end
    def self::move(filename,dst_dir='/',dest_repo=SeafileApi::Config.repo)
      move_file(filename,dst_dir,dest_repo)
    end

    def self::delete(filename)
      delete_file(filename)
    end
=begin  not working
    def self::revert(filename,commit_id)
      revert_file(filename,commit_id)
    end
=end
    private
    #!!!!!!!!!operation with file sections
    #curl -X DELETE -v  -H 'Authorization: Token f2210dacd3606d94ff8e61d99b477fd' -H 'Accept: application/json; charset=utf-8; indent=4' https://cloud.seafile.com/api2/repos/dae8cecc-2359-4d33-aa42-01b7846c4b32
    def self.delete_file(filename)
      token =get_sf_token
      url = "#{SeafileApi::Config.host}/api2/repos/#{SeafileApi::Config.repo}/file/?p=/#{filename}"
      c = curl_new(URI::encode(url),token)
      c.headers['Accept'] = "application/json; charset=utf-8; indent=4"
      c.http_delete()
      c.body_str
    end

    #TODO: Revert  is not working, some problem with put and 2  send objects
    #curl -v -X PUT -d "commit_id=a1ec20709675f4dc8db825cdbca296be245d189b&p=/foo.c" -H "Authorization: Token f2210dacd9c6ccb8133606d94ff8e61d99b477fd" -H 'Accept: application/json; indent=4' https://cloud.seafile.com/api2/repos/8f5f2222-72a8-454f-ac40-8397c5a556a8/file/revert/
    def self.revert_file(filename,commit_id)
      token =get_sf_token
      url = "#{SeafileApi::Config.host}/api2/repos/#{SeafileApi::Config.repo}/file/revert/"
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
    def self.create_file(filename)
      token =get_sf_token
      url = "#{SeafileApi::Config.host}/api2/repos/#{SeafileApi::Config.repo}/file/?p=/#{filename}"
      c = curl_new(URI::encode(url),token)
      c.headers['Accept'] = "application/json; charset=utf-8; indent=4"
      c.http_post(Curl::PostField.content('operation', 'create'))
      c.body_str
    end

    #curl -v -d "operation=move&dst_repo=affc837f-7fdd-4e91-b88a-32caf99897f2&dst_dir=/" -H 'Authorization: Token f2210dacd9c6ccb8133606d94ff8e61d99b477fd' -H 'Accept: application/json; charset=utf-8; indent=4' https://cloud.seafile.com/api2/repos/dae8cecc-2359-4d33-aa42-01b7846c4b32/file/?p=/foo.c
    def self.move_file(filename,dst_dir,dst_repo)
      token =get_sf_token
      url = "#{SeafileApi::Config.host}/api2/repos/#{SeafileApi::Config.repo}/file/?p=/#{filename}"
      c = curl_new(URI::encode(url),token)
      c.headers['Accept'] = "application/json; charset=utf-8; indent=4"
      c.http_post(Curl::PostField.content('operation', 'move'),Curl::PostField.content('dst_repo', dst_repo),Curl::PostField.content('dst_dir', dst_dir))
      c.body_str
    end

    #curl -d "dst_repo=73ddb2b8-dda8-471b-b7a7-ca742b07483c&dst_dir=/&file_names=foo.c" -H 'Authorization: Token f2210dacd9c6ccb8133606d94ff8e61d99b477fd' "https://cloud.seafile.com/api2/repos/c7436518-5f46-4296-97db-2fcba4c8c8db/fileops/copy/
    def self.copy_file(filename,dst_dir,dst_repo)
      token =get_sf_token
      url = "#{SeafileApi::Config.host}/api2/repos/#{SeafileApi::Config.repo}/fileops/copy/"
      c = curl_new(URI::encode(url),token)
      c.headers['Accept'] = "application/json; charset=utf-8; indent=4"
      c.http_post(Curl::PostField.content('dst_repo', dst_repo),Curl::PostField.content('dst_dir', dst_dir),Curl::PostField.content('file_names', filename))
      c.body_str
    end

    #curl -v -d "operation=rename&newname=newfoo.c" -H 'Authorization: Token f2210dacd9c6ccb8133606d94ff8e61d99b477fd' -H 'Accept: application/json; charset=utf-8; indent=4' https://cloud.seafile.com/api2/repos/dae8cecc-2359-4d33-aa42-01b7846c4b32/file/?p=/foo.c
    def self.rename_file(old_name,new_name)
      token =get_sf_token
      url = "#{SeafileApi::Config.host}/api2/repos/#{SeafileApi::Config.repo}/file/?p=/#{old_name}"
      c = curl_new(URI::encode(url),token)
      c.headers['Accept'] = "application/json; charset=utf-8; indent=4"
      c.http_post(Curl::PostField.content('operation', 'rename'),Curl::PostField.content('newname', new_name))
      c.body_str
    end


    #!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! put section
    #update file_
    #TODO: analise and optimization arguments needed for file upload;
    #TODO: add validation check
    #TODO: execption rescue
    def self.update_file(file,target_file)
      token =get_sf_token
      http = curl_get("update-link/",token)
      if is_http?(http)
        url = cl_body_str(http)
        c = curl_new(URI::encode(url),token)
        c.http_post(Curl::PostField.file('file', file),Curl::PostField.content('filename', File.basename(file)),Curl::PostField.content('target_file', "/#{(target_file)}"))
        c.body_str
      else
        "something wrong #{http.body_str}"
      end

    end

    #upload file
    #TODO: analise and optimization arguments needed for file upload;
    #TODO: add validation check
    #TODO: execption rescue
=begin
  400 Bad request
  440 Invalid filename
  441 File already exists
  442 File size is too large
  443 Out of quota
  500 Internal server error
=end

    def self.put_file(file)
      token = get_sf_token
      http = curl_get("upload-link/",token)
      if is_http?(http)
         url = cl_body_str(http)
         c = curl_new(URI::encode(url),token)
         c.http_post(Curl::PostField.file('file', file),Curl::PostField.content('filename',File.basename(file)) ,Curl::PostField.content('parent_dir', '/'))
         c.body_str
      else
        "something wrong #{http.body_str}"
      end
    end
    #!!!!!!!!!!!!Get section


    #TODO: add check for user_name, password , and other
    def self.get_sf_token
      token_url = URI.parse("#{SeafileApi::Config.host}/api2/auth-token/")
      begin
        res = Net::HTTP.post_form(token_url, :username => SeafileApi::Config.user_name , :password => SeafileApi::Config.password)
      rescue Exception => e
        p e
      end
      JSON.parse(res.body)["token"]
    end

    #curl -H 'Authorization: Token f2210dacd3606d94ff8e61d99b477fd' -H 'Accept: application/json; charset=utf-8; indent=4' https://cloud.seafile.com/api2/repos/dae8cecc-2359-4d33-aa42-01b7846c4b32/file/revision/?p=/foo.c\&commit_id=a1ec20709675f4dc8db825cdbca296be245d189b
    def self.get_link_file_revision(filename,commit_id)
      token =get_sf_token
      http = curl_get("file/revision/?p=/#{filename}\&commit_id=#{commit_id}",token)
      result(cl_body_str(http))
    end

    #TODO: add download file methods http://stackoverflow.com/questions/2263540/how-do-i-download-a-binary-file-over-http
    #!!! get file link method
    # maybe Errors
    # 400 Path is missing
    # 404 File not found
    # 520 Operation failed.
    def self.get_file_link(filename)
      token =get_sf_token
      http = curl_get("file/?p=/#{filename}",token)
      result(cl_body_str(http))
    end
    def self.get_block
      token =get_sf_token
      http = curl_get("upload-blks-link/",token)
      result(cl_body_str(http))
    end

    #curl -H 'Authorization: Token f2210dacd3606d94ff8e61d99b477fd' -H 'Accept: application/json; charset=utf-8; indent=4' https://cloud.seafile.com/api2/repos/dae8cecc-2359-4d33-aa42-01b7846c4b32/file/detail/?p=/foo.c
    #get file description
    def self.get_file_description(filename)
      token = get_sf_token
      http = curl_get("file/detail/?p=/#{filename}",token)
      result(cl_body_str(http))
    end

    #curl -H 'Authorization: Token f2210dacd3606d94ff8e61d99b477fd' -H 'Accept: application/json; charset=utf-8; indent=4' https://cloud.seafile.com/api2/repos/dae8cecc-2359-4d33-aa42-01b7846c4b32/file/history/?p=/foo.c
    #get file History
    def self.get_file_history(filename)
      token = get_sf_token
      http = curl_get("file/history/?p=/#{filename}",token)
      self.result(http.body_str.gsub('"', ''))
    end

    # DRY methods

    def self.result(result)
      if !result.scan('File not found').empty?
        "File not found"
      elsif !result.scan('Path is missing').empty?
        "Path is missing"
      elsif !result.scan('Operation failed').empty?
        "Operation failed"
      elsif !result.scan('http').empty?
        "#{result}"
      else
        "#{result}"
      end
    end


    def self.is_http?(http)
      !http.body_str.gsub('"', '').scan('http').empty?
    end
    def self.cl_body_str(http)
      http.body_str.gsub('"', '')
    end
    def self.curl_new(url,token)
      c = Curl::Easy.new(url)
      c.multipart_form_post = true
      c.headers['Authorization'] = "Token #{token}"
      c
    end

    def self.curl_get(url,token)
      Curl.get(URI::encode("#{SeafileApi::Config.host}/api2/repos/#{SeafileApi::Config.repo}/#{url}")) do|http|
        http.headers['Authorization'] = "Token #{token}"
      end
    end
  end
end

