Red[Needs: View]

ask-name: func [what [any-type!] /local name namef] [
	name: either what = 'new [none][either object? what [what/text][form what]]
	view/flags compose [
		title "Edit"
		namef: field (any [name copy ""]) focus on-enter [name: face/text unview]
		return
		button "OK" [name: namef/text unview] 
		button "Cancel" [name: none unview]
	][modal popup]
	if object? what [what/text: name]
	name
]

view [
	below
	t: text "toto"
	button "ask" [ask-name t]
	
]