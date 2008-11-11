Dir.glob(File.join(File.dirname(__FILE__), "emoticon", "transcoder", "*.rb")) do |file|
  require "emoticon/transcoder/#{File.basename(file, ".rb")}"
end

module Emoticon
  def self.transcoder_for_carrier(carrier)
    name = carrier.capitalize
    if Transcoder.const_defined?(name)
      Transcoder.const_get(name).new
    else
      Transcoder::Null.new
    end
  end
end
