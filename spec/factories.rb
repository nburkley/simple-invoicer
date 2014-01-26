FactoryGirl.define do

  factory :currency_type do
    symbol '$'
    code 'USD'
  end

  factory :quantity_type do
    name 'hours'
  end
  factory :user do
    sequence(:email) { |n| "example#{n}@example.com" }
    password 'example'
    confirmed_at Time.now - 1.day
  end

  factory :address do
    line_one "Main St"
    line_two "Central Square"
    city "Cambridge"
    state "MA"
    zipcode "02123"
    country "USA"
  end

  factory :client do
    user
    address
    name "Acme"
  end

  factory :invoice_item do
    quantity 2
    quantity_type
    description 'test'
    price 10
    invoice
  end

  factory :invoice do
    number Invoice.maximum(:number) || 1
    client
    user
    currency_type
    date Date.today
    note 'some text'
  end

  factory :contact do
    client
  end

  factory :profile do
    user
  end

end