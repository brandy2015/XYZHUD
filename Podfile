# Uncomment the next line to define a global platform for your project
 platform :ios, '13.0'

target 'XYZHUD' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!
  #自有库
  pod 'Localize-Swift'         #翻译各种语言
  pod 'MBProgressHUD'
  pod 'SwiftEntryKit'
end


post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
        end
    end
end
