module Site
  class DonateController < BaseController
    def index; end

    def send_donation_inquiry
      unless verify_recaptcha(action: "donate", minimum_score: 0.5)
        flash[:alert] = "reCAPTCHA verification failed. Please try again."
        redirect_to site_donate_path and return
      end

      inquiry = DonationInquiry.new(
        name:           params[:full_name],
        email:          params[:email],
        contact_number: params[:contact_number],
        organization:   params[:organization],
        remarks:        params[:message]
      )
      inquiry.document = params[:proof_of_donation] if params[:proof_of_donation].present?

      if inquiry.save
        begin
          InquiryMailer.donation_inquiry_submitted(inquiry).deliver_now
          inquiry.update_column(:email_sent, true)
          DailyEmailStat.find_or_create_by(stat_date: Date.today).increment!(:donation_count)
        rescue => e
          Rails.logger.error "DonationInquiry email failed (id=#{inquiry.id}): #{e.message}"
        end
        flash[:notice] = "Thank you for your donation! We\u2019ll be in touch soon."
        redirect_to site_donate_path
      else
        flash[:alert] = inquiry.errors.full_messages.to_sentence
        redirect_to site_donate_path
      end
    end
  end
end
