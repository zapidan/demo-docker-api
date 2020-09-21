from os import path

import logging
import toml
from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def read_root():
    # load toml file
    logging.debug("Loading environment variables from file: ")
    config_file = path.join(path.dirname(__file__), "../config.toml")
    props = toml.load(config_file)
    return {"Hello": f"{props['NAME']}"}