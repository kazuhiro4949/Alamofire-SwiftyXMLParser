# Alamofire-SwiftyXMLParser
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage) ![Cocoapods compatible](https://cocoapod-badges.herokuapp.com/v/Alamofire-SwiftyXMLParser/badge.png)


Useful Extension to combine Alamofire and SwiftyXMLParser

# Requirements
* iOS 8.0+
* Swift 2.0+

# Installation
## Carthage

### 1. create Cartfile
```
github "Alamofire/Alamofire"
github "yahoojapan/SwiftyXMLParser"
github "kazuhiro4949/Alamofire-SwiftyXMLParser"
```
### 2. install
```
> carthage update
```
## CocoaPods

### 1. create Podfile
```
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!

pod 'Alamofire-SwiftyXMLParser'
```

### 2. install
```
> pod install
````

# Example

```swift
import Alamofire
import SwiftyXMLParser
import Alamofire_SwiftyXMLParser

Alamofire.request(.GET, "https://itunes.apple.com/us/rss/topgrossingapplications/limit=10/xml").responseXML { response in
   if let xml = response.result.value {
      print(xml["rss", "channel", "title"].text)
  }
}
```

# Usage
#### 1. import Alamofire, SwiftyXMLParser and Alamofire_SwiftyXMLParser
```swift
import Alamofire
import SwiftyXMLParser
import Alamofire_SwiftyXMLParser
```
#### 2. call responseXML(_:)
```swift
let request = Alamofire.request(.GET, "https://itunes.apple.com/us/rss/topgrossingapplications/limit=10/xml")

request.responseXML { response in
   if let xml = response.result.value {
      print(xml["feed", "entry", 0, "title"].text) // outputs the top title of iTunes app raning.
  }
}
```

Alamofire callbacks a parsed value with SwiftyXMLParser.

# LICENSE

Copyright (c) 2016 Kazuhiro Hayashi

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
