FROM datacoves/ci-basic:0.4.0.202203270022-a4e4c52b
# The source code for this image is in https://gitlab.com/datacoves/datacoves/-/tree/main/src/ci

LABEL com.datacoves.ci.library.version.dbt="0.21.1"
LABEL com.datacoves.ci.library.version.dbt-coves="0.21.1a20"

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]
