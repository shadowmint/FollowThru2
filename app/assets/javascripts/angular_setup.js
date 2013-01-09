/** Common angular js setup code */
var module = angular.module('App', ['ngResource']);
  module.config(["$httpProvider", function(provider) {
  provider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');
}]);
