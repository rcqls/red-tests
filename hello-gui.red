Red [Needs:	 'View]

font-A: make font! [
	name: "Times New Roman"
	size: 15
	color: red
	style: [bold italic underline]
	anti-alias?: yes
]

l: layout [button "hello" font font-A]
view l
