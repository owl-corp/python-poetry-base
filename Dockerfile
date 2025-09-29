ARG python_version=3.14-rc-slim

FROM python:$python_version

# POETRY_VIRTUALENVS_IN_PROJECT is required to ensure in-projects venvs mounted from the host in dev
# don't get prioritised by `poetry run`
ENV POETRY_VERSION=2.2.1 \
  POETRY_HOME="/opt/poetry/home" \
  POETRY_CACHE_DIR="/opt/poetry/cache" \
  POETRY_NO_INTERACTION=1 \
  POETRY_VIRTUALENVS_IN_PROJECT=false

ENV PATH="$POETRY_HOME/bin:$PATH"

ADD https://install.python-poetry.org /tmp/poetry_install.py
RUN python /tmp/poetry_install.py && rm /tmp/poetry_install.py
