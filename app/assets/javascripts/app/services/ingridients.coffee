angular.module('brewit').factory 'Ingredients', ($http) ->

  # get(grain)
  get = (ingredient) ->
    console.log ingredient
    $http.get("/assets/app/sample_json/#{ingredient}.json")

  # getMultiple(yeasts, grains, hops)
  getMultiple = (chosenIngredients) ->
    ingredients = []
    for ingredient in chosenIngredients
      ingredients.push(get(ingredient))
    return ingredients

  return {
    get: get,
    getMultiple, getMultiple
  }
