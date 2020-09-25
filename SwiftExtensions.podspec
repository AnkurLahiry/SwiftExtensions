#
# Be sure to run `pod lib lint SwiftExtensions.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SwiftExtensions'
  s.version          = '0.1.0'
  s.summary          = 'A collection of Swift Extensions that we use in our daily developments.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = "When we strat iOS developing or working on a project, we use extenisons in our projects. We search in StackOverflow, probably find the answer and paste it to the Project. So here is a collection of Swift Extensions that will boost up the development and will work all in one type."

  s.homepage         = 'https://github.com/AnkurLahiry/SwiftExtensions'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Ankur Lahiry' => 'alahiry098@gmail.com' }
  s.source           = { :git => 'https://github.com/AnkurLahiry/SwiftExtensions.git', :tag => s.version.to_s }
  s.social_media_url = 'https://www.linkedin.com/in/ankurlahiry'

  s.swift_version = '4.0'
  s.ios.deployment_target = '11.0'

  s.source_files = 'SwiftExtensions/**/*'
  
  # s.resource_bundles = {
  #   'SwiftExtensions' => ['SwiftExtensions/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
