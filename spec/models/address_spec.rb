require 'spec_helper'

describe Address do

  before { @address = FactoryGirl.build(:address) }

  subject { @address }

  it { should be_valid }

end
