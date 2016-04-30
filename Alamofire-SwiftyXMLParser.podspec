Pod::Spec.new do |s|
  s.name        = "Alamofire-SwiftyXMLParser"
  s.version     = "1.0.0-alpha1"
  s.summary     = "Alamofire extension for serialize NSData to SwiftyXMLParser"
  s.homepage    = "https://github.com/kazuhiro4949/Alamofire-SwiftyXMLParser"
  s.license     = { :type => "MIT" }
  s.authors     = { "tangplin" => "k.hayashi.info@gmail.com" }

  s.requires_arc = true
  s.ios.deployment_target = "8.0"
  s.source   = { :git => "https://github.com/kazuhiro4949/Alamofire-SwiftyXMLParser.git", :tag => s.version }
  s.source_files = "Source/*.swift"
  s.dependency 'Alamofire', '3.3.1'
  s.dependency 'SwiftyXMLParser', '1.0.0'
end
