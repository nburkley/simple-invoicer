require 'spec_helper'

describe QuantityType do

  before { @quantity_type = FactoryGirl.create(:quantity_type) }

  subject { @quantity_type }

  it { should be_valid }

end   
