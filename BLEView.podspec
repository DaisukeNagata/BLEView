#
# Be sure to run `pod lib lint BLEView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'BLEView'
  s.version          = '0.1.0'
  s.summary          = 'It is a BLE communication library'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: It is a BLE communication library. Two devices are required.
                       DESC

  s.homepage         = 'https://github.com/daisukenagata/BLEView'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'DaisukeNagata' => 'dbank0208@gmail.com' }
  s.source           = { :git => 'https://github.com/daisukenagata/BLEView.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/dbank0208'

  s.ios.deployment_target = '10.0'

  s.source_files = 'BLEView/Classes/**/*'
  
  # s.resource_bundles = {
  #   'BLEView' => ['BLEView/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
