Pod::Spec.new do |s|
  s.name             = "OMExtension"
  s.module_name      = "OMExtension"
  s.version          = "1.1.1"
  s.summary          = "一个有用的swift扩展集合"
  s.homepage         = "https://github.com/OctMon/OMExtension"
  s.license          = {
                          :type => "MIT",
                          :file => "LICENSE"
                       }
  s.author           = { "OctMon" => "octmon@qq.com" }
  s.social_media_url = "http://www.jianshu.com/users/b9a4a97967be"
  s.platform         = :ios, "8.0"
  s.source           = {
                          :git => "https://github.com/OctMon/OMExtension.git",
                          :tag => "1.1.1"
                       }
  s.source_files     = "OMExtension/OMExtension/Source/**/*.{swift}"
  s.requires_arc     = true

  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '3.0' }
end