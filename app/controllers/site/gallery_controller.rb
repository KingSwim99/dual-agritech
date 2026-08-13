module Site
  class GalleryController < BaseController
    PPAFI_DESCRIPTIONS = {
      16 => "Visit of DA Asec. Mike Garcia",
      18 => "MOU Signing between Phil College of Poultry Practicioners (PCPP) and DFFS/PPAFI",
      19 => "MOU Signing between Phil College of Poultry Practicioners (PCPP) and DFFS/PPAFI",
      20 => "With Regional Vicar Father Julio Dieguez",
      21 => "Sunjin Deployment",
      22 => "Sunjin Deployment",
      23 => "Sealed the OJT partnership with Tony Magno - Father of Tunnel Ventilation Poultry Farming.",
      24 => "BOT PPAFI meeting with FEU Cavite Officials @ Dagatan Training Site",
      25 => "With Cafe de Lipa President & Owner Omar Mercado & PPAFI Chairman Sir Pol Titular",
      26 => "PPAFI & Cafe de Lipa MOA Signing",
      27 => "PPAFI & Cafe de Lipa MOA Signing",
      28 => "PPAFI & Cafe de Lipa MOA Signing",
      31 => "Coordination meeting with Cuenca LGU"
    }.freeze

    def index
      @ppafi_images   = load_ppafi_images
      @dagatan_groups = load_dagatan_groups
    end

    private

    def load_ppafi_images
      Dir.glob(Rails.root.join("app/assets/images/ppafi/gallery_*.{jpg,jpeg}"))
         .sort_by { |f| File.basename(f).split("_").last.to_i }
         .reverse
         .map do |f|
           n = File.basename(f).split("_").last.to_i
           { path: "ppafi/#{File.basename(f)}", description: PPAFI_DESCRIPTIONS[n] }
         end
    end

    def load_dagatan_groups
      Dir.glob(Rails.root.join("app/assets/images/dagatan/*/"))
         .sort
         .filter_map do |dir|
           images = Dir.glob(File.join(dir, "*.{jpg,jpeg,png,JPG,JPEG,PNG}"))
                       .map { |f| File.basename(f) }
                       .sort
           next if images.empty?

           { name: File.basename(dir), folder: "dagatan/#{File.basename(dir)}", images: images }
         end
    end
  end
end
