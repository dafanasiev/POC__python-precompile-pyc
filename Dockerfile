ARG PYTHON_VERSION='NOT_SET'
FROM python:${PYTHON_VERSION} AS base

FROM base AS build
WORKDIR /app
COPY . .
RUN python -m compileall -b .
RUN find . -name "*.py" -type f -delete

FROM base AS final
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1
#TODO: owner, user, security...
COPY --from=build /app /app
ENTRYPOINT ["python3", "/app/app.pyc"]
