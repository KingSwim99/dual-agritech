class DonationInquiry < ApplicationRecord
  has_one_attached :document

  validates :name, presence: true, length: { maximum: 100 }
  validates :email, presence: true, length: { maximum: 100 }, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :contact_number, presence: true, length: { maximum: 15 }
  validates :remarks, presence: true
end
