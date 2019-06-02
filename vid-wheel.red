Red [needs: View]
view [  
    canvas: base 540x540 draw []
    on-down [print ["on-down:" event/offset if event/ctrl? [ " control "] if event/shift? [ " shift "] lf]]
    on-wheel [print ["on-wheel:" event/offset if event/ctrl? [ " control "] if event/shift? [ " shift "] lf]]
    on-created [print ["on-created" lf] set-focus canvas]
]