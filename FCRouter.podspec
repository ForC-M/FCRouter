
Pod::Spec.new do |s|

  s.name         = "FCRouter"
  s.version      = "0.1.1"
  s.summary      = "ForC"
  s.homepage     = "https://github.com/Heqiao1025/FCRouter.git"
  s.license      = {
    :type => 'MIT',
    :file => 'LICENSE'
  }
  s.author       = { "ForC" => "heqiao.china@gmail.com" }
  s.source       = { :git => "https://github.com/Heqiao1025/FCRouter.git", :tag => "#{s.version}" }
  s.frameworks   = 'UIKit', 'Foundation'
  s.requires_arc = true
  s.ios.deployment_target = '9.0'
  s.source_files = 'FCRouter/FCRouter.{h,m}'
  
end
