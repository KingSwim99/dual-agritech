module Site
  class ContactController < BaseController
    def index; end

    def send_inquiry
      unless verify_recaptcha(action: "contact", minimum_score: 0.5)
        flash[:alert] = "reCAPTCHA verification failed. Please try again."
        redirect_to site_contact_path and return
      end

      inquiry = ContactInquiry.new(
        name:         params[:full_name],
        email:        params[:email],
        organization: params[:organization],
        message:      params[:message]
      )

      if inquiry.save
        begin
          InquiryMailer.contact_inquiry_submitted(inquiry).deliver_now
          inquiry.update_column(:email_sent, true)
          DailyEmailStat.find_or_create_by(stat_date: Date.today).increment!(:contact_count)
        rescue => e
          Rails.logger.error "ContactInquiry email failed (id=#{inquiry.id}): #{e.message}"
        end
        flash[:notice] = "Your message has been sent. We\u2019ll be in touch soon!"
        redirect_to site_contact_path
      else
        flash[:alert] = inquiry.errors.full_messages.to_sentence
        redirect_to site_contact_path
      end
    end
  end
end
