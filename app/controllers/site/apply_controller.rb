module Site
  class ApplyController < BaseController
    def index; end

    def send_trainee_inquiry
      unless verify_recaptcha(action: "trainee", minimum_score: 0.5)
        flash[:alert] = "reCAPTCHA verification failed. Please try again."
        redirect_to site_apply_path and return
      end

      inquiry = TraineeInquiry.new(
        first_name:     params[:first_name],
        last_name:      params[:last_name],
        email:          params[:email],
        contact_number: params[:contact_number],
        remarks:        params[:remarks]
      )

      if inquiry.save
        begin
          InquiryMailer.trainee_inquiry_submitted(inquiry).deliver_now
          inquiry.update_column(:email_sent, true)
          DailyEmailStat.find_or_create_by(stat_date: Date.today).increment!(:trainee_count)
        rescue => e
          Rails.logger.error "TraineeInquiry email failed (id=#{inquiry.id}): #{e.message}"
        end
        flash[:notice] = "Your application has been submitted. We\u2019ll review it shortly!"
        redirect_to site_apply_path
      else
        flash[:alert] = inquiry.errors.full_messages.to_sentence
        redirect_to site_apply_path
      end
    end

    def send_sponsor_inquiry
      unless verify_recaptcha(action: "sponsor", minimum_score: 0.5)
        flash[:alert] = "reCAPTCHA verification failed. Please try again."
        redirect_to site_apply_path and return
      end

      donation_types = [
        ("Scholarship"                    if params[:donation_type_scholarship]    == "1"),
        ("Farm Equipment"                 if params[:donation_type_farm_equipment] == "1"),
        ("Classroom/Dormitory/Laboratory" if params[:donation_type_classroom]      == "1"),
        ("Technology Modules"             if params[:donation_type_technology]     == "1"),
        ("OJT Partner Application"        if params[:donation_type_ojt]            == "1")
      ].compact

      inquiry = SponsorInquiry.new(
        name:               params[:name],
        email:              params[:email],
        contact_number:     params[:contact_number],
        remarks:            params[:remarks],
        donation_type_text: donation_types.join(", ")
      )

      if inquiry.save
        begin
          InquiryMailer.sponsor_inquiry_submitted(inquiry).deliver_now
          inquiry.update_column(:email_sent, true)
          DailyEmailStat.find_or_create_by(stat_date: Date.today).increment!(:sponsor_count)
        rescue => e
          Rails.logger.error "SponsorInquiry email failed (id=#{inquiry.id}): #{e.message}"
        end
        flash[:notice] = "Your application has been submitted. We\u2019ll review it shortly!"
        redirect_to site_apply_path
      else
        flash[:alert] = inquiry.errors.full_messages.to_sentence
        redirect_to site_apply_path
      end
    end
  end
end
