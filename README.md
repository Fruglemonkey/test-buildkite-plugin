# test-buildkite-plugin
---

Simple spellchecking plugin to test buildkite plugin capability.

## Example

```yml
steps:
  - command: ls
    plugins:
      - fruglemonkey/test#0.1:
          pattern: '*.md'
```
