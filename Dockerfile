FROM datacoves/ci-basic:0.4.0
# The source code for this image is in https://gitlab.com/datacoves/datacoves/-/tree/main/src/ci

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]
