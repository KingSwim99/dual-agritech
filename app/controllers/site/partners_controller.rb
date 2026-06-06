module Site
  class PartnersController < BaseController
    def index
      @sections = [
        {
          title: "International Partners",
          partners: [
            { name: "Benevity",                                                                                           logo: "sponsors/benevity_2.png", logo_size: :lg },
            { name: "Fundación Patronato Universitario",                                                                  logo: "sponsors/FPU2.png", logo_size: :lg },
            { name: "Food and Agriculture Organization of the United Nations",                                            logo: "sponsors/FAO-UN.png" },
            { name: "SEARCA<br>Southeast Asian Regional Center for Graduate Study and Research in Agriculture".html_safe, logo: "sponsors/SEARCA.png" }
          ]
        },
        {
          title: "Industry / Collaborative Partners",
          partners: [
            { name: "Dualtech Training Center Foundation, Inc.", logo: "sponsors/DT.jpeg" },
            { name: "Batangas State University", logo: "sponsors/BSU.png" },
            { name: "University of Batangas", logo: "sponsors/UB.png" },
            { name: "De La Salle University Lipa", logo: "sponsors/DLSL.png" },
            { name: "Monde Nissin", logo: "sponsors/monde_nissin.png" },
            { name: "Mayani PH", logo: "sponsors/mayani.png" },
            { name: "Sorosoro Ibaba Development Cooperative", logo: "sponsors/sidc.png" },
            { name: "Cafe de Lipa", logo: "sponsors/cafe_de_lipa.jpeg" },
            { name: "Smart Accounting & IT Solution Services", logo: "sponsors/SAITSS.jpg" },
            { name: "Philippine Food Bank Foundation, Inc.", logo: "sponsors/philippine-foodbank-foundation-inc-logo.png" },
            { name: "Global Visions, Inc.", logo: "sponsors/global_visions.png" },
            { name: "Philippine College of Poultry Practitioners, Inc.", logo: "sponsors/PCPP.png" },
            { name: "Beta Sigma Fraternity Alumni Association — Batangas Assembly", logo: "sponsors/beta_sigma.png" }
          ]
        },
        {
          title: "LGU and Government Agency Partners",
          partners: [
            { name: "Department of Agriculture, Republic of the Philippines", logo: "sponsors/DOA.png" },
            { name: "Agricultural Training Institute — Department of Agriculture", logo: "sponsors/DOA-TI.png" },
            { name: "TESDA — Technical Education and Skills Development Authority", logo: "sponsors/TESDA.png" },
            { name: "ATI — National Urban and Peri-Urban Agriculture Program", logo: "sponsors/NUPUA.jpg" },
            { name: "ITCPH — International Training Center on Pig Husbandry, Lipa", logo: "sponsors/ITCPH.png" },
            { name: "City of Lipa, Batangas", logo: "sponsors/lipa.png" },
            { name: "Province of Batangas", logo: "sponsors/batangas.png" },
            { name: "Municipality of Sta. Teresita, Batangas", logo: "sponsors/sta_teresita.png" },
            { name: "Municipality of Mataas na Kahoy, Batangas", logo: "sponsors/mataas_na_kahoy.jpg" },
            { name: "Province of Palawan", logo: "sponsors/palawan.png" },
            { name: "Municipality of Sta. Monica, Batangas", logo: "sponsors/sta_monica.png" },
            { name: "Municipality of Lubang, Occidental Mindoro", logo: "sponsors/lubang.jpg" }
          ]
        },
        {
          title: "Corporate Donors",
          partners: [
            { name: "Infarmco Group of Companies", logo: "sponsors/infarmco.png" },
            { name: "Cebuana Lhuillier Foundation, Inc.", logo: "sponsors/cebuana.png" },
            { name: "Standard Chartered Bank", logo: "sponsors/SCB.svg" },
            { name: "GT Foundation, Inc.", logo: "sponsors/GTF.jpg" }
          ]
        }
      ]

      @individual_sponsors = [
        "De La Salle Lipa Alumni Association (Batch 87)",
        "Mar Roxas",
        "Porfino A. Yusingco, Jr.",
        "Art Fajardo",
        "Ed Tabong Fair",
        "Maria Theresa M. CU",
        "Mark Tan",
        "Jose R. Remo"
      ]
    end
  end
end
