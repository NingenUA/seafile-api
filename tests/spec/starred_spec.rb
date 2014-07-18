require_relative '../spec_helper'

describe 'SeafileApi' do

  describe 'starred file' do
    before(:all) do
      SF::upload_file('tests/spec/fixtures/test.pdf')
    end
    after(:all) do
      SF::del_file("/test.pdf")
    end


    it "should star_a_file" do
      expect(SF::star_a_file("/test.pdf")).to match("success")
    end
    it "should show list starred" do
      expect(SF::list_starred).to be_instance_of Array
    end
    it "should unstar a file" do
      expect(SF::unstar_a_file("/test.pdf")).to match("success")
    end
  end


end