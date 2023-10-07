# Uncomment the next line to define a global platform for your project
platform :ios, '13.0'

target 'iOSEngineerCodeCheck' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for iOSEngineerCodeCheck
  # UI
  pod 'PKHUD', '~> 5.0'
  pod 'FontAwesome.swift'
  
  # Utility
  pod 'R.swift'
  pod 'LicensePlist'
  pod 'RxSwift', '6.5.0'
  pod "Apollo"
  pod "Apollo/SQLite"
  pod "Apollo/WebSocket"
end

target 'iOSEngineerCodeCheckTests' do
end

target 'iOSEngineerCodeCheckUITests' do
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
    end
  end
end
