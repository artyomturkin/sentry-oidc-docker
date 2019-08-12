FROM sentry:9.1.2
RUN PSYCOPG=$(pip freeze | grep psycopg2) \
        && pip uninstall -y $PSYCOPG \
        && pip install --no-binary :all: $PSYCOPG

RUN pip install sentry-auth-oidc

COPY ./sentry.conf.py /etc/sentry/sentry.conf.py
