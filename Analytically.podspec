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
  s.summary          = 'A short description of Analytically.'
  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/ahmedAlmasri/Analytically'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Ahmad Almasri' => 'ahmed.almasri@ymail.com' }
  s.source           = { :git => 'https://github.com/ahmedAlmasri/Analytically.git', :tag => s.version.to_s }
  
  s.ios.deployment_target = '9.0'
  
  s.subspec 'Core' do |core|
     core.source_files = 'Analytically/Classes/**/*'
   end
  s.subspec 'Flurry' do |subspec|
      subspec.platform     = :ios, '9.0'
      subspec.source_files = 'Analytically/Classes/Flurry/*'
      subspec.dependency 'Analytically/Core'
      subspec.dependency "Flurry-iOS-SDK/FlurrySDK"
   end
  s.default_subspec = 'Core'

end
