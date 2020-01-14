#
# Be sure to run `pod lib lint JDLRouter.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'JDLRouter'
  s.version          = '0.1.0'
  s.summary          = 'A short description of JDLRouter.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/zhengzhenxing/JDLRouter'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'zhengzhenxing' => 'zhengzhenxing3@jd.com' }
  s.source           = { :git => 'https://github.com/zhengzhenxing/JDLRouter.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'
  s.subspec 'router' do |ss|
    ss.source_files = 'JDLRouter/Classes/router/*'
    end
  s.subspec 'page' do |ss|
    ss.source_files = 'JDLRouter/Classes/page/*'
    end
  s.subspec 'dns' do |ss|
    ss.source_files = 'JDLRouter/Classes/dns/*'
    end
  s.subspec 'patcher' do |ss|
    ss.source_files = 'JDLRouter/Classes/patcher/*'
    end
  s.subspec 'launcher' do |ss|
    ss.source_files = 'JDLRouter/Classes/launcher/*'
    end
  s.subspec 'others' do |ss|
    ss.source_files = 'JDLRouter/Classes/others/*'
    end
  s.subspec 'exception' do |ss|
    ss.source_files = 'JDLRouter/Classes/exception/*'
    end

  # s.source_files = 'JDLRouter/Classes/**/*'
  # s.resource_bundles = {
  #   'JDLRouter' => ['JDLRouter/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
