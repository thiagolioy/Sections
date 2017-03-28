#
# Be sure to run `pod lib lint Sections.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Sections'
  s.version          = '0.0.1'
  s.summary          = 'Sections pod creates an abstraction to work with Sections with specific needs'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Sections pod creates an abstraction to work with Sections with specific needs.
See project example for more details.
                       DESC

  s.homepage         = 'https://github.com/thiagolioy/Sections'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'thiagolioy' => 'thiago lioy' }
  s.source           = { :git => 'https://github.com/thiagolioy/Sections.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/@tplioy'

  s.ios.deployment_target = '7.0'

  s.source_files = 'Sections/Classes/**/*'

  # s.resource_bundles = {
  #   'Sections' => ['Sections/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
