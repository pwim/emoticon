require File.join(File.dirname(File.dirname(__FILE__)), "transcoder", "softbank")

class Emoticon::Transcoder::Jphone < Emoticon::Transcoder::Softbank
  # +str+のなかでWebcodeのSoftBank絵文字を(+0x1000だけシフトして)Unicode数値文字参照に変換した文字列を返す。
  def external_to_unicodecr(str)
    # SoftBank Webcode
    s = str.clone
    # 連続したエスケープコードが省略されている場合は切りはなす。
    s.gsub!(/\x1b\x24(.)(.+?)\x0f/) do |match|
      a = $1
      $2.split(//).map{|x| "\x1b\x24#{a}#{x}\x0f"}.join('')
    end
    # Webcodeを変換
    s.gsub(SOFTBANK_WEBCODE_REGEXP) do |match|
      unicode = SOFTBANK_WEBCODE_TO_UNICODE[match[2,2]] + 0x1000
      unicode ? ("&#x%04x;"%unicode) : match
    end
  end
end
