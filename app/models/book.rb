class Book < ActiveRecord::Base
  include ActionView::Helpers

  def price_fmt
    number_to_currency(price.to_d/100)
  end
end
