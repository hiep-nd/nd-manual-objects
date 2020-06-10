Pod::Spec.new do |s|
  s.name         = "NDManualObjects"
  s.version      = "0.0.3"
  s.summary      = "Support create object by code instead of IB."
  s.description  = <<-DESC
  NDManualObjects is a small framework that support create object by code instead of IB.
                   DESC
  s.homepage     = "https://github.com/hiep-nd/nd-manual-objects.git"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Nguyen Duc Hiep" => "hiep.nd@gmail.com" }
  s.ios.deployment_target = '9.0'
  s.tvos.deployment_target = '9.0'
  s.swift_versions = ['4.0', '5.1', '5.2']
  s.requires_arc   = true
  #s.source        = { :http => 'file:' + URI.escape(__dir__) + '/' }
  s.source       = { :git => "https://github.com/hiep-nd/nd-manual-objects.git", :tag => "Pod-#{s.version}" }
  s.source_files  = "NDManualObjects/**/*.{h,m,mm}"
  s.public_header_files = 'NDManualObjects/**/*.h'
  s.header_mappings_dir = 'NDManualObjects'
  s.framework = 'Foundation', 'UIKit'
end
