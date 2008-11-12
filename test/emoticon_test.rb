require File.dirname(__FILE__) + '/test_helper'
require 'emoticon'

class EmoticonTest < Test::Unit::TestCase
  def test_transcoder_for_carrier
    assert_instance_of(Emoticon::Transcoder::Docomo, Emoticon.transcoder_for_carrier("docomo"))
    assert_instance_of(Emoticon::Transcoder::Au, Emoticon.transcoder_for_carrier("au"))
    assert_instance_of(Emoticon::Transcoder::Softbank, Emoticon.transcoder_for_carrier("softbank"))
    assert_instance_of(Emoticon::Transcoder::Softbank, Emoticon.transcoder_for_carrier("vodafone"))
    assert_instance_of(Emoticon::Transcoder::Jphone, Emoticon.transcoder_for_carrier("jphone"))
    assert_instance_of(Emoticon::Transcoder::Null, Emoticon.transcoder_for_carrier("emobile"))
    assert_instance_of(Emoticon::Transcoder::Null, Emoticon.transcoder_for_carrier("willcom"))
    assert_instance_of(Emoticon::Transcoder::Null, Emoticon.transcoder_for_carrier(""))
    assert_instance_of(Emoticon::Transcoder::Null, Emoticon.transcoder_for_carrier(nil))
  end
end
