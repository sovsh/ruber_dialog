# frozen_string_literal: true

require_relative "errors"
require_relative "tokens"
require_relative "parser"

module RuberDialog
  module Parser
    # Single Character parser from string
    class CharacterParser < TokenParser
      include Parser::Tokens

      def initialize(forbidden_expressions: [], reserved_names: [])
        super(forbidden_expressions, reserved_names)
      end

      def forbidden_expression_error(expression)
        "Forbidden symbol '#{expression}'"
      end

      def reserved_name_error(name)
        "Use of reserved name (#{name}) as a character name is forbidden"
      end

      protected :forbidden_expression_error, :reserved_name_error

      def parse(content)
        raise RuberArgumentError unless content.is_a?(String)

        Character.new(content)
      end
    end
  end
end

