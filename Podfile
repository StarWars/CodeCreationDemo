source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '15.0'

use_frameworks!
inhibit_all_warnings!

target 'CodeUICreation' do
  pod 'SnapKit'
end

# for Mac M1
post_install do |installer|
  installer.pods_project.build_configurations.each do |config|
    config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64"
  end
end
