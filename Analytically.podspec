#
# Be sure to run `pod lib lint Analytically.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Analytically'
  s.version          = '0.1.0'
  s.swift_version    = '5.0'
  s.summary          = 'The Analytically tool to support may providers for Analytics'

  s.homepage         = 'https://github.com/ahmedAlmasri/Analytically'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Ahmad Almasri' => 'ahmed.almasri@ymail.com' }
  s.source           = { :git => 'https://github.com/ahmedAlmasri/Analytically.git', :tag => s.version.to_s }
  
  s.ios.deployment_target = '9.0'
  s.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'}
  s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'}
  
  s.subspec 'Core' do |core|
     core.source_files = 'Analytically/Classes/**/*'
   end
  s.subspec 'Flurry' do |subspec|
      subspec.dependency "Flurry-iOS-SDK/FlurrySDK"
      subspec.dependency 'Analytically/Core'
      subspec.source_files = 'Analytically/Flurry/**/*'
      subspec.platform     = :ios, '9.0'
      subspec.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'}
      subspec.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'}
   end
  s.default_subspec = 'Core'

end
