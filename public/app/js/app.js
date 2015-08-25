(function() {
  'use strict';

  angular
    .module('app', ['ui.router', 'ngMaterial'])
    .config(routeConfig)

  function routeConfig($stateProvider, $urlRouterProvider) {
    $stateProvider
      .state('invoices', {
        url: '/:contactId',
        templateUrl: 'views/invoices.html',
        controller: 'InvoicesController',
        controllerAs: 'vm'
      });

    $urlRouterProvider.otherwise('/');
  }
})();
