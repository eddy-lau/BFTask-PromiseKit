#
# Be sure to run `pod lib lint Bolts-PromiseKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'BFTask-PromiseKit'
  s.version          = '2.0.1'
  s.summary          = 'To convert a BFTask to a Promise in the PromiseKit'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
An Objective-C extension for BFTask to convert it to a Promise in the PromiseKit.
So a BFTask also have the powerful clean dot notation syntax of PromiseKit.
                       DESC

  s.homepage         = 'https://github.com/eddy-lau/BFTask-PromiseKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Eddie Lau' => 'eddie@touchutility.com' }
  s.source           = { :git => 'https://github.com/eddy-lau/BFTask-PromiseKit.git', :tag => s.version.to_s }

  s.swift_versions = '4.0'
  s.ios.deployment_target = '8.0'
  s.source_files = 'BFTask-PromiseKit/*'

  s.dependency 'Bolts/Tasks', '~> 1.9'
  s.dependency 'PromiseKit', '~> 6.8'
end
