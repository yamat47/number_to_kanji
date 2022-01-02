# NumberToKanji
NumberToKanji is a Ruby Gem that translates number (integer) to Japanese Kanji.
It supports numbers between 0 to 10^24 ("垓").

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'number_to_kanji'
```

And then execute:

```
$ bundle install
```

Or install it yourself as:

```
$ gem install number_to_kanji
```

## Usage
```ruby
require 'number_to_kanji'

NumberToKanji.call(123) #=> "百二十三"
NumberToKanji.call(123456) #=> "十二万三千四百五十六"
NumberToKanji.call(123456789) #=> "一億二千三百四十五万六千七百八十九"
```

## Development
To install dependencies, run:

```
bin/setup
```

To run the tests and the linters, run:

```
rake
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the NumberToKanji project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/number_to_kanji/blob/main/CODE_OF_CONDUCT.md).
