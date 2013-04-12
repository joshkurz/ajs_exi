angular.module('app').controller 'apiController', ['$log', '$scope', '$location', 'apiService', ($log, $scope, $location, apiService) ->
	$scope.endpoints = []
	apiService.get().then (results) ->
		console.log results
		$scope.endpoints = results[0]['child']
]