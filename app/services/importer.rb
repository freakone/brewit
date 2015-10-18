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
          types = if get_element(hop, "F_H_TYPE") == "2" # both
            hop_types
          else
            hop_types.select do |hop_type|
              hop_type.value == get_element(hop, "F_H_TYPE").to_i
            end
          end

          Hop.create!(
            name: get_element(hop, "F_H_NAME"),
            origin: get_element(hop, "F_H_ORIGIN"),
            types: types,
            form: hop_forms.find do |hop_form|
              hop_form.value == get_element(hop, "F_H_FORM").to_i
            end,
            alpha_acids: get_element(hop, "F_H_ALPHA"),
            beta_acids: get_element(hop, "F_H_BETA"),
            hsi: get_element(hop, "F_H_HSI"),
            notes: get_element(hop, "F_H_NOTES")
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
            name: get_element(grain, "F_G_NAME"),
            origin: get_element(grain, "F_G_ORIGIN"),
            color: get_element(grain, "F_G_COLOR"),
            yield: get_element(grain, "F_G_YIELD"),
            fg_cg: get_element(grain, "F_G_COARSE_FINE_DIFF"),
            moisture: get_element(grain, "F_G_MOISTURE"),
            dp: get_element(grain, "F_G_DIASTATIC_POWER"),
            proteins: get_element(grain, "F_G_PROTEIN"),
            max: get_element(grain, "F_G_MAX_IN_BATCH"),
            notes: get_element(grain, "F_G_NOTES"),
            type: grain_types.find do |grain_type|
              grain_type.value == get_element(grain, "F_G_TYPE").to_i
            end
          )
        end
      end
      nil
    end

    def styles
      File.open("/Users/tupaja/styleguide2008.xml.txt") do |f|
        xml = Nokogiri::XML(f)
        styles = xml.xpath("//category")

        StyleCategory.delete_all
        Style.delete_all

        styles.drop(1).each do |style|
          category = StyleCategory.create!(
            name: style.xpath("name").first.content.parameterize.underscore
          )
          style.xpath("subcategory").each do |style|
            Style.create!(
              name: get_element(style, "name"),
              subcategory: style.xpath("@id"),
              aroma: get_element(style, "aroma"),
              appearance: get_element(style, "appearance"),
              flavor: get_element(style, "flavor"),
              mouthfeel: get_element(style, "mouthfeel"),
              impression: get_element(style, "impression"),
              comments: get_element(style, "comments"),
              ingredients: get_element(style, "ingredients"),
              ibu_max: get_element(style, "stats//ibu//high"),
              ibu_min: get_element(style, "stats//ibu//low"),
              srm_max: get_element(style, "stats//srm//high"),
              srm_min: get_element(style, "stats//srm//low"),
              og_max: get_element(style, "stats//og//high"),
              og_min: get_element(style, "stats//og//low"),
              fg_max: get_element(style, "stats//fg//high"),
              fg_min: get_element(style, "stats//fg//low"),
              abv_max: get_element(style, "stats//abv//high"),
              abv_min: get_element(style, "stats//abv//low"),
              category: category
            )
          end
        end
      end
      nil
    end

    def yeast
      File.open("/Users/tupaja/Yeast.bsmx") do |f|
        xml = Nokogiri::XML(f)
        yeast = xml.xpath("//Yeast")

        yeast_types = YeastType.all.to_a
        yeast_forms = YeastForm.all.to_a
        yeast_flocculations = YeastFlocculation.all.to_a

        Yeast.delete_all

        yeast.drop(1).each do |single_yeast|
          Yeast.create!(
            name: get_element(single_yeast, "F_Y_NAME"),
            lab: get_element(single_yeast, "F_Y_LAB"),
            id: get_element(single_yeast, "F_Y_PRODUCT_ID"),
            min_attenuation: get_element(single_yeast, "F_Y_MIN_ATTENUATION"),
            max_attenuation: get_element(single_yeast, "F_Y_MAX_ATTENUATION"),
            min_temperature: get_element(single_yeast, "F_Y_MIN_TEMP"),
            max_temperature: get_element(single_yeast, "F_Y_MAX_TEMP"),
            notes: get_element(single_yeast, "F_Y_NOTES"),
            type: yeast_types.find do |yeast_type|
              yeast_type.value == get_element(single_yeast, "F_Y_TYPE").to_i
            end,
            form: yeast_forms.find do |yeast_form|
              yeast_form.value == get_element(single_yeast, "F_Y_FORM").to_i
            end,
            flocculation: yeast_flocculations.find do |yeast_flocculation|
              yeast_flocculation.value == get_element(single_yeast, "F_Y_FLOCCULATION").to_i
            end
          )
        end
        nil
      end
    end

    def adjuncts
      File.open("/Users/tupaja/Misc.bsmx") do |f|
        xml = Nokogiri::XML(f)
        adjuncts = xml.xpath("//Misc")

        adjunct_time_units = AdjunctTimeUnit.all.to_a
        adjunct_types = AdjunctType.all.to_a
        adjunct_units = AdjunctUnit.all.to_a
        adjunct_uses = AdjunctUse.all.to_a

        Adjunct.delete_all

        adjuncts.drop(1).each do |adjunct|
          Adjunct.create!(
            name: get_element(adjunct, "F_M_NAME"),
            notes: get_element(adjunct, "F_M_NOTES"),
            use_for: get_element(adjunct, "F_M_USE_FOR"),
            time: get_element(adjunct, "F_M_TIME"),
            type: adjunct_types.find do |adjunct_type|
              adjunct_type.value == get_element(adjunct, "F_M_TYPE").to_i
            end,
            unit: adjunct_units.find do |adjunct_unit|
              adjunct_unit.values.include?(get_element(adjunct, "F_M_UNITS").to_i)
            end,
            use: adjunct_uses.find do |adjunct_use|
              adjunct_use.value == get_element(adjunct, "F_M_USE").to_i
            end,
            time_unit: adjunct_time_units.find do |adjunct_time_unit|
              adjunct_time_unit.value == get_element(adjunct, "F_M_TIME_UNITS").to_i
            end
          )
        end
      end
      nil
    end

    def call
      hops
      grain
      styles
      yeast
      adjuncts
    end

    private

    def get_element resource, selector
      resource.xpath(selector).first.content rescue nil
    end
  end
end
