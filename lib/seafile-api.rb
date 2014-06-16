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
require "seafile-api/group_member"
require "seafile-api/group_message"
require "seafile-api/account"
require "seafile-api/starred"
require "seafile-api/file/dry_methods"
require "seafile-api/file/file_operations"
require "seafile-api/file/get_operations"
require "seafile-api/config"
require "seafile-api/file"
#TODO: write manual about seafile config