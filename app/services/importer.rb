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

    def styles
      File.open("/Users/tupaja/styleguide2008.xml.txt") do |f|
        xml = Nokogiri::XML(f)
        styles = xml.xpath("//category")

        StyleCategory.delete_all
        Style.delete_all

        attribute_or_nil = lambda do |style, selector|
          (style.xpath(selector).first.content rescue nil)
        end

        styles.drop(1).each do |style|
          category = StyleCategory.create!(
            name: style.xpath("name").first.content.parameterize.underscore
          )
          style.xpath("subcategory").each do |style|
            Style.create!(
              name: attribute_or_nil.call(style, "name"),
              subcategory: style.xpath("@id"),
              aroma: attribute_or_nil.call(style, "aroma"),
              appearance: attribute_or_nil.call(style, "appearance"),
              flavor: attribute_or_nil.call(style, "flavor"),
              mouthfeel: attribute_or_nil.call(style, "mouthfeel"),
              impression: attribute_or_nil.call(style, "impression"),
              comments: attribute_or_nil.call(style, "comments"),
              ingredients: attribute_or_nil.call(style, "ingredients"),
              ibu_max: attribute_or_nil.call(style, "stats//ibu//high"),
              ibu_min: attribute_or_nil.call(style, "stats//ibu//low"),
              srm_max: attribute_or_nil.call(style, "stats//srm//high"),
              srm_min: attribute_or_nil.call(style, "stats//srm//low"),
              og_max: attribute_or_nil.call(style, "stats//og//high"),
              og_min: attribute_or_nil.call(style, "stats//og//low"),
              fg_max: attribute_or_nil.call(style, "stats//fg//high"),
              fg_min: attribute_or_nil.call(style, "stats//fg//low"),
              abv_max: attribute_or_nil.call(style, "stats//abv//high"),
              abv_min: attribute_or_nil.call(style, "stats//abv//low"),
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
            name: single_yeast.xpath("F_Y_NAME").first.content,
            lab: single_yeast.xpath("F_Y_LAB").first.content,
            id: single_yeast.xpath("F_Y_PRODUCT_ID").first.content,
            min_attenuation: single_yeast.xpath("F_Y_MIN_ATTENUATION").first.content,
            max_attenuation: single_yeast.xpath("F_Y_MAX_ATTENUATION").first.content,
            min_temperature: single_yeast.xpath("F_Y_MIN_TEMP").first.content,
            max_temperature: single_yeast.xpath("F_Y_MAX_TEMP").first.content,
            notes: single_yeast.xpath("F_Y_NOTES").first.content,
            type: yeast_types.find do |yeast_type|
              yeast_type.value == single_yeast.xpath("F_Y_TYPE").first.content.to_i
            end,
            form: yeast_forms.find do |yeast_form|
              yeast_form.value == single_yeast.xpath("F_Y_FORM").first.content.to_i
            end,
            flocculation: yeast_flocculations.find do |yeast_flocculation|
              yeast_flocculation.value == single_yeast.xpath("F_Y_FLOCCULATION").first.content.to_i
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
            name: adjunct.xpath("F_M_NAME").first.content,
            notes: adjunct.xpath("F_M_NOTES").first.content,
            qty: adjunct.xpath("F_M_AMOUNT").first.content.to_f/adjunct.xpath("F_M_VOLUME").first.content,
            use_for: adjunct.xpath("F_M_USE_FOR").first.content,
            time: adjunct.xpath("F_M_TIME").first.content,
            type: adjunct_types.find do |adjunct_type|
              adjunct_type.value == adjunct.xpath("F_M_TYPE").first.content.to_i
            end,
            unit: adjunct_units.find do |adjunct_unit|
              adjunct_unit.value == adjunct.xpath("F_M_UNITS").first.content.to_i
            end,
            use: adjunct_uses.find do |adjunct_use|
              adjunct_use.value == adjunct.xpath("F_M_USE").first.content.to_i
            end,
            time_unit: adjunct_time_units.find do |adjunct_time_unit|
              adjunct_time_unit.value == adjunct.xpath("F_M_TIME_UNITS").first.content.to_i
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
  end
end
