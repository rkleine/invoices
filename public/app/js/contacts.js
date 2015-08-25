(function() {
  'use strict';

  angular
    .module('app')
    .controller('ContactsController', ContactsController);

  function ContactsController($scope, $state, $http) {
    var vm = this;

    vm.contacts = [];

    activate();

    function activate() {
      $http.get('/api').success(function (contacts) {
        vm.contacts = contacts;
      });
    }
  }
})();
