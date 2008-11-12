require File.join(File.dirname(File.dirname(__FILE__)), "transcoder")

class Emoticon::Transcoder::Docomo < Emoticon::Transcoder

  # +str+ のなかでDoCoMo絵文字をUnicode数値文字参照に置換した文字列を返す。
  def external_to_unicodecr(str)
    str.gsub(SJIS_REGEXP) do |match|
      sjis = match.unpack('n').first
      unicode = SJIS_TO_UNICODE[sjis]
      unicode ? ("&#x%04x;"%unicode) : match
    end
  end

  def sjiscr_to_unicodecr(s)
    s.gsub(/&#([0-9]{5});/i) do |match|
      unicode = DOCOMO_SJIS_TO_UNICODE[$1.to_i].to_s(16).upcase
      "&#x#{unicode};"
    end
  end

  private

  def to_sjis
    true
  end

  def conversion_table
    CONVERSION_TABLE_TO_DOCOMO
  end
end
