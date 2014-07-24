require 'rspec'
require_relative '../lib/seafile-api'
RSpec.configure do |config|
  config.after(:all) do
    test_dir = Dropbox::Spec.instance.find(Dropbox::Spec.test_dir) rescue nil
    test_dir.destroy if test_dir and !test_dir.is_deleted?
  end
end
email="kostiantyn@mastercom"
password="Gfh56"
host="httrofccom"
repo="03b88a04ef67a4"
$another_email="alexandrm"

SF = SeafileApi::Connect.new(email,password,host,repo)
