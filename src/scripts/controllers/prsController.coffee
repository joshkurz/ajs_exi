angular.module('app').controller 'prsController', ['$log', '$scope', '$location', 'prsService', ($log, $scope, $location, prsService) ->

	$scope.prss = []

	$scope.insertPrs = (prs) ->
		prsService.save prs
		, (prs, getResponseHeaders) ->
			$scope.error = ''
			$scope.prs = {}

			$scope.prss.push prs
			$location.path "/prss/#{prs.id}"
		, (error) ->
			($scope.error = error.data) if error.status is 403

	prsService.get (prss) ->
		$scope.prss = prss
]

# angular.module('app').controller 'prsController', ['$log', '$scope', '$http', '$location', 'prsService', ($log, $scope, $http, $location, prsService) ->

# 	$http.defaults.useXDomain = true
# 	$scope.prss = []

#   $scope.get = ->
#     $http.get(url).success (data) ->
#       alert data.ok

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


#   # $http.get(url).success (data) ->
#   #   alert data.ok
# ]

