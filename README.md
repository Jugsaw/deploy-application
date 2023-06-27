# Deploy Application Through Github Action

This github action helps you deploy your application code to the Jugsaw server.

## Inputs

| Name | Is Required? | Default Value | Description |
|:----:|:------------:|:-------------:|:------------|
| `token` | **Required** |   | The token to upload your application. You can find it in your profile page after logging in https://jugsaw.co |
| `registry` | **Optional** | harbor.jugsaw.co | The host of the Jugsaw registry server. |
| `dir` | **Optional** | `.` | The relative directory to the source code of your Jugsaw application. |
| `user` | **Optional** | | The default value is inferred from your github user (or organization) name |
| `app` | **Optional** | | The default value is inferred from the repository name (or the basename of `dir` if it is set) |
| `tags` | **Optional** | | Please refer [`tags` input](https://github.com/docker/metadata-action#tags-input) to understand how to set this field. This field lets your control the tag name of built docker image. |

## Outputs

| Name | Example Value | Description |
|:----:|:-------------:|:------------|
| `appID` | `user_name/app_name@sha256:xxx` | The id of the deployed applications.|

## Example Usage

First, you need to [create a secret](https://docs.github.com/en/actions/security-guides/encrypted-secrets#creating-encrypted-secrets-for-a-repository) named `JUGSAW_TOKEN` in your repository. The value should be set to the token in your profile page after logging into https://jugsaw.co

```yaml
uses: jugsaw/deploy-application@v1
with:
  token: ${{ secrets.JUGSAW_TOKEN }}
```

## TODO

- [ ] Run local/remote tests