class Api::Internal::RecipesController < Api::Internal::ApiController
  def create
    render :nothing => true, :status => 201
  end

  private

  def recipe_params
    params.require(hop_ids: [])
  end
end
