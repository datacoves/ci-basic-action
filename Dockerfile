FROM datacoves/ci-basic:0.4.0.202203031642-ab17c0a4
# The source code for this image is in https://gitlab.com/datacoves/datacoves/-/tree/main/src/ci

LABEL com.datacoves.ci.library.version.dbt="0.21.1"
LABEL com.datacoves.ci.library.version.dbt-coves="0.21.1a20"

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]
