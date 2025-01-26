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
      - uses: dtolnay/install@master
        with:
          crate: cargo-expand
      - run: cargo expand --help
```

<img src="https://user-images.githubusercontent.com/1940490/136493915-2c3c6a6b-620c-46e1-be4b-3c96856ccd12.png">

## Inputs

| Name    | Required | Description                                  |
| ------- | :------: | -------------------------------------------- |
| `crate` | ✓        | Name of crate as published to crates.io      |
| `bin`   |          | Name of binary; default = same as crate name |

## Security

Binaries are cryptographically signed and verified using [GitHub artifact
attestation] to establish the build's provenance, including the specific
workflow file and workflow run that produced the artifact.

[GitHub artifact attestation]: https://docs.github.com/en/actions/security-for-github-actions/using-artifact-attestations/using-artifact-attestations-to-establish-provenance-for-builds

## License

The scripts and documentation in this project are released under the [MIT
License].

[MIT License]: LICENSE
