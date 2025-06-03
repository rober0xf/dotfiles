`asgi.py`: the file dedicated to asynchronous request handling (we normally in deploy will use `asgi`)  
`wsgi.py`: this is for handling the synchronous request. if we do not use web-sockets or something live needed we probably will use `wsgi`

`settings.py`: here we configure our project, things like the middle-wares, the apps installed, db connection etc.
`url.py`: will handle all the endpoints of our web app