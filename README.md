# Deploy Application Through Github Action

This github action helps you deploy your application code to the Jugsaw server.

## Inputs

| Name | Is Required? | Default Value | Description |
|:----:|:------------:|:-------------:|:------------|
| `token` | **Required** |   | The token to upload your application. You can find it in your profile page after logging in https://jugsaw.co |
| `registry` | **Optional** | https://harbor.jugsaw.co | The url endpoint of the Jugsaw registry server. |

## Outputs

| Name | Example Value | Description |
|:----:|:-------------:|:------------|
| `app` | `user_name/app_name@sha256:xxx` | The id of the deployed applications. An empty string is returned if an application is deployed unsuccessfully. If multiple applications are provided, the application ids are concated with `;`. |

## Example Usage

First, you need to [create a secret](https://docs.github.com/en/actions/security-guides/encrypted-secrets#creating-encrypted-secrets-for-a-repository) named `JUGSAW_TOKEN` in your repository. The value should be set to the token in your profile page after logging into https://jugsaw.co

```yaml
uses: jugsaw/deploy-application@v1
with:
  token: ${{ secrets.JUGSAW_TOKEN }}
```

## TODO

- [ ] Tagging
    Tag docker images with git tags.
- [ ] Run local tests