# nodenv installer & doctor scripts

[![Tests](https://img.shields.io/github/actions/workflow/status/nodenv/nodenv-installer/test.yml?label=tests&logo=github)](https://github.com/nodenv/nodenv-installer/actions/workflows/test.yml)
[![Latest GitHub Release](https://img.shields.io/github/v/release/nodenv/nodenv-installer?label=github&logo=github&sort=semver)](https://github.com/nodenv/nodenv-installer/releases/latest)
[![Latest Homebrew Release](<https://img.shields.io/badge/dynamic/regex?label=homebrew-nodenv&logo=homebrew&logoColor=white&url=https%3A%2F%2Fraw.githubusercontent.com%2Fnodenv%2Fhomebrew-nodenv%2Frefs%2Fheads%2Fmain%2FFormula%2Fnodenv-installer.rb&search=archive%2Frefs%2Ftags%2Fv(%3F%3Cversion%3E%5Cd%2B.*).tar.gz&replace=v%24%3Cversion%3E>)](https://github.com/nodenv/homebrew-nodenv/blob/main/Formula/nodenv-installer.rb)
[![Latest npm Release](https://img.shields.io/npm/v/@nodenv/nodenv-installer?logo=npm&logoColor=white)](https://www.npmjs.com/package/@nodenv/nodenv-installer/v/latest)

<!-- toc -->

- [nodenv-installer](#nodenv-installer)
- [nodenv-doctor](#nodenv-doctor)
- [Credits](#credits)

<!-- tocstop -->

## nodenv-installer

The `nodenv-installer` script idempotently installs or updates nodenv on your
system. If Homebrew is detected, installation will proceed using `brew
install/upgrade`. Otherwise, nodenv is installed under `~/.nodenv`.

Additionally, [node-build](https://github.com/nodenv/node-build#readme) is also
installed if `nodenv install` is not already available.

with cURL:

```sh
curl -fsSL https://github.com/nodenv/nodenv-installer/raw/HEAD/bin/nodenv-installer | bash
```

with wget:

```sh
wget -q https://github.com/nodenv/nodenv-installer/raw/HEAD/bin/nodenv-installer -O- | bash
```

with npx/npm:

```sh
npx @nodenv/nodenv-installer
```

The installer script is meant for casual use on your own development machine.
For automating installation across machines it's better to _avoid_ using this
script in favor of fine-tuning nodenv & node-build installation manually. Some
environments—such as container images meant for either Node development or
production—should not be switching between multiple Node versions at all, so if
you are installing nodenv there, you are likely doing something wrong.

## nodenv-doctor

You can verify the state of your nodenv installation with:

with cURL:

```sh
curl -fsSL https://github.com/nodenv/nodenv-installer/raw/HEAD/bin/nodenv-doctor | bash
```

with wget:

```sh
wget -q https://github.com/nodenv/nodenv-installer/raw/HEAD/bin/nodenv-doctor -O- | bash
```

with npx/npm:

```sh
npx -p @nodenv/nodenv-installer nodenv-doctor
```

## Credits

Forked from [Mislav Marohnić][mislav]'s [rbenv-installer][] and modified for node.

[mislav]: https://github.com/mislav
[rbenv-installer]: https://github.com/rbenv/rbenv-installer
