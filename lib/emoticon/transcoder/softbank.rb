require File.join(File.dirname(File.dirname(__FILE__)), "transcoder")

class Emoticon::Transcoder::Softbank < Emoticon::Transcoder

  # +str+ のなかでDoCoMo絵文字をUnicode数値文字参照に置換した文字列を返す。
  def external_to_unicodecr(str)
    # SoftBank Unicode
    str.gsub(SOFTBANK_UNICODE_REGEXP) do |match|
      unicode = match.unpack('U').first
      "&#x%04x;" % (unicode+0x1000)
    end
  end

  private

  def conversion_table
    CONVERSION_TABLE_TO_SOFTBANK
  end
end
