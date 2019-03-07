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
  s.summary          = 'will add'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = "Will be adding soon...................................."

  s.homepage         = 'https://github.com/L3-iGrant/mobileSDK-iOS'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = 'iGrant.io'
  s.source           = { :git => 'https://github.com/L3-iGrant/mobileSDK-iOS.git', :tag => s.version.to_s }

s.ios.deployment_target = '10.0'

s.source_files = 'iGrantioSDK/Classes/**/*'
s.swift_version = '4.2'
s.resource_bundles = {
#'iGrantFramework' => ['iGrantFramework/Assets/**/*.png'],
'PopView' => ['iGrantioSDK/Classes/iGrantFiles/Organisation/PopOverView.xib'],
'iGrant' => ['iGrantioSDK/Classes/iGrantFiles/iGrant.storyboard']
}
#  s.resources = 'iGrantioSDK/Classes/iGrantFiles/iGrantAssets.xcassets/checked.imageset/checked@2x.png'

# s.public_header_files = 'Pod/Classes/**/*.h'
s.frameworks = 'UIKit' , 'SafariServices'
s.dependency 'Alamofire'
s.dependency 'SwiftyJSON'
s.dependency 'MBProgressHUD'
s.dependency 'SkyFloatingLabelTextField', '~> 3.0'
s.dependency 'IQKeyboardManagerSwift'
s.dependency "ExpandableLabel"
s.dependency "Popover"
s.dependency 'Toast-Swift'

end
