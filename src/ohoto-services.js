const prefix = '//api.oho.to';

var ohotoServices = angular.module('ohotoServices', ['ngResource']);

ohotoServices.factory('Item', ['$resource', ($resource) => {
  return $resource(prefix + '/items/:itemId', {}, {
    query: {
      method: 'GET',
      params: {
        itemId: '',
        tag: ''
      },
      isArray: true
    }
  });
}]);

ohotoServices.factory('Shop', ['$resource', ($resource) => {
  return $resource(prefix + '/shops/:shopId', {}, {
    query: {
      method: 'GET',
      params: {
        shopId: ''
      },
      isArray: true
    }
  });
}]);

ohotoServices.factory('User', ['$resource', ($resource) => {
  return $resource(prefix + '/users/:userId', {}, {
    query: {
      method: 'GET',
      params: {
        userId: ''
      },
      isArray: true
    }
  });
}]);
