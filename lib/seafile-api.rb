require 'json'
require 'curb'
require 'net/http'
include URI

module SeafileApi
  class Connect

    attr_accessor :user_name
    attr_accessor :password
    attr_accessor :host
    attr_accessor :repo
    def initialize(user_name = 'kostiantyn.semchenko@masterofcode.com',password   = '7auVcKjoJB',host= 'http://fs.masterofcode.com',repo= '03b865ad-9153-4f24-9638-7f8a04ef67a4' )
      self.user_name  = user_name
      self.password   = password
      self.host       = host
      self.repo       = repo
    end

  end

end
require "seafile-api/file/post_operations"
require "seafile-api/message"
require "seafile-api/group"
require "seafile-api/directory"
require "seafile-api/group/group"
require "seafile-api/group/group_member"
require "seafile-api/group/group_message"
require "seafile-api/account"
require "seafile-api/starred"
require "seafile-api/share"
require "seafile-api/library"
require "seafile-api/library/del_library"
require "seafile-api/library/get_library"
require "seafile-api/library/post_library"
require "seafile-api/shared/share"
require "seafile-api/shared/shared_files"
require "seafile-api/shared/shared_libraries"
require "seafile-api/file/dry_methods"
require "seafile-api/file/file_operations"
require "seafile-api/file/get_operations"
require "seafile-api/config"
require "seafile-api/file"
#TODO: write manual about seafile config