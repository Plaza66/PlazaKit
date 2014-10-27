Pod::Spec.new do |s|
s.name         = "PlazaKit"
s.version      = "0.0.1"
s.summary      = "PlazaKit is an Objective-C library for iOS developers."
s.homepage     = "https://github.com/Plaza66/PlazaKit"
s.license      = 'MIT (LICENSE)'
s.author       = { "test" => "test@gmail.com" }
s.source       = { :git => "https://github.com/Plaza66/PlazaKit.git"}
s.platform     = :ios, '7.0'

s.source_files = 'PlazaKit/PlazaKit/src/**/*.{h,m}'

s.frameworks = 'UIKit'
s.requires_arc = true
end