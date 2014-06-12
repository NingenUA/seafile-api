require 'net/http'
require 'json'
require 'curb'
include URI
module SeafileApi
  class Files
    def self::get_link(filename)
      self::get_file_link(filename)
    end
    def self::get_token
      self::get_sf_token
    end
    def self::get_description(filename)
      self::get_file_description(filename)
    end
    def self::upload(file)
      self::put_file(file)
    end
    def self::get_history(filename)
      self::get_file_history(filename)
    end
    def self::update(file,target_file=nil)
      self::update_file(file,(target_file ||File.basename(file) ))
    end
    def self::create(filename)
      create_file(filename)
    end
    private
    def self::create_filename(filename)
      token = self.get_sf_token
      c = Curl::Easy.new("#{SeafileApi::Config.host}/api2/repos/#{SeafileApi::Config.repo}/file/?p=/#{filename}")
      c.multipart_form_post = true
      c.headers['Authorization'] = "Token #{token}"
      c.headers['Accept'] = "application/json; charset=utf-8; indent=4"
      c.http_post(Curl::PostField.content('operation', 'create'))
      #
      #https://cloud.seafile.com/api2/repos/dae8cecc-2359-4d33-aa42-01b7846c4b32/file/?p=/foo.c
      #curl -v -d "operation=create" -H 'Authorization: Token f2210dacd9c6ccb8133606d94ff8e61d99b477fd' -H 'Accept: application/json; charset=utf-8; indent=4'
    end
    #update file_
    #TODO: analise and optimization arguments needed for file upload;
    #TODO: add validation check
    #TODO: execption rescue
    def self.update_file(file,target_file)
      token = self.get_sf_token
      http = self.curl_get("update-link/",token)
      if is_http?(http)
        c = curl_new(http,token)
        c.http_post(Curl::PostField.file('file', file),Curl::PostField.content('filename', File.basename(file)),Curl::PostField.content('target_file', "/#{(target_file)}"))
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
      token = self.get_sf_token
      http = self.curl_get("upload-link/",token)
      if is_http?(http)
         c = curl_new(http,token)
         c.http_post(Curl::PostField.file('file', file),Curl::PostField.content('filename',File.basename(file)) ,Curl::PostField.content('parent_dir', '/'))
      else
        "something wrong #{http.body_str}"
      end
    end

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

    #TODO: add download file methods http://stackoverflow.com/questions/2263540/how-do-i-download-a-binary-file-over-http
    #!!! get file link method
    # maybe Errors
    # 400 Path is missing
    # 404 File not found
    # 520 Operation failed.
    def self.get_file_link(filename)
      token = self.get_sf_token
      http = self.curl_get("file/?p=/#{filename}",token)
      result(http.body_str.gsub('"', ''))
    end

    #curl -H 'Authorization: Token f2210dacd3606d94ff8e61d99b477fd' -H 'Accept: application/json; charset=utf-8; indent=4' https://cloud.seafile.com/api2/repos/dae8cecc-2359-4d33-aa42-01b7846c4b32/file/detail/?p=/foo.c
    #get file description
    def self.get_file_description(filename)
      token = self.get_sf_token
      http = self.curl_get("file/detail/?p=/#{filename}",token)
      result(http.body_str.gsub('"', ''))
    end

    #curl -H 'Authorization: Token f2210dacd3606d94ff8e61d99b477fd' -H 'Accept: application/json; charset=utf-8; indent=4' https://cloud.seafile.com/api2/repos/dae8cecc-2359-4d33-aa42-01b7846c4b32/file/history/?p=/foo.c
    #get file History
    def self.get_file_history(filename)
      token = self.get_sf_token
      http = self.curl_get("file/history/?p=/#{filename}",token)
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
      http.body_str.gsub('"', '').scan('http').empty?
    end
    def self.curl_new(http,token)
      url = http.body_str.gsub('"', '')
      c = Curl::Easy.new(url)
      c.multipart_form_post = true
      c.headers['Authorization'] = "Token #{token}"
      c
    end
    def self.curl_get(url,token)
      Curl.get("#{SeafileApi::Config.host}/api2/repos/#{SeafileApi::Config.repo}/#{url}") do|http|
        http.headers['Authorization'] = "Token #{token}"
      end
    end
  end
end


=begin
def self.send_by_faye(channel, vars)
  message = {:channel => channel, :data => vars, :ext => {:auth_token => FAYE_TOKEN}}
  uri = URI.parse('http://127.0.0.1:9292/faye')
  Net::HTTP.post_form(uri, :message => message.to_json)
end

def self.get_resume(filename)
  token = self::get_sf_token
  self::get_sf_file_content(token, ENV['sf_candidate_repo'], filename)
end
def self.put_resume(filename,user_id)
  token = self::get_sf_token
  result = self::get_resume_url(user_id)
  if result == "{error_msg: File not found}"
    self::put_sf_file_content(token, ENV['sf_candidate_repo'], filename,user_id)
  elsif result ==  "{detail: You do not have permission to perform this action.}"
    self::put_resume(filename,user_id)
  else
    self::update_sf_file_content(token,  ENV['sf_candidate_repo'], filename,user_id)
  end
end
def self.get_resume_url(user_id)
  filename = "#{user_id}.pdf"
  token = self::get_sf_token
  self::get_sf_file_link(token, ENV['sf_candidate_repo'], filename)
end

private
def self.get_sf_token
  token_url = URI.parse("#{ENV['sf_host']}/api2/auth-token/")
  res = Net::HTTP.post_form(token_url, :username => ENV['sf_username'], :password => ENV['sf_password'])
  ActiveSupport::JSON.decode(res.body)["token"]
end
def self.get_sf_file_link(token, repo, filename)
  http = Curl.get("#{ENV['sf_host']}/api2/repos/#{repo}/file/?p=/#{filename}") do|http|
    http.headers['Authorization'] = "Token #{token}"
  end
  http.body_str.gsub('"', '')
end

def self.get_sf_file_content(token, repo, filename)
  http = Curl.get("#{ENV['sf_host']}/api2/repos/#{repo}/file/?p=/#{filename}") do|http|
    http.headers['Authorization'] = "Token #{token}"
  end
  yomu = Yomu.new http.body_str.gsub('"', '')
  self.plain_to_html(yomu.text)
end
def self.update_sf_file_content(token, repo, filename,user_id)
  http = Curl.get("#{ENV['sf_host']}/api2/repos/#{repo}/update-link/") do|http|
    http.headers['Authorization'] = "Token #{token}"
  end
  url = http.body_str.gsub('"', '')
  c = Curl::Easy.new(url)
  c.multipart_form_post = true
  c.headers['Authorization'] = "Token #{token}"
  c.http_post(Curl::PostField.file('file', filename),Curl::PostField.content('filename', "#{user_id}.pdf"),Curl::PostField.content('target_file', "/#{user_id}.pdf"))
end

def self.put_sf_file_content(token, repo, filename,user_id)
  http = Curl.get("#{ENV['sf_host']}/api2/repos/#{repo}/upload-link/") do|http|
    http.headers['Authorization'] = "Token #{token}"
  end
  url = http.body_str.gsub('"', '')
  c = Curl::Easy.new(url)
  c.multipart_form_post = true
  c.headers['Authorization'] = "Token #{token}"
  c.http_post(Curl::PostField.file('file', filename),Curl::PostField.content('filename', "#{user_id}.pdf"),Curl::PostField.content('parent_dir', '/'))
end

def self.plain_to_html(content)
  content.gsub(/ *\n+/, '<br />')
end
=end