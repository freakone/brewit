app = angular.module 'brewit', [
  'ui.router'
  'pascalprecht.translate'
  'templates'
  'ngAnimate'
]


# app.config ($translateProvider, Rails) ->
#   $translateProvider.useSanitizeValueStrategy('sanitizeParameters')
#   $translateProvider.useLoader('railsLocalesLoader')
#   $translateProvider.preferredLanguage(Rails.locale)
#   $translateProvider.fallbackLanguage(Rails.fallback) unless isNoTranslationLocale(Rails.locale)
#
# isNoTranslationLocale = (locale) -> locale == 'xx-XX'
#
# app.config ($httpProvider) ->
#   $httpProvider.defaults.headers.common['X-CSRF-Token'] =
#     angular.element(document.querySelector('meta[name=csrf-token]')).attr('content')

# app.config ($provide, $httpProvider, Rails) ->
#   $provide.factory 'localesInterceptor', ->
#     request: (config) ->
#       if localeUrl = Rails.locales_paths?[config.url]
#         config.url = localeUrl
#       config
#
#   $httpProvider.interceptors.push('localesInterceptor')

app.config ($locationProvider) ->
  $locationProvider.html5Mode(
    enabled: true
    requireBase: false
  )
