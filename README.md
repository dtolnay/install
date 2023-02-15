# Fast `cargo install` action

This GitHub Action installs a Rust crate using precompiled signed binaries built
on GitHub and hosted as GitHub release artifacts.

Please note that this action is meant for my own personal use and I would prefer not to add crates to this repo that I don't use myself.

Check the [releases](https://github.com/dtolnay/install/releases) for a list of all crates that are usable with this action.
If you need other crates, [fork this repository](https://github.com/dtolnay/install/issues/1#issuecomment-1170097812) and add your own crates.

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

## License

The scripts and documentation in this project are released under the [MIT
License].

[MIT License]: LICENSE
