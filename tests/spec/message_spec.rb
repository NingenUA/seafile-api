require_relative '../spec_helper'


describe 'SeafileApi' do


  describe 'work message' do

    it "should reply user message" do
      expect(SF::reply_user_message(SF::user_name,"test reply")).to include("msgid")
    end
    it "should list user message" do
      expect(SF::list_user_message(SF::user_name)).to include("to_email")
    end
    it "should show unreed message" do
      expect(SF::unread_message).to include("count")
    end
  end


end