angular.module('brewit')
.controller 'NewRecipeController',
(Recipe, Ingredients, Styles, $state, $q) ->

  class Step
    constructor: (@id, @description, @duration, @requirements) ->
      @shortDesc = "Step: #{@id}, #{@description.slice(0, 40)}"

  @ingredients =
    grains: []
    yeasts: []
    hops: []
    add_ons: []

  @styles = []

  @page = 1

  @stepForm =
    description: ''
    duration: ''
    requirements: ''

  @params =
    style: ''
    type: ''
    yeasts: ''
    malts: ''
    hops: ''
    add_ons: ''
    name: ''
    impression: ''
    taste: 0
    bitterness: 0
    aroma: 0
    foam: 0
    purity: 0
    recipe_by_step: []

  saveStep = =>
    @params.recipe_by_step.push new Step(@params.recipe_by_step.length + 1, @stepForm.description, @stepForm.duration, @stepForm.requirements)

  @addStep = =>
    saveStep()
    clearForm()

  clearForm = =>
    @stepForm =
      description: ''
      duration: ''
      requirements: ''

  @getIngredient = (Ingredient) =>
    if !@ingredients[Ingredient].length
      Ingredients.get(Ingredient)
        .success (response) =>
          @ingredients[Ingredient] = response


  # If we would need to load many things at once. This is f*cking ugly btw.
  getIngredients = (ingredientsList) =>
    ingredientsPromises = Ingredients.getMultiple(ingredientsList)
    $q.all(ingredientsPromises).then (results) =>
      for ingredient, _index in ingredientsList
        @ingredients[ingredient] = results[_index].data

  getIngredients(['hops', 'grains', 'yeasts'])

  getStyles = =>
    Styles.get()
      .success (response) =>
        @styles = response
      .error ->
        console.log "Błąd, dupa i kamieni kupa."

  getStyles()

  @saveRecipe = =>
    Recipe.create(@params)
      .success (response) ->
        $state.go('recipe', { recipeId: response.id })
      .error ->
        console.log 'Nie zapisano recepty. :('
        # TODO: remove this below
        $state.go('recipe', { recipeId: 1 })

  return false
