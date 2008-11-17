require 'test/unit'
require File.dirname(__FILE__) + '/../../test_helper'
require "emoticon/transcoder/vodafone"


class VodafoneTest < Test::Unit::TestCase
  def setup
    @transcoder = Emoticon::Transcoder::Vodafone.instance
  end

  def test_internal_to_external
    assert_equal "\e$Gj\x0f", @transcoder.internal_to_external(DOCOMO_CR)
    assert_equal "\e$Gj\x0f", @transcoder.internal_to_external(DOCOMO_UTF8)
    assert_equal "\e$EO\017", @transcoder.internal_to_external(DOCOMO_DOCOMO_POINT)
    assert_equal "\e$Gj\x0f", @transcoder.internal_to_external(AU_CR)
    assert_equal "\e$Gj\x0f", @transcoder.internal_to_external(AU_UTF8)
    assert_equal "\e$Gj\x0f", @transcoder.internal_to_external(SOFTBANK_CR)
    assert_equal "\e$Gj\x0f", @transcoder.internal_to_external(SOFTBANK_UTF8)
  end
end
