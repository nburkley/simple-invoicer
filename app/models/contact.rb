class Contact < ActiveRecord::Base
  attr_accessible :client_id, :email, :name, :phone

  belongs_to :client

  validates_length_of [:name, :phone], :within => 1..100, :allow_blank => true
  validates_format_of :email, :with => EMAIL_REGEX, :allow_blank => true, :message => 'is not a valid'

end
