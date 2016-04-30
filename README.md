# Alamofire-SwiftyXMLParser
Easy way to use both Alamofire and SwiftyXMLParser

# Requirements
* iOS 8.0+
* Xcode 7.0+

# Example
```swift
Alamofire.request(.GET, "http://news.yahoo.co.jp/pickup/rss.xml").responseXML { response in
   if let xml = response.result.value {
      print(xml["rss", "channel", "title"].text)
  }
}
```
