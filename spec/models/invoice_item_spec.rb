require 'spec_helper'

describe InvoiceItem do

  before { @invoice_item = FactoryGirl.build(:invoice_item) }

  subject { @invoice_item }

  it { should be_valid }

end
