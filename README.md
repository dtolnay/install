# Fast `cargo install` action

This GitHub Action installs a Rust crate using precompiled signed binaries built
on GitHub and hosted as GitHub release artifacts.

## Example workflow

```yaml
name: test suite
on: [push, pull_request]

jobs:
  expand:
    name: cargo expand
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: dtolnay/install@master
        with:
          crate: cargo-expand
      - run: cargo expand --help
```

## Inputs

| Name    | Required | Description                                  |
| ------- | :------: | -------------------------------------------- |
| `crate` | ✓        | Name of crate as published to crates.io      |
| `bin`   |          | Name of binary; default = same as crate name |

## Security considerations

Check the `.github/workflows` directory of this repo for the GitHub Actions
logic which compiles, signs, and publishes each binary.

This Action downloads both the binary executable and its signature. The
signature is verified using gpg and the public key available in
`signing-key.asc`. The corresponding private key is provided to this repo's
build jobs as a GitHub secret.

## License

The scripts and documentation in this project are released under the [MIT
License].

[MIT License]: LICENSE
