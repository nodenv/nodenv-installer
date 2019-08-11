#!/usr/bin/env bats

load test_helper

@test "reports missing bin in PATH" {
  run nodenv-doctor

  assert_failure
  assert_line "Checking for \`nodenv' in PATH: not found"
  assert_line "  Please refer to https://github.com/nodenv/nodenv#installation"
}

@test "reports missing bin in PATH despite ~/.nodenv" {
  with_nodenv_in_home

  run nodenv-doctor

  assert_failure
  assert_line "Checking for \`nodenv' in PATH: not found"
  assert_line "  You seem to have nodenv installed in \`$HOME/.nodenv/bin', but that"
}

@test "reports successful bin in PATH" {
  with_nodenv

  run nodenv-doctor

  assert_line "Checking for \`nodenv' in PATH: $PWD/node_modules/.bin/nodenv"
}

@test "reports multiple bins in PATH" {
  with_nodenv
  with_nodenv_in_home
  PATH="$HOME/.nodenv/bin:$PATH"

  run nodenv-doctor

  assert_line "Checking for \`nodenv' in PATH: multiple"
}
