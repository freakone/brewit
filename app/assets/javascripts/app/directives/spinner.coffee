angular.module('brewit').directive 'spinner', ->
  restrict: "AE"
  templateUrl: 'spinner.html'
  replace: true
  scope:
    spinner: '='
    message: '@'

  link: (scope, elem, attrs) ->
    scope.$watch 'spinner', (isLoading) ->
      updateSpinner(isLoading)

    updateSpinner = (isLoading) ->
      if isLoading then elem.addClass('spinner--active') else elem.removeClass('spinner--active')
