require_relative 'test_helper'

# describe "recipient attributes and behaviors" do

describe "recipient attribues" do
  before do
    @test_name = "awesome"
    @test_slack_id = "0001"
    @test_recipient = Recipient.new(name: @test_name, slack_id: @test_slack_id)
  end
  it "knows it's an instance of recipient" do
    expect(@test_recipient).must_be_kind_of Recipient
  end
  
  it "knows its slack_id" do
    expect(@test_recipient.slack_id).must_equal @test_slack_id
  end
  
  it "knows its name" do
    expect(@test_recipient.name).must_equal @test_name
  end
  
end

describe "recipient blocks initialization if incorrect format" do
  it "allows initialization with name and id as instances of string to match API" do
    VCR.use_cassette("slack_info") do
      expect{@test_recipient = Recipient.new(name: "0001", id: 15.999)}.must_raise ArgumentError
      expect{@test_recipient = Recipient.new(name: 0001, id: "15.999")}.must_raise ArgumentError
    end
  end
  
end

describe "fleshed-out methods of being able to provide a detailed summary" do
  it "does not implement a details method" do
    detail_free_recipient = Recipient.new(name: "silly", slack_id: "666")
    expect{detail_free_recipient.details}.must_raise NotImplementedError
  end
end
