(function() {
  'use strict';

  angular
    .module('app')
    .controller('InvoicesController', InvoicesController);

  function InvoicesController($http, $stateParams) {
    var vm = this;
    vm.invoices = [];
    vm.invoice = null;
    vm.loading = true;

    vm.toggleInvoice = toggleInvoice;

    activate();

    function activate() {
      $http.get('/api/' + $stateParams.contactId).success(function (invoices) {
        delete vm.loading;
        vm.invoices = invoices;
      });
    }

    function toggleInvoice(invoice) {
      if (vm.invoice && invoice.invoice_id === vm.invoice.invoice_id) {
        delete vm.invoice
      } else {
        vm.invoice = invoice
      }
    }
  }
})();
