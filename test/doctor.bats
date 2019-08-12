#!/usr/bin/env bats

load test_helper

@test "reports bin in PATH - missing" {
  run nodenv-doctor

  assert_failure
  assert_line "Checking for \`nodenv' in PATH: not found"
  assert_line "  Please refer to https://github.com/nodenv/nodenv#installation"
}

@test "reports bin in PATH - missing, despite ~/.nodenv" {
  with_nodenv_in_home

  run nodenv-doctor

  assert_failure
  assert_line "Checking for \`nodenv' in PATH: not found"
  assert_line "  You seem to have nodenv installed in \`$HOME/.nodenv/bin', but that"
}

@test "reports bin in PATH - OK" {
  with_nodenv

  run nodenv-doctor

  assert_line "Checking for \`nodenv' in PATH: $PWD/node_modules/.bin/nodenv"
}

@test "reports bin in PATH - multiple" {
  with_nodenv
  with_nodenv_in_home
  PATH="$HOME/.nodenv/bin:$PATH"

  run nodenv-doctor

  assert_failure
  assert_line "Checking for \`nodenv' in PATH: multiple"
}

@test "reports shims in PATH - missing" {
  with_nodenv

  run nodenv-doctor

  assert_failure
  assert_line "Checking for nodenv shims in PATH: not found"
}

@test "reports shims in PATH - OK" {
  with_nodenv
  with_nodenv_shims

  run nodenv-doctor

  assert_line "Checking for nodenv shims in PATH: OK"
}

@test "reports nodenv-install - missing" {
  with_nodenv

  run nodenv-doctor

  assert_failure
  assert_line "Checking \`nodenv install' support: not found"
}

@test "reports nodenv-install - OK" {
  with_nodenv
  with_nodenv_plugin nodenv-install

  run nodenv-doctor

  assert_line -p "Checking \`nodenv install' support: $NODENV_ROOT/plugins/nodenv-install/bin/nodenv-install"
}

@test "reports nodenv-install - multiple" {
  with_nodenv
  with_nodenv_plugin nodenv-install
  with_nodenv_plugin other-plugin nodenv-install

  run nodenv-doctor

  assert_failure
  assert_line "Checking \`nodenv install' support: multiple"
}

@test "reports nodes - zero" {
  with_nodenv

  run nodenv-doctor

  assert_line "Counting installed Node versions: none"
}

@test "reports nodes - some" {
  with_nodenv
  with_nodes 10.2.3 12.5.6

  run nodenv-doctor

  assert_line "Counting installed Node versions: 2 versions"
}

@test "reports plugins - OK" {
  with_nodenv

  run nodenv-doctor

  assert_line "Auditing installed plugins: OK"
}

@test "reports clean setup" {
  with_nodenv
  with_nodenv_shims
  with_nodenv_plugin nodenv-install
  with_nodes 10.2.3

  run nodenv-doctor

  assert_success
  assert_output - -e <<-OUT
Checking for \`nodenv' in PATH: $PWD/node_modules/.bin/nodenv
Checking for nodenv shims in PATH: OK
Checking \`nodenv install' support: $NODENV_ROOT/plugins/nodenv-install/bin/nodenv-install \(.*\)
Counting installed Node versions: 1 versions
Auditing installed plugins: OK
OUT
}
