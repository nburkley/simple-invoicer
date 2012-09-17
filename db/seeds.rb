# coding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
if Rails.env.development?
  require 'factory_girl_rails'

  #quantity tpes
  if QuantityType.count == 0
    QuantityType.create!(:name=>'hours')
    QuantityType.create!(:name=>'days')
    QuantityType.create!(:name=>'products')
  end

  #currency types
  if CurrencyType.count == 0
    CurrencyType.create!(:code=> 'USD', :symbol=>'$')
    CurrencyType.create!(:code=> 'EUR', :symbol=>'€')
  end

end