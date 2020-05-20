Pod::Spec.new do |spec|
spec.name         = "NDManualObject"
  spec.version      = "0.0.1"
  spec.summary      = "Support create object by code instead of IB."
  spec.description  = <<-DESC
  NDManualObject is a small framework that support create object by code instead of IB.
                   DESC
  spec.homepage     = "https://github.com/hiep-nd/nd-manual-object.git"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author             = { "Nguyen Duc Hiep" => "hiep.nd@gmail.com" }
  spec.ios.deployment_target = '9.0'
  spec.tvos.deployment_target = '9.0'
  spec.swift_versions = ['4.0', '5.1', '5.2']
  #spec.source        = { :http => 'file:' + URI.escape(__dir__) + '/' }
  spec.source       = { :git => "https://github.com/hiep-nd/nd-manual-object.git", :tag => "Pod-#{spec.version}" }
  spec.source_files  = "NDManualObject/**/*.{h,m,mm,swift}"
  spec.public_header_files = "NDManualObject/**/*.h"
  spec.header_mappings_dir = 'NDManualObject'
end
