Red[]

mainclr: 32.32.32.0
dispclr: 48.48.48.0
navdir: %.
hiddenfiles: no
extralight: 96
syswinfnt: make font! [name "Andale Mono" size 10]
backclr: 16.16.16.0
sysclr: 48.48.48.0
isfile: no
extralight: 96

codext: [".red" ".reds" ".txt"]
codefile: none

isfile: func [sel][
	if not dir? to-red-file sel [
		file: copy to-red-file rejoin [navdir sel]
		if find codext form suffix? sel [
			openfile file
			return true
		]
		if find imgext form suffix? sel [

		]
		if ((first sel) = #".") and ((second sel) <> #".")[
			openfile file
			return true
		]
		if (find sel #".") = none [
			openfile file
			return true
		]
		return false
	]
	return false
]

isback: func [sel] [
	if sel = ".." [
		spl: split-path navdir
		if spl [
			change-dir spl/1
			navdir: to-red-file get-current-dir
			navigation
		]

	]
]

isdir: func[sel][
	if (last sel) = #"/" [
		change-dir rejoin [navdir sel]
		navdir: to-red-file get-current-dir
		navigation
	]
]

treecom: does [
	path: to-red-file find/tail treecli/text ">"
	either (dir? path)[
		fullpath: rejoin [navdir path]
		case [
			(exists? path) [navdir: copy normalize-dir path]
			(exists? fullpath) [navdir: copy normalize-dir fullpath]
		]
		navigation
	][
		if exists? path [isfile path]
	]
]

flashbutton: function [face event][
	either event/away?[
		face/font/color: sysclr
	][
		face/font/color: sysclr + extralight
	]
]

navigation: does [
	dirlist: copy read/lines navdir
	if not hiddenfiles [
		remove-each file dirlist [(first file) = #"." ]
	]
	if (first dirlist) = "" [take dirlist]
	if navdir <> %"/" [insert dirlist ".."]
	print ["dirlist:"  sort dirlist lf]
	treelist/data: sort dirlist

	; add for treecli
	spl: split-path navdir
	either spl/2 [
		treecli/data: rejoin [spl/2 " >"]
	][
		treecli/data: rejoin [spl/1 " >"]
	]
]

view [
	origin 0x0 space 1x0
    below
    treepan: panel mainclr [
        below
        origin 0x0 space 0x0
        treebar: panel [
            origin 0x0 space 0x0
            treeclose: text "▾" 16 center font syswinfnt on-down [
                    closepanel treepan treebar face 196x0 196x211
                ] on-over [flashbutton face event]
            treelabel: text "Tree" 48 font syswinfnt on-up [
                    face/font/color: sysclr
                    navdir: copy homedir
                    navigation
                ] on-down [face/font/color: gray
                ] on-over [flashbutton face event]

            treedir: text "❒" 24 center font syswinfnt on-down [
                    closemenu face does [
                        askuser/folder face "Create Dir" defdir
                    ]
                ]

            treefile: text "✚" 24 center font syswinfnt on-down [
                    closemenu face does [
                        askuser/file face "Create File" deffile
                    ]
                ]

            treename: text "✏︎" 24 center font syswinfnt on-down [
                    sel: treelist/selected
                    if  (sel <> none) [
                        closemenu face does [
                            askuser/rename face "Rename" treelist/data/:sel
                        ]
                    ]
                ]

            treedel: text "⌫" 24 center font syswinfnt on-up[
                    sel: treelist/selected
                    if (sel <> none) [
                        closemenu face does [
                            askuser/del face "Remove" treelist/data/:sel
                        ]
                    ]
                ]

            treehide: text ".*" 24 center font syswinfnt on-down [
                    face/font/color: either hiddenfiles [
                        hiddenfiles: false
                        gray
                    ][
                        hiddenfiles: true
                        sysclr
                    ]
                    navigation
                ]
        ]

        treeask: panel 196x0 mainclr [
            origin 0x0 space 0x4
            below
            asktext: text "" 196 center font syswinfnt
            askinp: area 196x16 "" center dispclr no-border font syswinfnt
                on-key-down[
                    if event/key = 13 [
                        askfunc
                        linenum: linenum + 1
                        showline
                    ]
                    if event/key = 27 [askclose]
                ]
                yesbut: text "↳" 196 center font syswinfnt on-up [
                        face/font/color: sysclr
                        askfunc
                    ] on-down [face/font/color: gray
                    ] on-over [flashbutton face event]
        ]

        treespace: panel 196x211 dispclr [
            origin 0x0 space 0x1
            below
            treecli: field 196x16 no-border on-change [
                unless find face/text ">" [append face/text ">"]
                treecom
            ] on-key-down[
                if (form event/key) = "left-command" [
                    path: find/tail face/text ">"
                    container: copy []
                    foreach file dirlist [
                        res: find/case/match file path
                        if res [append container res]
                    ]
                    if (length? container) = 1 [
                        append face/text container/1
                        treecom
                    ]
                ]
            ]

            treelist: text-list 196x195 data ["toto" "titi"] no-border on-change [
                sel: pick face/data face/selected
                if sel [
                    isfile sel
                    askinp/text: form sel
                ]
            ] on-dbl-click [
                sel: pick face/data face/selected
                if sel [
                    isback sel
                    isdir sel
                ]
            ]on-key-down [
                sel: pick face/data face/selected
                if (form event/key) = "right" [
                    if sel [
                        if (isfile sel) [execute codemill]
                        isdir sel
                    ]
                ]
                if (form event/key) = "left" [isback sel]
            ]
        ]on-create [navigation print ["length of treelist: " length? face/data lf]]
    ]
	button "ok" [navigation print ["length of treelist: " length? treelist/data lf]]
]