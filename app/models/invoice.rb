class Invoice < ActiveRecord::Base
  attr_accessible :client_id, :date, :number, :currency_type_id, :note, :invoice_items_attributes

  belongs_to :user
  belongs_to :client
  belongs_to :currency_type
  has_many :invoice_items

  accepts_nested_attributes_for :invoice_items, :allow_destroy => true, :reject_if => proc {
    |item| item[:quantity].blank? && item[:description].blank? && item[:price].blank?
      }

  validates_presence_of :user_id, :client_id, :number, :currency_type_id, :date
  validates_numericality_of :number, :greater_than => 0

  validates_length_of :note, :maximum => 1000

  def due_date
    created_at + 60.days
  end

  def total
    invoice_items.inject(0) { |sum, item| sum + item.total }
  end

  def self.next_number_for_user(user)
    user.invoices.maximum(:number) ? maximum(:number) + 1 : 1
  end

end
