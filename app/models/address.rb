class Address < ActiveRecord::Base
  attr_accessible :line_one, :line_two, :city, :state, :zipcode, :country
  belongs_to :addressable, :polymorphic => true

end
