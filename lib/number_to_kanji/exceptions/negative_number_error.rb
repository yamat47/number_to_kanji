# frozen_string_literal: true

module NumberToKanji
  module Exceptions
    class NegativeNumberError < ArgumentError
      def initialize(msg = 'Negative number is not supported.')
        super
      end
    end
  end
end
