 #!/usr/local/bin/env python3
import sys
from urllib.parse import urlparse # Import the urllib.parse library
sys.path.append('/Library/Python/2.7/site-packages/') # Append path to requests Library
import requests # Import requests Library
longUrl = sys.argv[1] # Input from terminal
accessToken = '994aaccf6fae07658a15f236ae45bb00cbaf6e6a' # bit.ly ACCESS_TOKEN goes here
format = 'txt' # Output format from API
apiUrlF = 'https://api-ssl.bitly.com/v3/shorten' # Link Shortening API URL Front
apiUrlB = '?access_token=' + accessToken + '&longUrl=' + longUrl + '&format=' + format # Link Shortening API URL Back
apiUrl = apiUrlF + apiUrlB # Put the two halves of the Link Shortening Together

output = requests.get(apiUrl) # Set output to the URL Request of apiURL
if(output.status_code == 200): # If the request of variable output went through, do...
    print(output.text.rstrip('\n')) # Print the output of the apiURL request and get rid of new lines
else: # Else
    print('Something went wrong.') # Tell the user 'Something went went wrong.'

quit()
