# ci-basic-action

A GitHub Action to run [dbt <= 1.1.1](https://www.getdbt.com) and [dbt-coves](https://www.datacoves.com) commands in a Docker container. You can use [dbt commands](https://docs.getdbt.com/reference/dbt-commands) such as `run`, `test` and `debug`. This action captures the dbt console output for use in subsequent steps. 

## Supported versions

| Library  | Version  |
|---|---|
| dbt  | 1.1.1 |
| dbt-coves  | 1.1.1a1  |

## Usage

```yml
    - name: ci-basic-action
      uses: datacoves/ci-basic-action@master
      with:
        command: "dbt run --profiles-dir ."
      env:
        DBT_USER: ${{ secrets.DBT_USER }}
        DBT_PASSWORD: ${{ secrets.DBT_PASSWORD }}
```
### Outputs

The result of the dbt command is either `failed` or `passed` and is saved into the result output if you want to use it in a next step:

```yml
    - name: ci-basic-action
      id: dbt-run
      uses: datacoves/ci-basic-action@master
      with:
        command: "dbt run --profiles-dir ."
      env:
        DBT_USER: ${{ secrets.DBT_USER }}
        DBT_PASSWORD: ${{ secrets.DBT_PASSWORD }}
    - name: Get the result
      if: ${{ always() }}
      run: echo "${{ steps.dbt-run.outputs.result }}"
      shell: bash
```
The result output is also saved in the `DBT_RUN_STATE` environment variable. The location of the dbt console log output can be accessed via the environment variable `DBT_LOG_PATH`. See the "Suggested workflow" section on how to use these.

### General Setup

This action assumes that your dbt project is in the top-level directory of your repo, such as this [sample dbt project](https://github.com/fishtown-analytics/jaffle_shop). If your dbt project files are in a folder, you can specify it as such:

```yml
    - name: ci-basic-action
      uses: datacoves/ci-basic-action@master
      with:
        command: "dbt run --profiles-dir ."
        project_folder: "dbt_project"
      env:
        DBT_USER: ${{ secrets.DBT_USER }}
        DBT_PASSWORD: ${{ secrets.DBT_PASSWORD }}
```
**Important:** dbt projects use a `profiles.yml` file to connect to your dataset. **ci-basic-action** currently requires `.config/profiles.yml` to be in your repo unless changed using the `--profiles-dir` argument or the `DBT_PROFILES_DIR` environment variable.

## Thanks

This repo was inspired on https://github.com/mwhitaker/dbt-action. Thanks to [Michael Whitaker](https://github.com/mwhitaker).

## Suggested workflow and other tips

Here is a [sample workflow](https://github.com/mwhitaker/dbt-action-sample) that sends dbt console logs by email.

## License

[MIT](LICENSE)
