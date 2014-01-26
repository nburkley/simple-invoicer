require 'spec_helper'

describe CurrencyType do

  before { @currency_type = FactoryGirl.build(:currency_type, code: 'USD', symbol: '$' ) }

  subject { @currency_type }

  it { should be_valid }

  describe "label_name" do
    it { @currency_type.label_name.should == 'USD ($)' }
  end

end
