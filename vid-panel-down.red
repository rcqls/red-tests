Red[Needs: View]
 
main: layout [
	title "Test panel"
	panel 300x200 [
		on-down [
			print "toto"
		]
		on-key-down [
			print "tutu"
		]
		on-key [
			print "tutu2"
		]
	]
]
view main