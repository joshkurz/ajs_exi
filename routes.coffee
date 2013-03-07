nextId = 0

people = [
	{"id": "#{nextId++}", "name": "Saasha", "age": "5"}
	{"id": "#{nextId++}", "name": "Planet", "age": "7"}
]
prss = [
	{"id": "#{nextId++}", "fNam": "Larry", "lNam": "Stooge"}
	{"id": "#{nextId++}", "fNam": "Moe", "lNam": "Stooge"}
	{"id": "#{nextId++}", "fNam": "Curley", "lNam": "Stooge"}
]

isUniqueName = (name) ->
	(name for person in people when person.name is name).length is 0

module.exports = (app, dir) ->
	app.get '/', (req, res) ->
		res.render "#{dir}/index.html"

	app.get '/people', (req, res) ->
		res.json people

	app.post '/people', (req, res) ->
		name = req.body.name
		age = req.body.age

		message =
			"title": "Duplicate!"
			"message": "#{name} is a duplicate.  Please enter a new name."

		return res.send(message, 403) if not isUniqueName name

		person =
			"id": "#{nextId++}"
			"name": "#{name}"
			"age": "#{age}"

		people.push person
		res.json person

	app.get '/people/:id', (req, res) ->
		id = req.params.id
		current = person for person in people when parseInt(person.id, 10) is parseInt(id, 10)

		res.json current

	# app.get '/prss/', (req, res) ->
	# 	res.json prss

	app.get '/prss', (req, res) ->
		res.json prss

	app.post '/prss', (req, res) ->
		fNam = req.body.fNam
		lNam = req.body.lNam

		# message =
		# 	"title": "Duplicate!"
		# 	"message": "#{fNam} is a duplicate.  Please enter a new name."

		# return res.send(message, 403) if not isUniqueName name

		prs =
			"id": "#{nextId++}"
			"fNam": "#{fNam}"
			"lNam": "#{lNam}"

		prss.push prs
		res.json prs

	app.get '/prss/:id', (req, res) ->
		id = req.params.id
		current = prs for prs in prss when parseInt(prs.id, 10) is parseInt(id, 10)

		res.json current