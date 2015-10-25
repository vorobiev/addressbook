class Contact < ActiveRecord::Base

  has_many :phones
  has_many :emails

  validates :first_name, :last_name, presence: true
  validates :first_name, uniqueness: { scope: :last_name }

  validates :phones, length: { minimum: 1 }
  validates :emails, length: { minimum: 1 }

end
