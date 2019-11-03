
Pod::Spec.new do |s|

  s.name         = "XYZHUD"
  s.version      = "1.0.15"
  s.summary      = "持续升级"

  s.description  = <<-DESC
                    简洁调用一些方法

                   DESC

  s.homepage     = "https://github.com/brandy2015/XYZHUD"




  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"


  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Licensing your code is important. See http://choosealicense.com for more info.
  #  CocoaPods will detect a license file if there is a named LICENSE*
  #  Popular ones are 'MIT', 'BSD' and 'Apache License, Version 2.0'.
  #

  s.license      = "MIT"

  s.swift_version = '5.0'
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '5.0' }




	
  s.ios.deployment_target = '12.0'
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author             = { "Brandy" => "" }


  s.authors            = { "Brandy" => "zhangqianbrandy2012@gmail.com" }
  s.platform     = :ios, "12.0"
  s.source       = { :git => "https://github.com/brandy2015/XYZHUD.git", :tag => "1.0.15"}
  s.source_files = "XYZHUD/Source/**/*"

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
    s.dependency 'SoHow'
    s.dependency 'XYZColor'
    s.dependency 'Localize-Swift'
    s.dependency 'XYZResponse'
  # s.social_media_url   = "http://twitter.com/Brandy"

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If this Pod runs only on iOS or OS X, then specify the platform and
  #  the deployment target. You can optionally include the target after the platform.


end
