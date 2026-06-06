class SponsorInquiry < ApplicationRecord
  validates :name, presence: true, length: { maximum: 100 }
  validates :email, presence: true, length: { maximum: 100 }, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :contact_number, presence: true, length: { maximum: 15 }
  validates :donation_type_text, presence: { message: "Please select at least one donation type." }
end
