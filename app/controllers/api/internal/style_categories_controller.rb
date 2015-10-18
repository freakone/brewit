module Api
  module Internal
    class StyleCategoriesController < ApiController
      def index
        render json: StyleCategory.all.map(&:attributes)
      end

      def show
        render json: StyleCategory.find(params[:id]).styles.map(&:attributes)
      end
    end
  end
end
