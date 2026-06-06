module Site
  class AboutDffsiController < BaseController
    def index
      @history = [
        {
          year:  "1986",
          side:  :left,
          icon:  "bi-lightbulb",
          title: "Project Conception",
          desc:  "Late Mr. Fritz R. Gemperle and friends started the DFFSI Project, patterned after the French and Spanish models."
        },
        {
          year:  "October 1986",
          side:  :right,
          icon:  "bi-building",
          title: "PPAFI Registration",
          desc:  "Pampamilyang Paaralang Agrikultura, Inc. (PPAI) was formally registered."
        },
        {
          year:  "August 1988",
          side:  :left,
          icon:  "bi-flag",
          title: "Inauguration of DFFSI",
          desc:  "Dagatan Family Farm School Inc. (DFFSI) was established as the first Family Farm School in Asia and inaugurated by then President Corazon Aquino."
        },
        {
          year:  "Present",
          side:  :right,
          icon:  "bi-people-fill",
          title: "Community Impact",
          desc:  "The school has produced 1300 alumni and serves ≈7,000 indirect beneficiaries (family members) in Lipa City and neighboring municipalities."
        },
        {
          year:  "Present",
          side:  :left,
          icon:  "bi-arrow-up-right-circle",
          title: "Transformation",
          desc:  "DFFSI transforming into Dual Agritech Training Center for Excellence following the Technical-Vocational Education Training (TVET) approach."
        }
      ]

      @trustees = [
        { name: "Antonio L. Tañada",            role: "Chairman",                  photo: "ppafi/trustees/antonio_tanada.jpg",       initials: "AT" },
        { name: "Porfirio A. Yusingbo, Jr.",    role: "President",                 photo: "ppafi/trustees/profirio_yusingbo.jpg",    initials: "PY" },
        { name: "Ronald M. Miranda",            role: "Vice President - Trustee",  photo: nil,                                       initials: "RM" },
        { name: "Melchor G. Gaspar",            role: "Treasurer - Trustee",       photo: nil,                                       initials: "MG" },
        { name: "Bienvenido Jose N. Panganiban", role: "Trustee",                   photo: "ppafi/trustees/bienvenido_panganiban.jpg", initials: "BP" }
      ]

      @advisory_council = [
        { name: "Allan Fernandez",          role: "Presiding Member", photo: "ppafi/trustees/alan.jpg",          initials: "AF" },
        { name: "Augusto P. Uyenco",        role: "Member",           photo: "ppafi/trustees/auguto_uyenco.jpg",  initials: "AU" },
        { name: "Constantino Y. Belizario", role: "Member",           photo: nil,                                initials: "CB" }
      ]

      @personnel = [
        { name: "Atty. Alvin R. Alday", role: "Corporate Secretary",       photo: nil, initials: "AA" },
        { name: "Jasmine Marzo",        role: "Finance & Administration",  photo: nil, initials: "JM" }
      ]
    end
  end
end
