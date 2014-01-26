require 'spec_helper'

describe Contact do

  before { @contact = FactoryGirl.build(:contact) }

  subject { @contact }

  it { should be_valid }

end
