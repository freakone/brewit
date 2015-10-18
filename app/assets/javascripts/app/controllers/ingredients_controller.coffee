angular.module('brewit')
.controller 'IngredientsController',
(Recipe, ingredients) ->

  @db = ingredients

  @recipeIngredients =
    grains: [
      {
        id: undefined
        share: 100
      }
    ]

  clearForm = =>
    @grainForm =
      id: undefined
      share: undefined

  @addGrain = =>
    @recipeIngredients.grains.push(@grainForm)
    # clearForm()

  clearForm()

  return false
