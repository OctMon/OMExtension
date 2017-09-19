Pod::Spec.new do |s|
  s.name             = "OMExtension"
  s.module_name      = "OMExtension"
  s.version          = "2.2"
  s.summary          = "一个有用的swift扩展集合"
  s.homepage         = "https://github.com/OctMon/OMExtension"
  s.license          = {
                          :type => "MIT",
                          :file => "LICENSE"
                       }
  s.author           = { "OctMon" => "octmon@qq.com" }
  s.social_media_url = "http://www.jianshu.com/users/b9a4a97967be"
  s.source           = {
                          :git => "https://github.com/OctMon/OMExtension.git",
                          :tag => "2.2"
                       }
  s.source_files     = "OMExtension/OMExtension/Source/**/*.{swift}"
  s.requires_arc     = true

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.10'
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = '2.0'

  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '3.0' }
end