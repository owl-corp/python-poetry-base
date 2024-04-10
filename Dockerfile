ARG python_version=3-slim

FROM python:$python_version

# POETRY_VIRTUALENVS_IN_PROJECT is required to ensure in-projects venvs mounted from the host in dev
# don't get prioritised by `poetry run`
ENV POETRY_VERSION=1.8.2 \
  POETRY_HOME="/opt/poetry/home" \
  POETRY_CACHE_DIR="/opt/poetry/cache" \
  POETRY_NO_INTERACTION=1 \
  POETRY_VIRTUALENVS_IN_PROJECT=false

ENV PATH="$POETRY_HOME/bin:$PATH"

RUN apt-get update \
  && apt-get -y upgrade \
  && apt-get install --no-install-recommends -y curl \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN curl -sSL https://install.python-poetry.org | python
