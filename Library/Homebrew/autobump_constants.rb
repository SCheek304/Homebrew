# typed: strict
# frozen_string_literal: true

NO_AUTOBUMP_REASONS_INTERNAL = T.let({
  extract_plist:  "livecheck uses `:extract_plist` strategy",
  latest_version: "`version` is set to `:latest`",
}.freeze, T::Hash[Symbol, String])

# The valid symbols for passing to `no_autobump!` in a `Formula` or `Cask`.
# @api public
NO_AUTOBUMP_REASONS_LIST = T.let({
  incompatible_version_format: "incompatible version format",
  bumped_by_upstream:          "bumped by upstream",
  requires_manual_review:      "a manual review of this package is required for inclusion in autobump",
}.merge(NO_AUTOBUMP_REASONS_INTERNAL).freeze, T::Hash[Symbol, String])
