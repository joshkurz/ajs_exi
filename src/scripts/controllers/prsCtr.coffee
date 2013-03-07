angular.module('app').controller 'prsCtr', ($scope, $http) ->

	$http.defaults.useXDomain = true
	$scope.prss = []

	url = 'http://exi.orgtec.com/prss/'

	$scope.get = ->
	  $http.get(url).success (data) ->
	    alert data.ok

	# $http.get(url).success (data) ->
	#   alert data.ok

