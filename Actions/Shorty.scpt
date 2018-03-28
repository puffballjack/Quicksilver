using terms from application "Quicksilver"
        on process text _text
                try
                        set login to "puffballjack" -- Put your login name here
                        set api_key to "R_1a33bfb3aa88481e95120a946f48ddc7" -- Put your login name here
                        set the _encodedUrl to _urlEncode(_text) of me
                        
                        set curlCMD to ¬
                                ¬
                                        "curl --stderr /dev/null \"http://api.bit.ly/shorten?longUrl=" & _encodedUrl & "&history=1&version=2.0.1&login=" & login ¬
                                & "&apiKey=" & api_key ¬
                                & "\"| grep shortUrl | grep -o http.*[/a-zA-Z0-9]"
                        
                        tell me to set _bitlyUrl to (do shell script curlCMD)
                        
                        set AppleScript's text item delimiters to "http://"
                        set _bitlyUrl to text item 3 of _bitlyUrl
                        set AppleScript's text item delimiters to "\""
                        set _bitlyUrl to "http://" & text item 1 of _bitlyUrl
                        set AppleScript's text item delimiters to ""
                        
                        set the clipboard to _bitlyUrl
                        tell application "Quicksilver" to set selection to _bitlyUrl
                on error a number b
                        say a
                        return
                end try
        end process text
end using terms from


on _urlEncode(theText)
        set theTextEnc to ""
        repeat with eachChar in characters of theText
                set useChar to eachChar
                set eachCharNum to ASCII number of eachChar
                if eachCharNum = 32 then
                        set useChar to "+"
                else if (eachCharNum ≠ 42) and (eachCharNum ≠ 95) ¬
                        and (eachCharNum < 45 or eachCharNum > 46) ¬
                        and (eachCharNum < 48 or eachCharNum > 57) ¬
                        and (eachCharNum < 65 or eachCharNum > 90) ¬
                        and (eachCharNum < 97 or eachCharNum > 122) then
                        set firstDig to round (eachCharNum / 16) rounding down
                        set secondDig to eachCharNum mod 16
                        if firstDig > 9 then
                                set aNum to firstDig + 55
                                set firstDig to ASCII character aNum
                        end if
                        if secondDig > 9 then
                                set aNum to secondDig + 55
                                set secondDig to ASCII character aNum
                        end if
                        set numHex to ("%" & (firstDig as string) ¬
                                & (secondDig as string)) as string
                        set useChar to numHex
                end if
                set theTextEnc to theTextEnc & useChar as string
        end repeat
        return theTextEnc
end _urlEncode
