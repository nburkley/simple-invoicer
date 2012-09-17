class CurrencyType < ActiveRecord::Base
  attr_accessible :code, :symbol

  has_many :invoices

  def label_name
    "#{code} (#{symbol})"
  end
end
