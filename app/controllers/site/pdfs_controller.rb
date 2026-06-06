module Site
  class PdfsController < BaseController
    def download_brochure
      send_file(
        Rails.root.join("app/assets/documents/ppafi-brochure.pdf"),
        filename: "PPAFI-Brochure.pdf",
        type: "application/pdf",
        disposition: "attachment"
      )
    end

    def download_moa_tesda_ppafi
      send_file(
        Rails.root.join("app/assets/documents/moa-signing-bet-tesda-and-PPAFI.docx"),
        filename: "MOA-TESDA-PPAFI.docx",
        type: "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
        disposition: "attachment"
      )
    end
  end
end
