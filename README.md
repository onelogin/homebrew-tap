# OneLogin Homebrew Tap

[Homebrew](https://brew.sh) formulae for OneLogin's command-line tools.

## Install

```sh
brew install onelogin/tap/<formula>
```

Or run `brew tap onelogin/tap` once, then `brew install <formula>`. In a `Brewfile`:

```ruby
tap "onelogin/tap"
brew "onelogin-aws-cli-assume-role"
```

## Formulae

| Formula | Command | What it does |
|---|---|---|
| [`onelogin-aws-cli-assume-role`](Formula/onelogin-aws-cli-assume-role.rb) | `onelogin-aws-cli` | Gets temporary AWS credentials by assuming an AWS role through OneLogin ([source](https://github.com/onelogin/onelogin-aws-cli-assume-role)) |

### onelogin-aws-cli-assume-role

```sh
brew install onelogin/tap/onelogin-aws-cli-assume-role
```

It reads its settings from `~/.onelogin/onelogin.sdk.properties`. See [Settings](https://github.com/onelogin/onelogin-aws-cli-assume-role#settings) for what goes in it. The file holds your OneLogin API client secret, so keep it readable only by you:

```sh
mkdir -p ~/.onelogin
touch ~/.onelogin/onelogin.sdk.properties
chmod 600 ~/.onelogin/onelogin.sdk.properties
```

Then run `onelogin-aws-cli --profile <profile name>` to save the credentials to that AWS CLI profile. `onelogin-aws-cli --help` lists every option.

The command isn't called `onelogin-aws-assume-role` because the Python version of this tool, [onelogin-python-aws-assume-role](https://github.com/onelogin/onelogin-python-aws-assume-role), already installs a command with that name through `pip`.

## Maintaining this tap

- Every pull request runs `brew test-bot` on macOS and Linux: `brew style`, `brew audit`, and the install and `test` block of each formula it changes.
- The `brew bump` workflow checks every day for a new release of each formula's project and opens a pull request that updates its `url` and `sha256`.
- To update a formula by hand, run `brew bump-formula-pr --url=<new release tarball> onelogin/tap/<formula>`, or edit `url` and `sha256` yourself and open a pull request.

Report a problem with a tool in its own repository. Report a problem with installing it here.

## License

[MIT](LICENSE). Each tool keeps its own license.
