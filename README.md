# Fast `cargo install` action

This GitHub Action installs a Rust crate using precompiled signed binaries built
on GitHub and hosted as GitHub release artifacts.

## Example workflow

```yaml
name: test suite
on: [push, pull_request]

jobs:
  doc:
    name: Documentation
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: dtolnay/install@cargo-docs-rs
      - run: cargo docs-rs
```

<img src="https://github.com/user-attachments/assets/4bfecd07-dadc-4ce3-be98-d98461251da5">

## Security

Binaries are cryptographically signed and verified using [GitHub artifact
attestation] to establish the build's provenance, including the specific
workflow file and workflow run that produced the artifact.

[GitHub artifact attestation]: https://docs.github.com/en/actions/security-for-github-actions/using-artifact-attestations/using-artifact-attestations-to-establish-provenance-for-builds

## License

The scripts and documentation in this project are released under the [MIT
License].

[MIT License]: LICENSE
