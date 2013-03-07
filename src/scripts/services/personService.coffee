# angular.module("Test", ["ngResource"]).controller "corsCtrl", ($scope, $http, $resource) ->
#   $http.defaults.useXDomain = true
#   $scope.useHttp = ->
#     $http.get("http://ricardohbin.com/cors/testcors.php").success (data) ->
#       alert data.ok


#   $scope.useResource = ->
#     User = $resource("http://ricardohbin.com/cors/testcors.php",
#       userId: "@id"
#     )
#     User.get
#       userId: 123
#     , (data) ->
#       alert data.ok



# angular.module('app').factory 'prsService', ['$log', '$http', '$resource', ($log, $http, $resource) ->

#   $http.defaults.useXDomain = true
# 	activity = $resource './prss/:id'


# 	get = (success, failure) ->
# 		activity.query {}
# 		, (prss, getResponseHeaders) ->
# 			success(prss) if angular.isFunction success
# 		, failure

# 	getPrs = (id, success, failure) ->
# 		activity.get {id: id}
# 		, (prs, getResponseHeaders) ->
# 			success(prs) if angular.isFunction success
# 		, failure

# 	save = (prs, success, failure) ->
# 		newPrs = new activity prs

# 		newPrs.$save (newPrs, getResponseHeaders) ->
# 			success(newPrs) if angular.isFunction success
# 		, failure

# 	{get, getPrs, save}
# ]

angular.module('app').factory 'personService', ['$log', '$resource', ($log, $resource) ->
	activity = $resource './people/:id'

	get = (success, failure) ->
		activity.query {}
		, (people, getResponseHeaders) ->
			success(people) if angular.isFunction success
		, failure

	getPerson = (id, success, failure) ->
		activity.get {id: id}
		, (person, getResponseHeaders) ->
			success(person) if angular.isFunction success
		, failure

	save = (person, success, failure) ->
		newPerson = new activity person

		newPerson.$save (newPerson, getResponseHeaders) ->
			success(newPerson) if angular.isFunction success
		, failure

	{get, getPerson, save}
]
