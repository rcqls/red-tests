Red[Needs: View]
 

connector: [
	at 0x0 base 300x200 with [
		text: (text)
		draw: [line 10x10 100x100]
	]
	'all-over
	on-down [print face/text]
]

main: layout [
	title "Test panel"
	button "reverse" [p/pane: reverse p/pane foreach f p/pane [probe f/text]]
	button "add" [
		edge: first layout/only compose/deep bind connector context [
			text: "4"
		]
		insert tail p/pane edge
		foreach f p/pane [probe f/text]
	]
	p: panel 300x200 
	[
		origin 10x10
		base 40x40 238.180.34 "1" on-down [
			print "1"
		] 'all-over
		origin 20x20
		base 40x40 34.238.180 "2"  on-down [
			print "2"
		] 'all-over
		origin 30x30
		base 40x40 238.34.180 "3"  on-down [
			print "3"
		] 'all-over
		 
	]
	on-down [print "panel"]
]
view/flags/no-wait main 'resize

do-events