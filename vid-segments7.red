Red[Needs: View]

; home:"" call/console/output "echo $HOME" home
; home: trim/tail home 
home: get-env "HOME"
do to-file reduce [home either system/platform = 'Linux ["/work"][""] "/tmp/RedTest/red-styles/segment-display.red"]
view [ base 800x200 draw segment!/draw "Congrats Bolek! 12345"]