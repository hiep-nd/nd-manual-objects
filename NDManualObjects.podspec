Pod::Spec.new do |s|
  s.name         = "NDManualObjects"
  s.version      = "0.0.8.1"
  s.summary      = "Support create object by code instead of IB."
  s.description  = <<-DESC
  NDManualObjects is a small framework that support create object by code instead of IB.
                   DESC
  s.homepage     = "https://github.com/hiep-nd/nd-manual-objects.git"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Nguyen Duc Hiep" => "hiep.nd@gmail.com" }
  s.ios.deployment_target = '9.0'
#  s.tvos.deployment_target = '9.0'
  s.swift_versions = ['4.0', '5.1', '5.2']
  s.requires_arc   = true
  #s.source        = { :http => 'file:' + URI.escape(__dir__) + '/' }
  s.source       = { :git => "https://github.com/hiep-nd/nd-manual-objects.git", :tag => "Pod-#{s.version}" }

  s.subspec 'Core' do |ss|
    ss.source_files  = "Sources/Core/*.{h,m,mm,swift}"

    ss.framework = 'Foundation'
  end

  s.subspec 'Abstracts' do |ss|
    ss.source_files  = "Sources/Abstracts/*.{h,m,mm,swift}"

    ss.framework = 'Foundation'

    ss.dependency 'NDManualObjects/Core'
  end

  s.subspec 'Objects' do |ss|
    ss.source_files  = "Sources/Objects/*.{h,m,mm,swift}"

    ss.framework = 'Foundation', 'UIKit'

    ss.dependency 'NDManualObjects/Abstracts'

    s.dependency 'NDLog/ObjC', '~> 0.0.6'
    s.dependency 'NDUtils/objc', '~> 0.0.5'
  end

  s.subspec 'ObjC' do |ss|
    ss.dependency 'NDManualObjects/Core'
    ss.dependency 'NDManualObjects/Abstracts'
    ss.dependency 'NDManualObjects/Objects'
  end

  s.subspec 'Swift' do |ss|
#    ss.source_files  = "Sources/Swift/*.{h,m,mm,swift}"
    ss.dependency 'NDManualObjects/ObjC'
  end

  s.default_subspec = 'Swift'
end
