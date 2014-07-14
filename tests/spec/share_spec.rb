require_relative '../spec_helper'

describe 'SeafileApi' do

  describe 'share file' do
    before(:all) do
      SF::upload_file('tests/spec/fixtures/test.pdf')
      @file_share_link= SF::create_file_share_link("/test.pdf")
      @shared_token = @file_share_link.split('/').last
    end
    after(:all) do
      SF::del_file("/test.pdf")
    end

    it "should create file share link" do

      expect(@file_share_link).to match("http")
    end

    it "should show list share link" do
      expect(SF::list_file_share_link).to match("fileshares")
    end


    it "should show list shared file" do
      expect(SF::list_shared_files).to match("priv_share_in")
    end
    it "should show list share link" do
      expect(SF::shared_file_link(@shared_token)).to match("files")
    end
    it "should show shared file detail" do
      expect(SF::shared_file_detail(@shared_token)).to match("name")
    end

    it "should show list shared libraries" do
      expect(SF::list_shared_libraries).to match("user")
    end




    it "should delete file share link" do
      expect(SF::del_file_share_link(@shared_token)).to match("OK")
    end
  end


end