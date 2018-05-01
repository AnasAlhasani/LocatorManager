Pod::Spec.new do |s|

  s.name          = "LocatorManager"
  s.version       = "1.0.0"
  s.summary       = "A simple locator manager wrriten in Swift."
  s.homepage      = "https://github.com/AnasAlhasani/MagicalAPIClient"
  s.license       = { :type => "MIT", :file => "LICENSE" }
  s.author        = { "Anas Alhasani" => "anasalhassni@gmail.com" }
  s.platform      = :ios, "10.0"
  s.source        = { :git => "https://github.com/AnasAlhasani/LocatorManager", :tag => "s.version" }
  s.source_files  = "LocatorManager", "LocatorManager/**/*.{h,m,swift}"

end
