# frozen_string_literal: true

require_relative 'number_to_kanji/exceptions'
require_relative 'number_to_kanji/kanji_map'
require_relative 'number_to_kanji/small_number_to_kanji'
require_relative 'number_to_kanji/version'

module NumberToKanji
  RANGE_END = 1_000_000_000_000_000_000_000_000
  public_constant :RANGE_END

  def call(number)
    raise(::TypeError) unless number.is_a?(::Integer)
    raise(::NumberToKanji::Exceptions::NegativeNumberError) if number.negative?

    raise(::RangeError, 'Numbers equal to or larger than 10^24 is not supported.') if number >= ::NumberToKanji::RANGE_END

    return ::NumberToKanji::KANJI_MAP[0] if number.zero?

    # 四桁ごとに区切りつつ、位の小さい順に並んだ配列を作る。
    # 例: 123456789 => [6789, 2345, 1]
    # 例: 100006789 => [6789, 0, 1]
    separated_numbers = number.to_s.chars.reverse.each_slice(4).map(&:reverse).map(&:join).map { |i| Integer(i, 10) }

    kanji_with_unit_numbers =
      separated_numbers.map.with_index do |separated_number, index|
        _kanji_number_with_unit(separated_number, index)
      end

    kanji_with_unit_numbers.reverse.join
  end

  def _kanji_number_with_unit(number, index)
    return if number.zero?

    kanji = ::NumberToKanji::SmallNumberToKanji.call(number)
    unit = ::NumberToKanji::KANJI_UNITS[index]

    "#{kanji}#{unit}"
  end

  module_function :call, :_kanji_number_with_unit
  private_class_method :_kanji_number_with_unit
end
