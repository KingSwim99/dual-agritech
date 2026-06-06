module Site
  class AboutBffsiController < BaseController
    def index
      @history = [
        {
          side:  :left,
          icon:  "bi-lightbulb",
          year:  "1987–1992",
          title: "A Pioneering Vision",
          desc:  "Inspired by international success in Spain, our founders brought the Family Farm School system to the Philippines to empower rural youth. What began as a dedicated team of three teachers and 14 pioneering students has grown into a cornerstone of specialized agricultural education."
        },
        {
          side:  :right,
          icon:  "bi-award",
          year:  "1993–2000",
          title: "Excellence & Recognition",
          desc:  "Our mission gained national prestige in 1993 when President Corazon Aquino personally inaugurated our school building. This golden era consolidated our first wave of graduates and the successful expansion into advanced agribusiness and entrepreneurship programs."
        },
        {
          side:  :left,
          icon:  "bi-person-fill",
          year:  "2001–2009",
          title: "Empowerment & Sustainability",
          desc:  "Achieving independence in 2002, we strengthened our community roots by securing student grants and establishing a dedicated Board of Trustees. These milestones meant that quality education remained accessible and sustainable for every aspiring student."
        },
        {
          side:  :right,
          icon:  "bi-graph-up",
          year:  "2010–2020",
          title: "Modernizing the Future",
          desc:  "We embarked on a journey by transitioning to a permanent non-traditional system and successfully integrating the national TVET curriculum. By 2010, we reached a major milestone with full government recognition as a complete secondary institution."
        },
        {
          side:  :left,
          icon:  "bi-arrow-up-right-circle",
          year:  "2026–Present",
          title: "Resilience & Bright Horizons",
          desc:  "Our community's spirit shines brightest as we pioneer blended learning to keep our students' dreams on track through local and global challenges. Today, we stand stronger than ever, continuing our legacy of nurturing the next generation of leaders."
        }
      ]

      @trustees = [
        { name: "Desiree O. Canoy",    role: "President",                  photo: "ppafi/trustees/desiree_canoy.jpg",    initials: "DC" },
        { name: "Judith O. Panangco",  role: "Vice President / Treasurer", photo: "ppafi/trustees/judith_pantangco.jpg", initials: "JP" },
        { name: "Josefina N. Pineda",  role: "Trustee",                    photo: "ppafi/trustees/josefina_pineda.jpg",  initials: "JP" },
        { name: "Olga C. Luna",        role: "Trustee",                    photo: "ppafi/trustees/olga_luna.jpg",        initials: "OL" },
        { name: "Asuncion L. Basco",   role: "Trustee",                    photo: nil,                                   initials: "AB" }
      ]

      @personnel = [
        { name: "Dorothy E. Claro",  role: "Corporate Secretary",  photo: "ppafi/trustees/dorothy_claro.jpg",   initials: "DC" },
        { name: "Minette Magpantay", role: "School Administrator", photo: "ppafi/trustees/minette_magpantay.jpg", initials: "MM" }
      ]
    end
  end
end
