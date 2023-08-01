# Fast `cargo install` action

NOTE: This is a fork of https://github.com/dtolnay/install to include packages needed by Stackable. Thank you, David for the initial work on this. 

This GitHub Action installs a Rust crate using precompiled signed binaries built
on GitHub and hosted as GitHub release artifacts.

Please note that this action is meant for use by Stackable only and we do not plan on adding crates that we do not use ourselves.

Check the [releases](https://github.com/stackabletech/cargo-install-action/releases) for a list of all crates that are usable with this action.

If you need other crates fork this repository and add your own crates.

## Example workflow

```yaml
name: test suite
on: [push, pull_request]

jobs:
  expand:
    name: cargo udeps
    runs-on: ubuntu-latest
    steps:
      - uses: stackabletech/cargo-install-action@master
        with:
          crate: cargo-udeps
      - run: cargo udeps --help
```

Alternatively:
```yaml
name: test suite
on: [push, pull_request]

jobs:
  expand:
    name: cargo udeps
    runs-on: ubuntu-latest
    steps:
      - uses: stackabletech/cargo-install-action@cargo-udeps
      - run: cargo udeps --help
```


<img src="https://user-images.githubusercontent.com/1940490/136493915-2c3c6a6b-620c-46e1-be4b-3c96856ccd12.png">

## Inputs

| Name    | Required | Description                                  |
| ------- | :------: | -------------------------------------------- |
| `crate` | ✓        | Name of crate as published to crates.io      |
| `bin`   |          | Name of binary; default = same as crate name |
       
### Development

#### Getting started

You need a GPG key without a passphrase!

Here's how you can remove a passphrase from an existing key: https://superuser.com/questions/1360324/gpg-remove-passphrase

```
gpg --full-generate-key
gpg --output private.gpg --armor --export-secret-key github.com/stackabletech/cargo-install-action`
gpg --output signing-key.asc --armor --export github.com/stackabletech/cargo-install-action
```
             
Add the private key to a secret in the GitHub repository.

#### Updating

Unless you're setting up an entirely new branch, work in the main branch.
When you make changes you can later run the `scripts/rebase.sh` script with the name of a branch to update.

For example:
```bash
scripts/rebase.sh cargo-udeps
```

## License

The scripts and documentation in this project are released under the [MIT
License].

[MIT License]: LICENSE
