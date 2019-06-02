Red[Needs: View]

view [
	cam: camera 400x300
	but: button "start" [probe cam/data cam/selected: 1]
	cam-list: drop-list 160x32  [
		on-create: func [face [object!]][
			print "ici"
			probe cam/data
			face/data: cam/data
		]
		on-change: func [face [object!] event [event!]][
			print ["changed:" face/selected]
			unless cam/selected = face/selected [
				cam/selected: face/selected
			]
		]
	]
	but: button "stop" [cam/selected: none]
]