class InquiryMailer < ApplicationMailer
  def contact_inquiry_submitted(contact_inquiry)
    return if contact_inquiry.email_sent?

    @contact_inquiry = contact_inquiry

    mail(
      subject: "New Contact Inquiry Submitted",
      from: "contact-inquiry@dualagritech.org",
      reply_to: @contact_inquiry.email
    )
  end

  def sponsor_inquiry_submitted(sponsor_inquiry)
    return if sponsor_inquiry.email_sent?

    @sponsor_inquiry = sponsor_inquiry

    mail(
      subject: "New Partner / Sponsor Application Submitted",
      from: "partner-inquiry@dualagritech.org",
      reply_to: @sponsor_inquiry.email
    )
  end

  def trainee_inquiry_submitted(trainee_inquiry)
    return if trainee_inquiry.email_sent?

    @trainee_inquiry = trainee_inquiry

    mail(
      subject: "New Trainee Application Submitted",
      from: "trainee-inquiry@dualagritech.org",
      reply_to: @trainee_inquiry.email
    )
  end

  def donation_inquiry_submitted(donation_inquiry)
    return if donation_inquiry.email_sent?

    @donation_inquiry = donation_inquiry

    if @donation_inquiry.document.attached?
      attachments[@donation_inquiry.document.filename.to_s] = @donation_inquiry.document.download
    end

    mail(
      subject: "New Donation Inquiry Submitted",
      from: "donation-inquiry@dualagritech.org",
      reply_to: @donation_inquiry.email
    )
  end
end
