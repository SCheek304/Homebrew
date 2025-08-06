# typed: true # rubocop:todo Sorbet/StrictSigil
# frozen_string_literal: true

module Homebrew
  module Bundle
    module Lister
      def self.list(entries, formulae:, casks:, taps:, mas:, whalebrew:, vscode:)
        entries.each do |entry|
          puts entry.name if show?(entry.type, formulae:, casks:, taps:, mas:, whalebrew:, vscode:)
        end
      end

      private_class_method def self.show?(type, formulae:, casks:, taps:, mas:, whalebrew:, vscode:)
        return true if formulae && type == :brew
        return true if casks && type == :cask
        return true if taps && type == :tap
        return true if mas && type == :mas
        return true if whalebrew && type == :whalebrew
        return true if vscode && type == :vscode

        false
      end
    end
  end
end
