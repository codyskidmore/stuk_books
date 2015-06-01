class Book < ActiveRecord::Base
  include ActionView::Helpers

  belongs_to :user

  has_attached_file :image
  has_attached_file :resource

  def price_fmt
    number_to_currency(price.to_d/100)
  end
end
