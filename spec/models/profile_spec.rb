require 'spec_helper'

describe Profile do

  before { @profile = FactoryGirl.build(:profile) }

  subject { @profile }

  it { should be_valid }

end
