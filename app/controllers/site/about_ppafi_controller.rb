module Site
  class AboutPpafiController < BaseController
    def index
      @vision = "A more equitable society where members of families from the peripheral sector are empowered to become integral and productive members of the community."

      @mission = "To build a network of community-based agricultural schools and learning centers and bridge them to resources for their sustainability and self sufficiency."

      @character_values = "Our foundation is built on integrity and service, empowering trainees not only with agricultural skills but also with the strong character required to be responsible community leaders and agripreneurs."

      @core_values = [
        { icon: "bi-shield-fill-check",  label: "Integrity" },
        { icon: "bi-hand-thumbs-up-fill", label: "Spirit of Service" },
        { icon: "bi-heart-fill",        label: "Compassion" },
        { icon: "bi-award-fill",        label: "Commitment" },
        { icon: "bi-house-heart-fill",  label: "Love for Family" },
        { icon: "bi-people-fill",       label: "Collaboration" }
      ]

      @history = [
        {
          side:  :left,
          icon:  "bi-flag",
          title: "Founding Vision",
          desc:  "PPAFI Founder Mr. Fritz Gemperle was inspired by Spanish and French FFS systems. He established PPAFI to uplift rural communities through the Family Farm School (FFS) model."
        },
        {
          side:  :right,
          icon:  "bi-building",
          title: "Establishment of First FFS",
          desc:  "The Dagatan Family Farm School (DFFSI) was established in January under the guidance of Advisor Alfonzo Camilon II and Kapps Arlene Camilon, formalizing PPAFI's educational mission."
        },
        {
          side:  :left,
          icon:  "bi-person-fill",
          title: "Leadership & Transformation",
          desc:  "In 2020, a new Board of Trustees, led by Mr. Leopoldo Titular and Mr. Rey Dela Cruz, initiated the transformation of the two FFS centers to adopt the Dual Training System (DTS) model."
        },
        {
          side:  :right,
          icon:  "bi-stars",
          title: "Dual Agritech™ & IP Rights",
          desc:  "The Dual Agritech™ Center For Excellence program was established in 2023 with Dual Tech Foundation Inc. In 2024, the exclusive trademark use of Dual Agritech™ was approved for PPAFI."
        },
        {
          side:  :left,
          icon:  "bi-patch-check-fill",
          title: "Benevity Accreditation",
          desc:  "PPAFI has been officially accredited by Benevity, a leading global platform for corporate purpose and employee giving, recognizing PPAFI as a trusted partner for impactful community-driven agri education."
        }
      ]

      @trustees = [
        { name: "Leopoldo S. Titular",                role: "Chairman",                        photo: "ppafi/trustees/leopoldo_titular.jpg",  initials: "LT" },
        { name: "Reynaldo C. Dela Cruz, Jr.",         role: "President - Trustee",             photo: "ppafi/trustees/rey_dela_cruz.jpg",     initials: "RD" },
        { name: "Atty. Hector V. Hernandez, DPM",     role: "CFO, Legal, HR, Comm - Trustee",  photo: "ppafi/trustees/atty_hector.jpg",       initials: "HH" },
        { name: "Marcelo G. Naval, Jr.",              role: "Trustee",                         photo: "ppafi/trustees/marcelo_naval.jpg",     initials: "MN" },
        { name: "Josefina N. Pineda",                 role: "Trustee",                         photo: "ppafi/trustees/josefina_pineda.jpg",   initials: "JP" },
        { name: "Atty. Diosdado B. Marasigan",        role: "Trustee",                         photo: "ppafi/trustees/diosdado_marasigan.jpg", initials: "DM" },
        { name: "Desiree O. Canoy",                   role: "Trustee",                         photo: "ppafi/trustees/desiree_canoy.jpg",     initials: "DC" },
        { name: "Judith O. Pantangco",                role: "Trustee",                         photo: "ppafi/trustees/judith_pantangco.jpg",  initials: "JP" },
        { name: "Joseph John Ong",                    role: "Trustee",                         photo: "ppafi/trustees/joseph_john_ong.jpg",   initials: "JO" }
      ]

      @personnel = [
        { name: "Jeremy Feria",    role: "Program Director",    photo: "ppafi/trustees/jeremy_feria.jpg",   initials: "JF" },
        { name: "Eric Velecina",   role: "Head of Operations",  photo: "ppafi/trustees/eric_velecina.jpg",  initials: "EV" },
        { name: "Olga C. Luna",    role: "Corporate Secretary", photo: "ppafi/trustees/olga_luna.jpg",      initials: "OL" },
        { name: "Kristel Ebron",   role: "Secretariat",         photo: "ppafi/trustees/kristel_ebron.jpg",  initials: "KE" },
        { name: "Cyrel Magramo",   role: "Admin",               photo: "ppafi/trustees/cyrel_magramo.jpg",  initials: "CM" }
      ]
    end
  end
end
