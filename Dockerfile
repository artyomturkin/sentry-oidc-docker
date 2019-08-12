FROM sentry:9.1.1
RUN PSYCOPG=$(pip freeze | grep psycopg2) \
        && pip uninstall -y $PSYCOPG \
        && pip install --no-binary :all: $PSYCOPG

RUN pip install sentry-auth-oidc

# Add configuration from env variables
RUN echo 'OIDC_CLIENT_ID = env("SENTRY_OIDC_CLIENT_ID")' >> /etc/sentry/sentry.conf.py
RUN echo 'OIDC_CLIENT_SECRET = env("SENTRY_OIDC_CLIENT_SECRET")' >> /etc/sentry/sentry.conf.py
RUN echo 'OIDC_SCOPE = "openid email"' >> /etc/sentry/sentry.conf.py
RUN echo 'OIDC_DOMAIN = env("SENTRY_OIDC_DOMAIN")' >> /etc/sentry/sentry.conf.py
