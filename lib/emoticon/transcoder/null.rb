require File.join(File.dirname(File.dirname(__FILE__)), "transcoder")

class Emoticon::Transcoder::Null < Emoticon::Transcoder

  # 対応する変換メソッドが定義されていない場合は素通し
  def external_to_unicodecr(str)
    str
  end
end
