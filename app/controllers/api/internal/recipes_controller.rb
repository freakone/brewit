class Api::Internal::RecipesController < Api::Internal::ApiController
  def create
    render json: recipe_params, status: 201
  end

  private

  def recipe_params
    params.require(:recipe).permit(
      :style_id, :name,
      hops: [:id, :mass, :time],
      grains: [:id, :mass],
      yeast: [:id, :mass],
      adjunct: [:id, :mass]
    )
  end
end
