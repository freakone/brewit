angular.module('brewit')
.controller 'NewRecipeController',
(Recipe, Styles, $state) ->

  class Step
    constructor: (@id, @description, @duration, @requirements) ->
      @shortDesc = "Step: #{@id}, #{@description.slice(0, 40)}"

  @isLoading = false

  @styles = []

  @styleCategories = [
    "stout",
    "pilsner",
    "scottish and irish ale",
    "dark lager",
    "belgian and french ale",
    "german wheat and rye beer",
    "american ale",
    "english pale ale",
    "porter",
    "european amber lager",
    "bock",
    "fruit beer"
  ]

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

  getStyles = =>
    Styles.get()
      .success (response) =>
        @styles = response
      .error ->
        console.log "Błąd, dupa i kamieni kupa."

  @saveRecipe = =>
    Recipe.create(@params)
      .success (response) ->
        $state.go('recipe', { recipeId: response.id })
      .error ->
        console.log 'Nie zapisano recepty. :('
        # TODO: remove this below
        $state.go('recipe', { recipeId: 1 })

  getStyles()

  return false
