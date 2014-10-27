Pod::Spec.new do |s|
s.name         = 'PlazaKit'
s.version      = '0.0.1'
s.summary      = 'PlazaKit is an Objective-C library for iOS developers.'
s.homepage     = 'https://github.com/Plaza66/PlazaKit'
s.license = { :type => 'MIT', :file => 'LICENSE' }
s.author       = { "PlazaKit" => "plazaKit@gmail.com" }
s.source       = { :git => 'https://github.com/Plaza66/PlazaKit.git',:tag => '0.0.1'}
s.platform     = :ios, '7.0'

s.source_files = 'PlazaKit/PlazaKit/src/**/*.{h,m}'

s.frameworks = 'UIKit'
s.requires_arc = true
end