# qobulovasror/homebrew-tap

Homebrew formulas for my command-line tools.

```sh
brew install qobulovasror/tap/mdvw        # terminal viewer for Markdown, Org, AsciiDoc, RST
brew install qobulovasror/tap/bashlings   # interactive Bash exercises (Uzbek)
```

Or tap once and install by name:

```sh
brew tap qobulovasror/tap
brew install mdvw bashlings
```

| Formula | Project |
|---|---|
| `mdvw` | [qobulovasror/markdown-viewer](https://github.com/qobulovasror/markdown-viewer) |
| `bashlings` | [qobulovasror/bashlings](https://github.com/qobulovasror/bashlings) |

## Updating a formula

After a new release, set `version` in `Formula/<name>.rb` and replace each `sha256` with the value
from the release's checksum files (`SHA256SUMS` for mdvw, `<asset>.sha256` for bashlings).
Then run `brew audit --strict <name>` and `brew test <name>`.
