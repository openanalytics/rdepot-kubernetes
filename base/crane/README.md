# Crane Standalone

This base deploys [Crane Server](https://crane.rdepot.io). If you are looking to deploy crane together with the repository API, use the [repo-crane overlay](../../overlays/repo-crane/) instead.

Crane can serve artifacts authenticated under OAuth2. This includes, but is not limited to, R package repositories.

Read more: https://crane.rdepot.io/latest/docs/server/#configuration

## Dependencies

* OAuth2/OpenID Connect server (Identity Provider)
* Secret named `crane-client-creds` with keys `client-id` and `client-secret`

