module Api
  module Internal
    class IngredientsController < ApiController
      def index
        render json: {
          yeast: Yeast.all.map(&:attributes),
          malts: Grain.all.map(&:attributes),
          hops: Hop.all.map(&:attributes),
          adjuncts: Adjunct.all.map(&:attributes)
        }
      end
    end
  end
end
