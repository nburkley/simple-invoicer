class Client < ActiveRecord::Base
  attr_accessible :name, :website, :address_attributes, :contacts_attributes

  belongs_to :user
  has_many :invoices
  has_many :contacts, :dependent => :destroy
  belongs_to :country
  has_one :address, :as => :addressable, :dependent => :destroy

  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :contacts, :allow_destroy => true, :reject_if => proc {
    |contact| contact[:name].blank? && contact[:email].blank? && contact[:phone].blank?
  }

  validates_presence_of :name
  validates_format_of :website, :with => URL_REGEX, :allow_blank => true, :message => 'is not a valid URL'

  before_destroy :check_for_invoices

  private
    def check_for_invoices
      if invoices.count > 0
        errors.add :base, "#{name} has existing invoices. If you wish to delete this client you must 
          delete any corresponding invoices first"
        return false
      end
    end

end