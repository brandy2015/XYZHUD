
Pod::Spec.new do |s|

  s.name         = "XYZHUD"
  s.version      = "1.1.7"
  s.summary      = "持续升级"

  s.description  = <<-DESC
                    简洁调用一些方法

                   DESC

  s.homepage     = "https://github.com/brandy2015/XYZHUD"

  s.license      = "MIT"

  s.swift_version = '5.0'
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '5.0' }
  
  s.ios.deployment_target = '13.0'
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author             = { "Brandy" => "" }


  s.authors            = { "Brandy" => "zhangqianbrandy2012@gmail.com" }
  s.platform     = :ios, "13.0"
  s.source       = { :git => "https://github.com/brandy2015/XYZHUD.git", :tag => "1.1.7"}
  s.source_files = "XYZHUD/Source/**/*","XYZHUD/ARSLineProgress_Source/**/*"

#"XYZHUD/Source/*","XYZHUD/Source/PopupWindow/*","XYZHUD/PopupWindow/Extensions/*","XYZHUD/Source/Custom/*","XYZHUD/Source/Custom/**/*"
#"XYZHUD/**/*.{h,m}
#s.resources = "ADVProgressBar/Resources/*.png"



    s.resource_bundles = {
        'XYZHUD' => ['XYZHUD/Assets/*.{png,xib}','XYZHUD/Source/Custom/Popup/*.xib','XYZHUD/*.xcassets'],
    }
#s.resources = "XYZHUD/Source/XYZHUDPic.bundle"



#s.resource_bundles = {
#'{podName}' => ['{podName}/Classes/*.xib']
 
    s.dependency 'MBProgressHUD'
    s.dependency 'Localize-Swift'
    s.dependency 'SwiftEntryKit'
   
    
  # s.social_media_url   = "http://twitter.com/Brandy"

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If this Pod runs only on iOS or OS X, then specify the platform and
  #  the deployment target. You can optionally include the target after the platform.


end
