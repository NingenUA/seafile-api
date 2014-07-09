require 'rspec'
require_relative '../lib/seafile-api'
RSpec.configure do |config|
  config.after(:all) do
    test_dir = Dropbox::Spec.instance.find(Dropbox::Spec.test_dir) rescue nil
    test_dir.destroy if test_dir and !test_dir.is_deleted?
  end
end