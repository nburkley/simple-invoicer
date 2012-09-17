class Client < ActiveRecord::Base
  attr_accessible :name, :website, :address_attributes, :contacts_attributes

  belongs_to :user
  has_many :invoices
  has_many :contacts
  belongs_to :country
  has_one :address, :as => :addressable, :dependent => :destroy

  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :contacts, :allow_destroy => true, :reject_if => proc { 
    |contact| contact[:name].blank? && contact[:email].blank? && contact[:phone].blank?
  }

  validates_presence_of :name
  validates_format_of :website, :with => URL_REGEX, :allow_blank => true, :message => 'is not a valid URL'

end