angular.module('app').controller 'personController', ['$log', '$scope', '$location', 'personService', ($log, $scope, $location, personService) ->
	$scope.people = []

	$scope.insertPerson = (person) ->
		personService.save person
		, (person, getResponseHeaders) ->
			$scope.error = ''
			$scope.person = {}

			$scope.people.push person
			$location.path "/people/#{person.id}"
		, (error) ->
			($scope.error = error.data) if error.status is 403

	personService.get (people) ->
		$scope.people = people
]

# angular.module('app').controller 'prsController', ['$log', '$scope', '$location', 'prsService', ($log, $scope, $location, prsService) ->
# 	$scope.prss = []


# 	$scope.insertPrs = (prs) ->
# 		prsService.save prs
# 		, (prs, getResponseHeaders) ->
# 			$scope.error = ''
# 			$scope.prs = {}

# 			$scope.prss.push prs
# 			$location.path "/prss/#{prs.id}"
# 		, (error) ->
# 			($scope.error = error.data) if error.status is 403

# 	prsService.get (prss) ->
# 		$scope.prss = prss
# ]