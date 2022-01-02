# frozen_string_literal: true

require_relative "./exceptions"
require_relative './kanji_map'

module NumberToKanji
  module SmallNumberToKanji
    RANGE_END = 10000

    def call(number)
      raise TypeError unless number.is_a?(Integer)
      raise Exceptions::NegativeNumberError if number < 0
      raise RangeError.new('Numbers equal to or larger than 10^4 is not supported.') if number >= RANGE_END

      return KANJI_MAP[0] if number.zero?

      zero_padded_number = format('%04<number>d', number: number)
      thousands, hundreds, tens, ones = zero_padded_number.to_s.chars.map(&:to_i)

      "#{_thousands_to_kanji(thousands)}#{_hundreds_to_kanji(hundreds)}#{_tens_to_kanji(tens)}#{_ones_to_kanji(ones)}"
    end

    def _thousands_to_kanji(thousands)
      return "" if thousands.zero?
      return "千" if thousands == 1

      "#{KANJI_MAP[thousands]}千"
    end

    def _hundreds_to_kanji(hundreds)
      return "" if hundreds.zero?
      return "百" if hundreds == 1

      "#{KANJI_MAP[hundreds]}百"
    end

    def _tens_to_kanji(tens)
      return "" if tens.zero?
      return "十" if tens == 1

      "#{KANJI_MAP[tens]}十"
    end

    def _ones_to_kanji(ones)
      return "" if ones.zero?

      KANJI_MAP[ones]
    end

    module_function :call, :_thousands_to_kanji, :_hundreds_to_kanji, :_tens_to_kanji, :_ones_to_kanji
    private_class_method :_thousands_to_kanji, :_hundreds_to_kanji, :_tens_to_kanji, :_ones_to_kanji
  end
end
