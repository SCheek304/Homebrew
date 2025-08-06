---
last_review_date: "2025-06-16"
---

# Autobump

[BrewTestBot](BrewTestBot.md) automatically checks for available updates of packages that are in Homebrew's "autobump list" for official repositories. These packages should not have to be bumped (i.e versions increased) manually by a contributor. Instead, every 3 hours a GitHub Action opens a new pull request to upgrade to the latest version of a formula/cask, if needed.

## Excluding packages from autobumping

By default, all new formulae and casks from [Homebrew/core](https://github.com/Homebrew/homebrew-core) and [Homebrew/cask](https://github.com/Homebrew/homebrew-cask) repositories are autobumped. To exclude a package from being autobumped, it must:

1. have a `deprecate!` or `disable!` call
2. have a `livecheck do` block containing a `skip` call
3. has no `no_autobump!` call

There are other formula or cask-specific reasons listed in the Formula Cookbook and Cask Cookbook respectively.

To use `no_autobump!`, a reason for exclusion must be provided. We prefer use of one of the supported symbols. These can be found in the [`NO_AUTOBUMP_REASONS_LIST`](https://rubydoc.brew.sh/top-level-namespace.html#NO_AUTOBUMP_REASONS_LIST-constant).

The reasons can be specified by their symbols:

```ruby
no_autobump! because: :bumped_by_upstream
```

If none of the existing reasons fit, a custom reason can be provided as a string:

```ruby
no_autobump! because: "some unique reason"
```

If there are multiple packages with a similar custom reason, it be added to `NO_AUTOBUMP_REASONS_LIST`.
