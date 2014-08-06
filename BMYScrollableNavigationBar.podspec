Pod::Spec.new do |s|
  s.name     = 'BMYScrollableNavigationBar'
  s.version  = '1.0.0'
  s.platform = :ios, '7.0'
  s.summary  = 'Facebook-style scrollable navigation bar as used in the Beamly iOS app.'
  s.description = "This version of the scrollable navigation bar feature is an evolution on Valentin Shergin's SherginScrollableNavigationBar. There are a few open source components for iOS but all of them suffer of different issues (included the original SherginScrollableNavigationBar) and work only with translucent or opaque navigation bars. This version aims to support both translucent and opaque navigation bars."
  s.homepage = 'https://github.com/beamly/BMYScrollableNavigationBar'
  s.author   = { 'Alberto De Bortoli' => 'alberto@beamly.com' }
  s.source   = { :git => 'https://github.com/beamly/BMYScrollableNavigationBar.git', :tag => '1.0.0' }
  s.license      = { :type => 'New BSD License', :file => 'LICENSE.md' }
  s.source_files = ['BMYScrollableNavigationBar/*.{h,m}']
  s.requires_arc = true
end
