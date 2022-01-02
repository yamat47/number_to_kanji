RSpec.describe NumberToKanji do
  describe '.call' do
    context '四桁以下の数字' do
      specify '漢字に変換すること' do
        expect(described_class.call(0)).to eq('〇')
        expect(described_class.call(1)).to eq('一')
        expect(described_class.call(2)).to eq('二')
        expect(described_class.call(3)).to eq('三')
        expect(described_class.call(4)).to eq('四')
        expect(described_class.call(5)).to eq('五')
        expect(described_class.call(6)).to eq('六')
        expect(described_class.call(7)).to eq('七')
        expect(described_class.call(8)).to eq('八')
        expect(described_class.call(9)).to eq('九')
        expect(described_class.call(10)).to eq('十')
        expect(described_class.call(11)).to eq('十一')
        expect(described_class.call(30)).to eq('三十')
        expect(described_class.call(35)).to eq('三十五')
        expect(described_class.call(99)).to eq('九十九')
        expect(described_class.call(100)).to eq('百')
        expect(described_class.call(101)).to eq('百一')
        expect(described_class.call(110)).to eq('百十')
        expect(described_class.call(111)).to eq('百十一')
        expect(described_class.call(120)).to eq('百二十')
        expect(described_class.call(120)).to eq('百二十')
        expect(described_class.call(199)).to eq('百九十九')
        expect(described_class.call(200)).to eq('二百')
        expect(described_class.call(201)).to eq('二百一')
        expect(described_class.call(210)).to eq('二百十')
        expect(described_class.call(211)).to eq('二百十一')
        expect(described_class.call(220)).to eq('二百二十')
        expect(described_class.call(221)).to eq('二百二十一')
        expect(described_class.call(999)).to eq('九百九十九')
        expect(described_class.call(1000)).to eq('千')
        expect(described_class.call(1001)).to eq('千一')
        expect(described_class.call(1010)).to eq('千十')
        expect(described_class.call(1011)).to eq('千十一')
        expect(described_class.call(1020)).to eq('千二十')
        expect(described_class.call(1021)).to eq('千二十一')
        expect(described_class.call(1100)).to eq('千百')
        expect(described_class.call(1101)).to eq('千百一')
        expect(described_class.call(1110)).to eq('千百十')
        expect(described_class.call(1120)).to eq('千百二十')
        expect(described_class.call(1121)).to eq('千百二十一')
        expect(described_class.call(2000)).to eq('二千')
        expect(described_class.call(2001)).to eq('二千一')
        expect(described_class.call(2010)).to eq('二千十')
        expect(described_class.call(2011)).to eq('二千十一')
        expect(described_class.call(2020)).to eq('二千二十')
        expect(described_class.call(2021)).to eq('二千二十一')
        expect(described_class.call(2100)).to eq('二千百')
        expect(described_class.call(2101)).to eq('二千百一')
        expect(described_class.call(2110)).to eq('二千百十')
        expect(described_class.call(2120)).to eq('二千百二十')
        expect(described_class.call(2121)).to eq('二千百二十一')
      end
    end

    context '五桁以上の数字' do
      specify '漢字に変換すること' do
        expect(described_class.call(10000)).to eq('一万')
        expect(described_class.call(100000)).to eq('十万')
        expect(described_class.call(1000000)).to eq('百万')
        expect(described_class.call(10000000)).to eq('千万')
        expect(described_class.call(100000000)).to eq('一億')
        expect(described_class.call(1000000000)).to eq('十億')
        expect(described_class.call(10000000000)).to eq('百億')
        expect(described_class.call(100000000000)).to eq('千億')
        expect(described_class.call(1000000000000)).to eq('一兆')
        expect(described_class.call(10000000000000)).to eq('十兆')
        expect(described_class.call(100000000000000)).to eq('百兆')
        expect(described_class.call(1000000000000000)).to eq('千兆')
        expect(described_class.call(10000000000000000)).to eq('一京')
        expect(described_class.call(100000000000000000)).to eq('十京')
        expect(described_class.call(1000000000000000000)).to eq('百京')
        expect(described_class.call(10000000000000000000)).to eq('千京')
        expect(described_class.call(100000000000000000000)).to eq('一垓')
        expect(described_class.call(1000000000000000000000)).to eq('十垓')
        expect(described_class.call(10000000000000000000000)).to eq('百垓')
        expect(described_class.call(100000000000000000000000)).to eq('千垓')

        expect(described_class.call(10001)).to eq('一万一')
        expect(described_class.call(10010)).to eq('一万十')
        expect(described_class.call(23456)).to eq('二万三千四百五十六')
        expect(described_class.call(45002)).to eq('四万五千二')
        expect(described_class.call(145002)).to eq('十四万五千二')
        expect(described_class.call(847364)).to eq('八十四万七千三百六十四')
        expect(described_class.call(9876543)).to eq('九百八十七万六千五百四十三')

        expect(described_class.call(12345678)).to eq('千二百三十四万五千六百七十八')
        expect(described_class.call(1234567890)).to eq('十二億三千四百五十六万七千八百九十')
        expect(described_class.call(123456789012)).to eq('千二百三十四億五千六百七十八万九千十二')
        expect(described_class.call(12345678901234)).to eq('十二兆三千四百五十六億七千八百九十万千二百三十四')
        expect(described_class.call(1234567890123456)).to eq('千二百三十四兆五千六百七十八億九千十二万三千四百五十六')
        expect(described_class.call(123456789012345678)).to eq('十二京三千四百五十六兆七千八百九十億千二百三十四万五千六百七十八')
        expect(described_class.call(12345678901234567890)).to eq('千二百三十四京五千六百七十八兆九千十二億三千四百五十六万七千八百九十')
        expect(described_class.call(1234567890123456789012)).to eq('十二垓三千四百五十六京七千八百九十兆千二百三十四億五千六百七十八万九千十二')
        expect(described_class.call(123456789012345678901234)).to eq('千二百三十四垓五千六百七十八京九千十二兆三千四百五十六億七千八百九十万千二百三十四')

        expect(described_class.call(900000009)).to eq('九億九')
        expect(described_class.call(90000000009)).to eq('九百億九')
        expect(described_class.call(9000000000009)).to eq('九兆九')
        expect(described_class.call(900000000000009)).to eq('九百兆九')
        expect(described_class.call(90000000000000009)).to eq('九京九')
        expect(described_class.call(9000000000000000009)).to eq('九百京九')
        expect(described_class.call(900000000000000000009)).to eq('九垓九')
        expect(described_class.call(90000000000000000000009)).to eq('九百垓九')
      end
    end

    context '整数以外のとき' do
      specify '例外を吐くこと' do
        expect { described_class.call('1') }.to raise_error TypeError
        expect { described_class.call(1.0) }.to raise_error TypeError
        expect { described_class.call([1, 2]) }.to raise_error TypeError
      end
    end
  end
end
