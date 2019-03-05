#
# Be sure to run `pod lib lint iGrantioSDK.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'iGrantioSDK'
  s.version          = '0.1.0'
  s.summary          = 'iGrant.io mobile SDK that can be incorporated to any third party app for android and iOS.
  
'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

s.description      = 'This contains all iGrant.io mobile SDK that can be incorporated to any third party app for android and iOS. See readme file for more info.'

  s.homepage         = 'https://github.com/rebink/iGrantioSDK'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = 'iGrant.io'
  s.source           = { :git => 'https://github.com/rebink/iGrantioSDK.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'iGrantioSDK/Classes/**/*'
  s.swift_version = '4.2'
  # s.resource_bundles = {
  #   'iGrantioSDK' => ['iGrantioSDK/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
