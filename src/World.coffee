
class @World
	constructor: ->
		@objects = []
		@gravity = 0.8
		window.addEventListener "hashchange", (e)=>
			@generate()
	
	generate: ->
		window.debug_mode = location.hash.match /debug/
		
		if location.hash.match /test/
			return @generate_test_map()
		
		@objects = []
		
		@objects.push(new Ground({y: 150}))
		
		# @objects.push(@player = new Player({x: 50, y: @objects[0].y}))
		@objects.push(@player_1 = new Player({x: 50, y: 50, color: "red"}))
		@objects.push(@player_2 = new Player({x: 150, y: 50, color: "aqua", is_player_2: yes}))
		@player_1.find_free_position(@)
		@player_2.find_free_position(@)
		@players = [@player_1, @player_2]
	
	step: ->
		for object in @objects
			object.step?(@)
	
	draw: (ctx, view)->
		for object in @objects
			object.draw?(ctx, view)
