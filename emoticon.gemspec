Gem::Specification.new do |s|
  s.name     = "emoticon"
  s.version  = "0.0.1"
  s.date     = "2008-11-12"
  s.summary  = "Emoticon (emoji) handling for Japanese mobile phones"
  s.email    = "paul@tokyodev.com"
  s.homepage = "http://github.com/pwim/emoticon"
  s.description = "Emoticon is a Ruby library for transcoding emoticons across different carriers for Japanese mobile phones.  It is derived from Jpmobile, a rails plugin for building mobile sites for Japanese mobiles created by Yohji Shidara"
  s.has_rdoc = false
  s.authors  = ["Paul McMahon"]
  s.files    = ["README",
                "MIT-LICENSE",
                "emoticon.gemspec",
                "lib/emoticon.rb",
                "lib/emoticon/conversion_table.rb",
                "lib/emoticon/transcoder.rb",
                "lib/emoticon/conversion_table/au.rb",
                "lib/emoticon/conversion_table/docomo.rb",
                "lib/emoticon/conversion_table/softbank.rb",
                "lib/emoticon/transcoder/au.rb",
                "lib/emoticon/transcoder/docomo.rb",
                "lib/emoticon/transcoder/jphone.rb",
                "lib/emoticon/transcoder/null.rb",
                "lib/emoticon/transcoder/softbank.rb",
                "lib/emoticon/transcoder/vodafone.rb",
                ]
  s.test_files = ["test/emoticon_test.rb",
                  "test/test_helper.rb",
                  "test/emoticon/transcoder/au_test.rb",
                  "test/emoticon/transcoder/docomo_test.rb",
                  "test/emoticon/transcoder/jphone_test.rb",
                  "test/emoticon/transcoder/softbank_test.rb",
                  "test/emoticon/transcoder/vodafone_test.rb",
                 ]
end
