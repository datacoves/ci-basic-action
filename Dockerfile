FROM datacoves/ci-basic:0.5.0.202204211216-4e7b22e0
# The source code for this image is in https://gitlab.com/datacoves/datacoves/-/tree/main/src/ci

LABEL com.datacoves.ci.library.version.dbt="0.21.1"
LABEL com.datacoves.ci.library.version.dbt-coves="0.21.1a22"

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]
