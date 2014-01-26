require 'spec_helper'

describe Client do

  before { @client = FactoryGirl.build(:client) }

  subject { @client }

  it { should be_valid }

  context "with a client with invoices" do
    before do
      @client.save
      FactoryGirl.create(:invoice, client: @client)
    end

    it "should not be possible to destroy the client" do
      @client.destroy.should be_false
      @client.errors.count.should == 1
    end
  end
end
