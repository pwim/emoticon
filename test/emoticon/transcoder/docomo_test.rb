require 'test/unit'
require File.dirname(__FILE__) + '/../../test_helper'
require "emoticon/transcoder/docomo"


class DocomoTest < Test::Unit::TestCase
  def setup
    @transcoder = Emoticon::Transcoder::Docomo.instance
  end

  def test_internal_to_external
    assert_equal "\xf8\x9f", @transcoder.internal_to_external(DOCOMO_CR)
    assert_equal "\xf8\x9f", @transcoder.internal_to_external(DOCOMO_UTF8)
    assert_equal "\xf9\x79", @transcoder.internal_to_external(DOCOMO_DOCOMO_POINT)
    assert_equal "\xf8\x9f", @transcoder.internal_to_external(AU_CR)
    assert_equal "\xf8\x9f", @transcoder.internal_to_external(AU_UTF8)
    assert_equal "\xf8\x9f", @transcoder.internal_to_external(SOFTBANK_CR)
    assert_equal "\xf8\x9f", @transcoder.internal_to_external(SOFTBANK_UTF8)
  end

  def test_sjiscr_to_unicodecr
    s = @transcoder.sjiscr_to_unicodecr("<P>&#63647;</P>")
    assert_equal("<P>&#xE63E;</P>", s)
  end
end
