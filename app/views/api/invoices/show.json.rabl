object @invoice

attributes :id, :number, :date, :note

node(:total) { |i| i.total }

child :client do
  attributes :name
  child :address do
    attributes :line_one, :line_two, :city, :state, :zipcode, :country
  end
end

child :invoice_items do
  attributes :description, :quantity, :price
  node(:total) { |item| item.total }
  child :quantity_type do
    attributes :name
  end
end

child :currency_type do
  attributes :symbol, :code
end

child :user do
  child :profile do
    attributes :company_name
    child :address do
      attributes :line_one, :line_two, :city, :state, :zipcode, :country
    end
  end
end
node(:due_date) { |i| i.due_date }