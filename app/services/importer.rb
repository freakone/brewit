class Importer
  class << self
    def hops
      File.open("/Users/tupaja/Hops.bsmx") do |f|
        xml = Nokogiri::XML(f)
        hops = xml.xpath("//Hops")

        hop_types = HopType.all.to_a
        hop_forms = HopForm.all.to_a

        Hop.delete_all

        hops.drop(1).each do |hop|
          types = if hop.xpath("F_H_TYPE").first.content == "2" # both
            hop_types
          else
            hop_types.select do |hop_type|
              hop_type.value == hop.xpath("F_H_TYPE").first.content.to_i
            end
          end

          Hop.create!(
            name: hop.xpath("F_H_NAME").first.content,
            origin: hop.xpath("F_H_ORIGIN").first.content,
            types: types,
            form: hop_forms.find do |hop_form|
              hop_form.value == hop.xpath("F_H_FORM").first.content.to_i
            end,
            alpha_acids: hop.xpath("F_H_ALPHA").first.content,
            beta_acids: hop.xpath("F_H_BETA").first.content,
            hsi: hop.xpath("F_H_HSI").first.content,
            notes: hop.xpath("F_H_NOTES").first.content
          )
        end
        nil
      end
    end

    def grain
      File.open("/Users/tupaja/Grain.bsmx") do |f|
        xml = Nokogiri::XML(f)
        grains = xml.xpath("//Grain")

        grain_types = GrainType.all.to_a

        Grain.delete_all

        grains.drop(1).each do |grain|
          Grain.create!(
            name: grain.xpath("F_G_NAME").first.content,
            origin: grain.xpath("F_G_ORIGIN").first.content,
            color: grain.xpath("F_G_COLOR").first.content,
            yield: grain.xpath("F_G_YIELD").first.content,
            fg_cg: grain.xpath("F_G_COARSE_FINE_DIFF").first.content,
            moisture: grain.xpath("F_G_MOISTURE").first.content,
            dp: grain.xpath("F_G_DIASTATIC_POWER").first.content,
            proteins: grain.xpath("F_G_PROTEIN").first.content,
            max: grain.xpath("F_G_MAX_IN_BATCH").first.content,
            notes: grain.xpath("F_G_NOTES").first.content,
            type: grain_types.find do |grain_type|
              grain_type.value == grain.xpath("F_G_TYPE").first.content.to_i
            end
          )
        end
      end
      nil
    end

    def call
      hops
      grain
    end
  end
end
