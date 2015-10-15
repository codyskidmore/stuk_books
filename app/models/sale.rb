class Sale < ActiveRecord::Base
  before_create :populate_guid
  belongs_to :book

  def populate_guid
    self.guid = SecureRandom.uuid()
  end
end
