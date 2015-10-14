class Book < ActiveRecord::Base

  extend FriendlyId
  friendly_id :name, use: :slugged

  include ActionView::Helpers

  belongs_to :user

  has_attached_file :image
  has_attached_file :resource

  validates_attachment_content_type :image,
                                    content_type:  /^image\/(png|gif|jpeg)/,
                                    message: "Only images allowed"

  validates_attachment_content_type :resource,
                                    content_type: ['application/pdf'],
                                    message: "Only pdfs allowed"

  validates :image, attachment_presence: true
  validates :resource, attachment_presence: true

  def price_fmt
    number_to_currency(price.to_d/100)
  end

  def should_generate_new_friendly_id?
    name_changed?
  end
end
