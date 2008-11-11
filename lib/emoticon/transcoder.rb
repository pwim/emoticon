require "emoticon/conversion_table"
require 'scanf'
require "kconv"

module Emoticon
  class Transcoder
    include Emoticon::ConversionTable

    def unicodecr_to_external(str)
      str.gsub(/&#x([0-9a-f]{4});/i) do |match|
        unicode = $1.scanf("%x").first
        if conversion_table
          converted = conversion_table[unicode] # キャリア間変換
        else
          converted = unicode # 変換しない
        end

        # 携帯側エンコーディングに変換する
        case converted
        when Integer
          # 変換先がUnicodeで指定されている。つまり対応する絵文字がある。
          if sjis = UNICODE_TO_SJIS[converted]
            [sjis].pack('n')
          elsif webcode = SOFTBANK_UNICODE_TO_WEBCODE[converted-0x1000]
            "\x1b\x24#{webcode}\x0f"
          else
            # キャリア変換テーブルに指定されていたUnicodeに対応する
            # 携帯側エンコーディングが見つからない(変換テーブルの不備の可能性あり)。
            match
          end
        when String
          # 変換先がUnicodeで指定されている。
          to_sjis ? Kconv::kconv(converted, Kconv::SJIS, Kconv::UTF8) : converted
        when nil
          # 変換先が定義されていない。
          match
        end
      end
    end

    def utf8_to_unicodecr(str)
      str.gsub(UTF8_REGEXP) do |match|
        "&#x%04x;" % match.unpack('U').first
      end
    end

    def unicodecr_to_utf8(str)
      str.gsub(/&#x([0-9a-f]{4});/i) do |match|
        unicode = $1.scanf("%x").first
        if UNICODE_TO_SJIS[unicode] || SOFTBANK_UNICODE_TO_WEBCODE[unicode-0x1000]
          [unicode].pack('U')
        else
          match
        end
      end
    end

    def internal_to_external(s)
      unicodecr_to_external(utf8_to_unicodecr(s))
    end

    private

    def to_sjis
      false
    end

    def conversion_table
      nil
    end
  end
end
