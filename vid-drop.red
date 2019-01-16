Red [Needs:	 'View]

view [
    list: drop-list data ["One" 4 "Two" 5 "Three" 6 "Four" 7] 
    button "Add" [append list/data "Five"]
    button "Change" [lowercase pick list/data list/selected]
    return
	down: drop-down data ["One" "Two" "Three" "Four"]
    button "Add" [append down/data "Five"]
    button "Change" [lowercase pick down/data down/selected]
]