FROM datacoves/ci-basic:0.5.0.202204221257-377cb7b2
# The source code for this image is in https://gitlab.com/datacoves/datacoves/-/tree/main/src/ci

LABEL com.datacoves.ci.library.version.dbt="1.0.5"
LABEL com.datacoves.ci.library.version.dbt-coves="0.21.1a23"

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]
