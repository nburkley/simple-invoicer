class InvoiceItem < ActiveRecord::Base
  attr_accessible :quantity, :quantity_type_id, :description, :price

  belongs_to :invoice
  belongs_to :quantity_type

  validates :quantity, :format => { :with => /^\d+??(?:\.\d{0,2})?$/ }, :numericality => {:greater_than_or_equal_to => 0}
  validates :price, :format => { :with => /^\d+??(?:\.\d{0,2})?$/ }, :numericality => {:greater_than_or_equal_to => 0}

  validates_length_of :description, :maximum => 500
  def total
    if price && quantity
      price * quantity
    else
      0.0
    end
  end
end
