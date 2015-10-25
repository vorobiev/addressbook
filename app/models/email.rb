class Email < ActiveRecord::Base
  belongs_to :contact
  validates :name, presence: true, format: /\b[A-Z0-9._%-]+@(?:[A-Z0-9-]+\.)+[A-Z]{2,4}\b/i
end
