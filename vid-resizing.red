
Red[needs: View]
view/flags [
    on-resizing [
        face/pane/1/size: face/size - 20x55 
        face/pane/2/offset/y: face/size/y - 35
    ] below box 100x100 gold button "Quit" [unview]
] 'resize