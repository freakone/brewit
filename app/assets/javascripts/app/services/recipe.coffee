angular.module('brewit').factory 'Recipe', ($http) ->

  get = (id) -> $http.get("/assets/app/sample_json/recipe_#{id}.json")

  create = (params) -> $http.post("")

  current =
    ingredients:
      general:
        name: undefined
        boilingTime: undefined
        batchVolume: undefined
        type: undefined
      hops:
        hop: undefined
        boilTime: undefined
        weight: undefined
      grains:
        grain: undefined
        share: 100
      adjuncts:
        adjunct: undefined
      yeast:
        yeast: undefined

  getCurrent = -> return current

  getIngredients = -> return current.ingredients

  setIngredients = (ingredients) ->
    current.ingredients = ingredients

  return {
    get: get
    create: create
    getIngredients: getIngredients
    setIngredients: setIngredients
  }
