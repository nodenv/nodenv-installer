# nodenv installer & doctor scripts

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

with curl:

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

with curl:

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
