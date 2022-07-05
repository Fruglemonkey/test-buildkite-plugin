# test-buildkite-plugin
---

Simple spellchecking plugin to test buildkite plugin capability.

## Example

```yml
steps:
  - command: ls
    plugins:
      - fruglemonkey/test#v0.4:
          pattern: '*.md'
```

## Tests

Clone the repo, and fetch all submodules via `git submodule update --init --recursive`.

Then run `test/bats/bin/bats test/post-command.bats` in the repo root directory.
