require_relative '../spec_helper'


describe 'SeafileApi' do


  describe 'work with directory' do
    before(:all) do
      @sf = SeafileApi::Connect.new("kostiantyn.semchenko@masterofcode.com","Gfhjkm123456","http://fs.masterofcode.com/","03b865ad-9153-4f24-9638-7f8a04ef67a4")
    end
    it "should create new Connect " do
      expect(@sf.token).to match(/\w{3,}/)
    end

  end


end