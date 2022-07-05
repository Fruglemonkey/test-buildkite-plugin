#!/usr/bin/env bats

load 'test_helper/bats-assert/load'
load 'test_helper/bats-support/load'
load 'helpers/mocks/stub'

# Uncomment the following line to debug stub failures
# export BUILDKITE_AGENT_STUB_DEBUG=/dev/tty

@test "Spellcheck test file with known errors" {
  export BUILDKITE_PLUGIN_TEST_PATTERN="*test_file_1.md*"
  stub buildkite-agent "foo"
  run "hooks/post-command"

  assert_success
  assert_line --partial "--- :pencil: Running spellcheck..."
  assert_line --partial "froge sleeep"

  unstub buildkite-agent
}

@test "Spellcheck test file with no errors" {
  export BUILDKITE_PLUGIN_TEST_PATTERN="*test_file_2.md*"
  stub buildkite-agent "foo"
  run "hooks/post-command"

  assert_success
  assert_line --partial "--- :pencil: Running spellcheck..."
  assert_line --partial "Found no misspelled words!"

  unstub buildkite-agent
}
