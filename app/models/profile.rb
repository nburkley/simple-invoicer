class Profile < ActiveRecord::Base
  attr_accessible :company_name, :name, :website, :address_attributes

  has_one :address, :as => :addressable, :dependent => :destroy
  belongs_to :user
  belongs_to :country
  accepts_nested_attributes_for :address

  validates_presence_of :user_id
  validates_presence_of :company_name
  validates_length_of [:name, :company_name, :website], :within => 1..100, :allow_blank => true
  validates_format_of [:name, :company_name], :with =>  /\A[\p{Letter}0-9\-\.\, ]*\Z/u, :message => 'cannot contain special characters'
  validates_format_of :website, :with => URL_REGEX, :allow_blank => true, :message => 'is not a valid URL'

end