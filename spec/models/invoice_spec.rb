require 'spec_helper'

describe Invoice do

  before { @invoice = FactoryGirl.build(:invoice) }

  subject { @invoice }

  it { should be_valid }

end
