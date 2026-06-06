namespace :site, path: "/" do
  # LINKS
  get "gallery", to: "gallery#index"
  get "about-dffsi", to: "about_dffsi#index"
  get "about-ppafi", to: "about_ppafi#index"
  get "about-bffsi", to: "about_bffsi#index"
  get "partners", to: "partners#index"
  get "contact", to: "contact#index"
  get "apply", to: "apply#index"
  get "donate", to: "donate#index"

  # STATIC PAGES
  get "coming-soon", to: "static#coming_soon"
  get "resources", to: "resources#index"

  # FORMS
  post "contact", to: "contact#send_inquiry", as: "send_contact_inquiry"
  post "donate", to: "donate#send_donation_inquiry", as: "send_donation_inquiry"
  post "apply/trainee", to: "apply#send_trainee_inquiry", as: "send_trainee_inquiry"
  post "apply/sponsor", to: "apply#send_sponsor_inquiry", as: "send_sponsor_inquiry"

  # DOWNLOADS
  get "download_brochure", to: "pdfs#download_brochure"
  get "download_moa_tesda_ppafi", to: "pdfs#download_moa_tesda_ppafi"

  # get "faqs", to: "faqs#index"
  # get "blogs", to: "blogs#index"
end
