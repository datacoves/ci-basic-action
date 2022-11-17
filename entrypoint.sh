#!/bin/bash

set -o pipefail

echo "dbt project folder set as: \"${INPUT_DBT_PROJECT_FOLDER}\""
cd ${INPUT_DBT_PROJECT_FOLDER}

DBT_LOG_FILE=${DBT_LOG_FILE:="dbt_console_output.txt"}
DBT_LOG_PATH="${INPUT_DBT_PROJECT_FOLDER}/${DBT_LOG_FILE}"
echo "DBT_LOG_PATH=${DBT_LOG_PATH}" >>$GITHUB_ENV
echo "saving console output in \"${DBT_LOG_PATH}\""
eval $1 2>&1 | tee "${DBT_LOG_FILE}"

if [ $? -eq 0 ]; then
  echo "DBT_RUN_STATE=passed" >>$GITHUB_ENV
  echo "{result}={passed}" >>$GITHUB_OUTPUT
  echo "DBT run OK" >>"${DBT_LOG_FILE}"
else
  echo "DBT_RUN_STATE=failed" >>$GITHUB_ENV
  echo "{result}={failed}" >>$GITHUB_OUTPUT
  echo "DBT run failed" >>"${DBT_LOG_FILE}"
  exit 1
fi
