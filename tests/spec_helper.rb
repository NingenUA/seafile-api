require 'rspec'
require_relative '../lib/seafile-api'
RSpec.configure do |config|
  config.after(:all) do
    test_dir = Dropbox::Spec.instance.find(Dropbox::Spec.test_dir) rescue nil
    test_dir.destroy if test_dir and !test_dir.is_deleted?
  end
end
email="kostiantyn.semchenko@masterofcode.com"
password="Gfhjkm123456"
host="http://fs.masterofcode.com"
repo="03b865ad-9153-4f24-9638-7f8a04ef67a4"
$another_email="alexandra.zinchenko@masterofcode.com"

SF = SeafileApi::Connect.new(email,password,host,repo)
