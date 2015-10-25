class Api::Internal::StyleCategoriesController < Api::Internal::ApiController
  def index
    render json: StyleCategory.all.map(&:attributes)
  end

  def show
    render json: StyleCategory.find(params[:id]).styles.map(&:attributes)
  end
end
