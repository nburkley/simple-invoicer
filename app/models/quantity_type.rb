class QuantityType < ActiveRecord::Base
  attr_accessible :name
  has_many :invoice_items
end
