Pod::Spec.new do |s|

  s.name         = "ftcodec"
  s.version      = "0.0.1"
  s.summary      = "video talker codec"

  s.description  = <<-DESC
  编解码库
                   DESC

  s.homepage     = "http://www.cdfortis.com/ftcodec"
  s.license      = { :type => "Copyright", :text => "Copyright 2016 Fortis Inc." }

  s.author             = { "xiachao" => "xiachao@cdfortis.com" }

  s.platform     = :ios, "7.0"

  s.source       = { :git => "http://172.20.1.210:88/r/IOS/ftcodec.git", :tag => "#{s.version}" }
  s.vendored_libraries = "libftcodec.a"

  s.source_files  = "include/ftcodec/*.h"
  s.public_header_files = "include/ftcodec/*.h"
  s.preserve_paths = "libftcodec.a"

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"


end
