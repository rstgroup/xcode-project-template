source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '10.0'

use_frameworks!

# ignore all warnings from all pods
inhibit_all_warnings!

target '{{cookiecutter.app_name}}' do

    pod 'Fabric'
    pod 'Crashlytics'

    pod 'Device', '~> 2.0.0'
    pod 'Kingfisher', '~> 2.0.0'
    pod 'SwiftDate', '~>4.1'
    pod 'RxSwift', '~>3.0'
    pod 'RxAlamofire', '~>3.0'

    target '{{cookiecutter.app_name}}' do
        inherit! :search_paths
    end
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['EXPANDED_CODE_SIGN_IDENTITY'] = ""
      config.build_settings['CODE_SIGNING_REQUIRED'] = "NO"
      config.build_settings['CODE_SIGNING_ALLOWED'] = "NO"
    end
  end
end