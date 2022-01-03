# NumberToKanji
NumberToKanji は英数字を日本語に変換する Ruby gem です。
現在は「垓」までの正の整数をサポートしています。

## インストール
Gemfile にこの行を追加してください：

```ruby
gem 'number_to_kanji'
```

次にこのコマンドを実行してください：

```
$ bundle install
```

もしくは `gem install` をして直接インストールすることもできます：

```
$ gem install number_to_kanji
```

## 使い方
```ruby
require 'number_to_kanji'

NumberToKanji.call(123) #=> "百二十三"
NumberToKanji.call(123456) #=> "十二万三千四百五十六"
NumberToKanji.call(123456789) #=> "一億二千三百四十五万六千七百八十九"
```

## 開発
開発に必要なライブラリをインストールするには、このコマンドを実行してください：

```
bin/setup
```

自動テストやリンターを実行するには、このコマンドを実行してください：

```
rake
```

## ライセンス
この gem は [MIT ライセンス](https://opensource.org/licenses/MIT) の下でオープンソースとして利用可能です。

## 行動規範
NumberToKanji に関してコードを書いたりイシューを追加したりする際は [行動規範](https://github.com/[USERNAME]/number_to_kanji/blob/main/CODE_OF_CONDUCT.md) に従ってください。
