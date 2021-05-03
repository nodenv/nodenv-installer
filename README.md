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

```sh
# with curl
curl -fsSL https://raw.githubusercontent.com/nodenv/nodenv-installer/master/bin/nodenv-installer | bash

# alternatively, with wget
wget -q https://raw.githubusercontent.com/nodenv/nodenv-installer/master/bin/nodenv-installer -O- | bash

# with npx/npm
npx @nodenv/nodenv-installer
```

## nodenv-doctor

You can verify the state of your nodenv installation with:

```sh
# with curl
curl -fsSL https://raw.githubusercontent.com/nodenv/nodenv-installer/master/bin/nodenv-doctor | bash

# alternatively, with wget
wget -q https://raw.githubusercontent.com/nodenv/nodenv-installer/master/bin/nodenv-doctor -O- | bash

# with npx/npm
npx -p @nodenv/nodenv-installer nodenv-doctor
```

## Credits

Forked from [Mislav Marohnić][mislav]'s [rbenv-installer][] and modified for node.

[mislav]: https://github.com/mislav
[rbenv-installer]: https://github.com/rbenv/rbenv-installer
