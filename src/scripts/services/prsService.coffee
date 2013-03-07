angular.module('app').factory 'prsService', ['$log', '$resource', ($log, $resource) ->

	activity = $resource './prss/:id'


	# console.log activity.query
	# console.log $resource

	get = (success, failure) ->
		activity.query {}
		, (prss, getResponseHeaders) ->
			success(prss) if angular.isFunction success
		, failure

	getPrs = (id, success, failure) ->
		activity.get {id: id}
		, (prs, getResponseHeaders) ->
			success(prs) if angular.isFunction success
		, failure

	save = (prs, success, failure) ->
		newPrs = new activity prs

		newPrs.$save (newPrs, getResponseHeaders) ->
			success(newPrs) if angular.isFunction success
		, failure

	{get, getPrs, save}
]
