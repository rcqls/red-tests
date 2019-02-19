Red [Needs: View]
;system/view/debug?: yes
view [

        rich-text data [
            <i> <b> black "Hello" </b> <font> ["Arial" 24] red " Red " </font> blue "World!" </i>
        ]
        rich-text data [i b "Hello" /b font 24 red " Red " /font s blue "World!" /s /i]
        rich-text data [i [b/green ["Hello"] red font 24 [" Red "] blue "World!"]]
        rich-text data [i/b/u/red ["Hello" font ["Arial" 24] " Red " /font blue "World!"]]
    ]
;system/view/debug?: no