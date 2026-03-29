# Update License Year

[![GitHub release](https://img.shields.io/github/v/release/nivmizz7/update-license-year?style=flat-square)](https://github.com/nivmizz7/update-license-year/releases)
[![GitHub stars](https://img.shields.io/github/stars/nivmizz7/update-license-year?style=flat-square)](https://github.com/nivmizz7/update-license-year/stargazers)
[![GitHub forks](https://img.shields.io/github/forks/nivmizz7/update-license-year?style=flat-square)](https://github.com/nivmizz7/update-license-year/network)
[![License](https://img.shields.io/badge/license-MIT-green?style=flat-square)](LICENSE)
[![GitHub Actions](https://img.shields.io/badge/CI%2FCD-GitHub%20Actions-blue?style=flat-square)](https://github.com/nivmizz7/update-license-year/actions)

A simple GitHub Action to automatically update the year in your LICENSE files.

---

## Quick Start

Add this to your workflow file (`.github/workflows/update-license.yml`):

```yaml
name: Update License Year

on:
  schedule:
    - cron: '0 0 1 1 *'    # Run every January 1st
  workflow_dispatch:        # Allow manual trigger

jobs:
  update:
    runs-on: ubuntu-latest
    permissions:
      contents: write
    steps:
      - uses: actions/checkout@v4
      - uses: niv/update-license-year@v1
        with:
          token: ${{ secrets.GITHUB_TOKEN }}
```

---

## How It Works

1. Finds all LICENSE files in your repo
2. Replaces all years with the current year
3. Commits and pushes changes automatically

That's it! Super simple.

---

## Supported Files

- `LICENSE`
- `LICENSE.md`
- `LICENSE.txt`
- `COPYING`
- `COPYING.md`

---

## Example Transformations

```
Copyright (c) 2020
    ↓
Copyright (c) 2020-2026

Copyright © 2019
    ↓
Copyright © 2019-2026

Copyright (c) 2020-2024
    ↓
Copyright (c) 2020-2026

(c) 2020
    ↓
(c) 2020-2026
```

---

## License

MIT License - See [LICENSE](LICENSE)
