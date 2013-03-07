angular.module('app').controller 'prsDetailsController', ['$log', '$scope', '$rootScope', 'prsService', ($log, $scope, $rootScope, prsService) ->
	$scope.onRouteChange = (routeParams) ->
		prsService.getPrs routeParams.id
		, (prs) ->
			$scope.prs = prs
]
