angular.module('app').controller 'personDetailsController', ['$log', '$scope', '$rootScope', 'personService', ($log, $scope, $rootScope, personService) ->
	$scope.onRouteChange = (routeParams) ->
		personService.getPerson routeParams.id
		, (person) ->
			$scope.person = person
]

# angular.module('app').controller 'prsDetailsController', ['$log', '$scope', '$rootScope', 'prsService', ($log, $scope, $rootScope, prsService) ->
# 	$scope.onRouteChange = (routeParams) ->
# 		prsService.getPrs routeParams.id
# 		, (prs) ->
# 			$scope.prs = prs
# ]