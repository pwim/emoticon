require 'test/unit'
require File.dirname(__FILE__) + '/../../test_helper'
require "emoticon/transcoder/au"


class AuTest < Test::Unit::TestCase
  def setup
    @transcoder = Emoticon::Transcoder::Au.new
  end

  def test_internal_to_external
    assert_equal "\xf6\x60", @transcoder.internal_to_external(DOCOMO_CR)
    assert_equal "\xf6\x60", @transcoder.internal_to_external(DOCOMO_UTF8)
    assert_equal "［ドコモポイント］".tosjis, @transcoder.internal_to_external(DOCOMO_DOCOMO_POINT)
    assert_equal "\xf6\x60", @transcoder.internal_to_external(AU_CR)
    assert_equal "\xf6\x60", @transcoder.internal_to_external(AU_UTF8)
    assert_equal "\xf6\x60", @transcoder.internal_to_external(SOFTBANK_CR)
    assert_equal "\xf6\x60", @transcoder.internal_to_external(SOFTBANK_UTF8)
  end
end
