require_relative '../spec_helper'


describe 'SeafileApi' do


  describe 'work message' do
    before(:all) do
      @sf = SeafileApi::Connect.new("kostiantyn.semchenko@masterofcode.com","Gfhjkm123456","http://fs.masterofcode.com","03b865ad-9153-4f24-9638-7f8a04ef67a4")
    end
    it "should create new Connect " do
      expect(@sf.token).to match(/\w{3,}/)
    end
    it "should reply user message" do
      expect(@sf.reply_user_message("kostiantyn.semchenko@masterofcode.com","test reply")).to match("msgid")
    end
    it "should list user message" do
      expect(@sf.list_user_message("kostiantyn.semchenko@masterofcode.com")).to match("to_email")
    end
    it "should show unreed message" do
      expect(@sf.unread_message).to match("count")
    end
  end


end