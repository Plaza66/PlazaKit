Pod::Spec.new do |s|
s.name     = 'PlazaKit'
s.version  = '0.0.1'
s.license  = 'MIT'
s.summary  = 'Plaza Kit summary'
s.homepage = 'https://github.com/Plaza66/PlazaKit'
s.author   = { 'appdesignvault' => 'appdesignvault' }
s.source   = { :git => 'https://github.com/Plaza66/PlazaKit/tree/master/PlazaKit/PlazaKit.git' }
s.platform = :ios
s.source_files = 'src/**/*.{h,m}'
s.resources = ""
s.framework = 'UIKit'

s.requires_arc = true
end