import logging
import sys
from os import path

import toml
import uvicorn
from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def read_root():
    # load toml file
    logging.debug("Loading environment variables from file: ")
    config_file = path.join(path.dirname(__file__), "../config.toml")
    props = toml.load(config_file)
    return {"Hello": f"{props['NAME']}"}


def main():
    # Logging
    _TIME_FORMAT = "%Y-%m-%d %H:%M:%S"
    _MESSAGE_FORMAT = "[{levelname}] [{asctime}] {message}"
    logging.basicConfig(
        level=logging.INFO, format=_MESSAGE_FORMAT, style="{", datefmt=_TIME_FORMAT, stream=sys.stdout
    )

    logging.info("starting serve on localhost:8000")
    uvicorn.run(app, host='0.0.0.0', port=8000, log_level="info")


if __name__ == '__main__':
    main()
