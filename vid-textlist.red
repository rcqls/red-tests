Red [Needs:	 'View]

view [
    list: text-list data ["John" "Bob" "Alice"]
    button "Add" [append list/data "Sue"]
    button "Change" [lowercase pick list/data list/selected]
]