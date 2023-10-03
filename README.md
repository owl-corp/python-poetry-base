# python-poetry-base
A base Dockerfile with poetry pre-installed. Using this image as a base will allow you to forget about anything required to setup poetry within your Docker environment.

Simply `COPY` your pyproject & poetry lock file into your image, and `poetry install`.

virtual environments are created in `/opt/poetry/home` as to not conflict with in-project `.venv` folders that may be copied into the image if using a docker compose source code volume.

See the [examples](./examples/) folder for example usage.
