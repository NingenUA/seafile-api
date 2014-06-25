require 'rspec'
require_relative '../lib/seafile-api'


describe 'SeafileApi::Connect' do
  before(:all) do
      @sf = SeafileApi::Connect.new("kostiantyn.semchenko@masterofcode.com","Gfhjkm123456","http://fs.masterofcode.com/","03b865ad-9153-4f24-9638-7f8a04ef67a4")
  end

  it "should create new Connect " do
    expect(@sf.token).to match(/\w{3,}/)
  end

  it "shouldn't create new Connect " do
    sf = SeafileApi::Connect.new("kostiantyn.seadsdasdmchenko@masterofcode.com","Gfhjkm123456","http://fs.masterofcode.com/","03b865ad-9153-4f24-9638-7f8a04ef67a4")
    expect(sf.token).to eq(nil)
  end

  it "should return direct link" do
    @sf.file_link('bbb.pdf','03b865ad-9153-4f24-9638-7f8a04ef67a4')
  end
end