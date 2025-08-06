# typed: true # rubocop:todo Sorbet/StrictSigil
# frozen_string_literal: true

require "bundle/formula_installer"

module Homebrew
  module Bundle
    module Checker
      class BrewChecker < Homebrew::Bundle::Checker::Base
        PACKAGE_TYPE = :brew
        PACKAGE_TYPE_NAME = "Formula"

        def installed_and_up_to_date?(formula, no_upgrade: false)
          Homebrew::Bundle::FormulaInstaller.formula_installed_and_up_to_date?(formula, no_upgrade:)
        end
      end
    end
  end
end
