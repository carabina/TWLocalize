Pod::Spec.new do |s|
  s.name                = "TWLocalize"
  s.version             = "0.0.1"
  s.summary             = "Easy Localizations for iOS written in Swift"
  s.description         = <<-DESC
                  Easy Localizations written in Swift.
                  No longer use NSLocalizedString(key:comment:) or Strings files per language.
                  DESC
  s.license             = { :type => "MIT", :file => "LICENSE" }
  s.author              = { "Tom Wolters" => "t.wolters@live.nl" }
  s.homepage            = "https://github.com/tom-wolters/TWLocalize"
  s.social_media_url    = "https://twitter.com/Tom_Wolters"
  s.platform            = :ios
  s.ios.deployment_target = '9.3'
  s.requires_arc        = true
  s.source              = { :git => "https://github.com/tom-wolters/TWLocalize.git", :tag => "#{s.version}" }
  s.source_files        = "TWLocalize/**/*.{swift}"
  s.framework           = "UIKit"

end
