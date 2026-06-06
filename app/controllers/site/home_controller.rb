module Site
  class HomeController < BaseController
    def index
      @subgroups = [
        {
          image:   "ppafi/da-exhibit.jpg",
          alt:     "PPAFI Training Center",
          name:    "PPAFI",
          tagline: "Pampamilyang Paaralang Agrikultura Foundation, Inc.",
          desc:    "The overarching foundation where the Dual Agritech™ training centers are its implementing arms",
          path:    :site_about_ppafi_path
        },
        {
          image:   "others/hero-banner-2.jpg",
          alt:     "DFFSI Training Center",
          name:    "DFFSI",
          tagline: "Dagatan Family Farm School, Inc.",
          desc:    "A TESDA acredited tertiary tech-voc Dual Agritech™ training center for excellence based in Dagatan, offering a 6-month classroom and a 6-month on-the-job training on Dual Agri technology for boys",
          path:    :site_about_dffsi_path
        },
        {
          image:   "balete/FP.jpg",
          alt:     "BFFSI Training Center",
          name:    "BFFSI",
          tagline: "Balete Family Farm School, Inc.",
          desc:    "A learning site for agritulture tertiary tec-voc training center for excellence based in Balete, offering a 6-month classroom and a 6-month on-the-job training on Dual Agri technology for girls",
          path:    :site_about_bffsi_path
        }
      ]

      @model_steps = [
        {
          icon:  "graduation-hat",
          title: "Classroom Training",
          desc:  "Comprehensive theoretical foundation covering agricultural sciences, sustainable practices, and modern technology applications"
        },
        {
          icon:  "farm-tech",
          title: "On-the-Job Training",
          desc:  "Hands-on experience in real agri-tech environment, working alongside experienced agri-tech professionals"
        }
      ]

      @growth_drivers_left = [
        { icon: "bi-bar-chart-fill", title: "Attractiveness of Agri-Business", desc: "Growing appeal of agri-tech careers among young professionals" },
        { icon: "bi-book-fill",      title: "Adaptive Curriculum",             desc: "Dynamic learning programs that respond to industry needs and technological advances" },
        { icon: "bi-tree-fill",      title: "Regulatory Landscape",            desc: "Evolving policies supporting agri-tech training and sustainable agri-tech practices" }
      ]

      @growth_drivers_right = [
        { icon: "bi-cash-coin",   title: "Scholarship Funding",    desc: "Securing adequate financial support for deserving trainees" },
        { icon: "bi-house-fill", title: "Facilities Improvement", desc: "Upgrading infrastructure and learning environment" },
        { icon: "bi-laptop-fill", title: "Digital Capability",     desc: "Building technological capacity and digital literacy" }
      ]

      @priorities_stats = [
        { prefix: "",  target: 95,  suffix: "%", label: "Employability" },
        { prefix: "\u20b1", target: 50, suffix: "M", label: "2026 - 2027 Funding Goal" },
        { prefix: "",  target: 100, suffix: "%", label: "Digital Integration Target" }
      ]

      @about_objectives = [
        { icon: "bi-mortarboard-fill",   label: "Dual Agritech™ Training Excellence" },
        { icon: "bi-diagram-3-fill",     label: "Nationwide Program Expansion" },
        { icon: "bi-person-check-fill",  label: "Exceptional Graduate Placement" },
        { icon: "bi-globe2",             label: "Community Impact" }
      ]

      @tvet_programs = [
        {
          icon:  "bi-journal-text",
          title: "Tertiary Tech-voc Courses",
          desc:  "Comprehensive curriculum covering crop science, soil management, pest control, and sustainable agritech practices.",
          items: [
            "Agricultural Crops Production",
            { label: "Animal Production", children: [
              { label: "Production Agroentrepreneurship", children: [ "Swine", "Poultry" ] }
            ] },
            "Food Processing Production",
            "Organic Agriculture Production"
          ]
        },
        {
          icon:  "bi-patch-check-fill",
          title: "Certification Programs",
          desc:  "Accredited certification programs that validate skills and knowledge in various agri-tech specializations.",
          items: [ "Skills Assessment & Certification", "Professional Development", "Career Advancement", "Industry Recognition" ]
        },
        {
          icon:  "bi-briefcase-fill",
          title: "Agripreneurship Support",
          desc:  "Business development support for agripreneurs, including mentorship and funding guidance.",
          items: [ "Business Planning", "Mentorship", "Funding Guidance", "Market Access" ]
        },
        {
          icon:  "bi-people-fill",
          title: "Research & Innovation",
          desc:  "Cutting-edge research in sustainable Dual Agritech\u2122, crop & livestock improvement, food processing, and other innovative agri-tech techniques.",
          items: [ "Applied Research", "Innovation Labs", "Collaborative Projects", "Publication Support" ]
        },
        {
          icon:  "bi-heart-fill",
          title: "Community Outreach",
          desc:  "Extension services and community programs to spread Dual Agritech\u2122 knowledge and best practices to local young farmers and farming communities.",
          items: [ "Farmer Education", "Technical Support", "Resource Sharing", "Networking", "Cooperative Development" ]
        }
      ]

      @why_choose_stats = [
        { target: 2500, suffix: "+", label: "Graduates" },
        { target: 70,   suffix: "+", label: "Years Experience" },
        { target: 95,   suffix: "%", label: "Employment Rate" },
        { target: 15,   suffix: "+", label: "Industry Partners" }
      ]

      @cta_cards = [
        { icon: "bi-download",         title: "Download Brochure", text: "Get detailed information about our programs and initiatives.",              link_label: "Download PDF",       link_href: "/download_brochure" },
        { icon: "bi-heart-fill",       title: "Make a Donation",   text: "Support our agritech training programs and help trainees achieve their dreams.", link_label: "Donate Now",         link_path: :site_donate_path },
        { icon: "bi-telephone-fill",   title: "Call Us",           text: "Speak directly with our team about partnership opportunities.",               link_label: "+63 (945) 540-6194", link_href: "tel:+639455406194" },
        { icon: "bi-envelope-fill",    title: "Email Us",          text: "Send us your questions or partnership proposals.",                            link_label: "Contact Us",         link_path: :site_contact_path }
      ]

      @testimonials = [
        {
          stars: 5,
          quote: "At Dagatan Family Farm School, the Dual Agritech™ Program is more than just education—it is a journey of purpose, discipline, and growth. Here, learning happens not only in classrooms but in the fields, farms, and real-life experiences where character is shaped and skills are mastered.",
          initials: "TS",
          name: "Tristan Superable",
          role: "DFFSI Student",
          location: "Sampa, Sta. Teresita, Batangas"
        },
        {
          stars: 5,
          quote: "As we nurture the land, we also nurture dreams transforming passion into productivity, knowledge into action, and learners into leaders of tomorrow’s agriculture.",
          initials: "MC",
          name: "Margareth Caguicla",
          role: "DFFSI Student",
          location: "Saimsim, Sta. Teresita, Batangas"
        },
        {
          stars: 5,
          quote: "We believe that agriculture is the foundation of food security, community development, and sustainable living. Through hard work, innovation, we are trained to become competent, responsible, and future- ready agri-practitioners.",
          initials: "JH",
          name: "Jayma Rose Higuit",
          role: "DFFSI Student",
          location: "Calayaan, Sta. Teresita, Batangas"
        },
        {
          stars: 5,
          quote: "I have the unique opportunity to learn both the art of traditional farming and the science of modern agri-tech. The hands-on experiences at Dagatan Family Farm School have not only deepened my understanding of agriculture but also empowered me to innovate and find sustainable solutions for the future.",
          initials: "RP",
          name: "Rosh Vincent Pizarras",
          role: "DFFSI Student",
          location: "Sinipian, Sta. Teresita, Batangas"
        },
        {
          stars: 5,
          quote: "Being a Dual Agritech™ trainee has opened my eyes to the true potential of agriculture. The program blends traditional farming practices with cutting-edge technology, preparing me for a diverse and rapidly changing industry.",
          initials: "JL",
          name: "Justin Lacambra",
          role: "DFFSI Student",
          location: "Niing, San Antonio, Quezon"
        },
        {
          stars: 4,
          quote: "As a student of the Dual Agritech™ Program, I am immersed in a learning environment that encourages both personal and professional growth. Every day is an opportunity to connect with experienced mentors, engage in practical farming activities, and discover innovative agricultural technologies.",
          initials: "NM",
          name: "Noel Mabini",
          role: "DFFSI Student",
          location: "Calumala, Sta. Teresita, Batangas"
        }
      ]

      @impact_stats = [
        { target: 95,  suffix: "%",  label: "Employment Rate" },
        { target: 50,  suffix: "M+", label: "Farm Output ₱" },
        { target: 100, suffix: "%",  label: "MoA Compliance" }
      ]
    end
  end
end
