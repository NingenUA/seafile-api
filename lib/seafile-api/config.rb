module SeafileApi
  module Config

    class << self
      attr_accessor :user_name
      attr_accessor :password
      attr_accessor :host
      attr_accessor :repo
    end
    self.user_name  = 'kostiantyn.semchenko@masterofcode.com'
    self.password   = '7auVcKjoJB'
    self.host       = 'http://fs.masterofcode.com'
    self.repo       = '03b865ad-9153-4f24-9638-7f8a04ef67a4'
  end
end