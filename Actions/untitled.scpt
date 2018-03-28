using terms from application "Quicksilver"
        on process text theURL
                set shortURL to do shell script "curl -s https://www.googleapis.com/urlshortener/v1/url -H 'Content-Type: application/json' -d \"{\\\"longUrl\\\": \\\"" & theURL & "\\\"}\" | awk '/\"id\":/{print substr($2, 2, length($2)-3)}'"
                return shortURL
        end process text

        --Note: For versions of Quicksilver prior to 1.0, remove the following three lines of code.
        on get direct types
                return {"Apple URL pasteboard type"}
        end get direct types

end using terms from