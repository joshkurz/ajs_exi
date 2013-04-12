angular.module('app').service 'apiService', ['$log', '$q', '$resource', ($log, $q, $resource) ->
	self = @
	Endpoints = $resource 'http://exi.xchg.com'

	get = ->
		defer = $q.defer()
		Endpoints.query {}, (results) ->
			defer.resolve results
		, (results) ->
			$log.error 'personService.query error', results
			defer.reject results

		defer.promise


	self.get = get
]