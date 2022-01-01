RSpec.describe NumberToKanji::SmallNumberToKanji do
  describe '.call' do
    context '一桁の数字' do
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
      end
    end

    context '二桁の数字' do
      specify '漢字に変換すること' do
        expect(described_class.call(10)).to eq('十')
        expect(described_class.call(11)).to eq('十一')
        expect(described_class.call(30)).to eq('三十')
        expect(described_class.call(35)).to eq('三十五')
        expect(described_class.call(99)).to eq('九十九')
      end
    end

    context '三桁の数字' do
      specify '漢字に変換すること' do
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
      end
    end

    context '四桁の数字' do
      specify '漢字に変換すること' do
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

    context '整数以外のとき' do
      specify '例外を吐くこと' do
        expect { described_class.call('1') }.to raise_error TypeError
        expect { described_class.call(1.0) }.to raise_error TypeError
        expect { described_class.call([1, 2]) }.to raise_error TypeError
      end
    end
  end
end
