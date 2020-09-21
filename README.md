### Demo Docker Api
This is a very simple app built with [FastAPI](https://fastapi.tiangolo.com/) framework

It uses uvicorn as a production server and consists on one basic endpoint.
Swagger is already included at `/docs`

### Running locally
`make run-api-locally`

The app will be running in `localhost:8000`

A conda environment is provided that will install all the required dependencies before starting the server

### Running in docker 
`make docker-build`

`make docker-run`

The app will be running on `localhost:8000` inside the container, and you can access the app from your computer host on
`localhost:8080`
