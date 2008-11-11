require 'test/unit'
$:.unshift File.dirname(__FILE__) + '/../lib'

DOCOMO_CR = "&#xE63E;"
DOCOMO_UTF8 = [0xe63e].pack("U")
DOCOMO_DOCOMO_POINT = "&#xE6D5;"
AU_CR = "&#xE488;"
AU_UTF8 = [0xe488].pack("U")
SOFTBANK_CR = "&#xF04A;"
SOFTBANK_UTF8 = [0xf04a].pack("U")
