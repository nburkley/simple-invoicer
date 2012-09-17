module ApplicationHelper
  def format_date(date)
    date.strftime('%Y-%h-%d')
  end

  def format_invoice_number(number)
    "%07d" % number unless number.blank?
  end
  def format_quantity(quantity)
    "%g" % quantity
  end

  def format_price(price, currency_type)
    number_to_currency(price, :precision => 2, :unit=> currency_type.symbol)
  end
end