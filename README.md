# LocatorManager
A simple locator manager wrriten in Swift using Closure-based Delegation.

## Example 
```swift
LocatorManager.shared.currentPosition(mode: .oneshot) { result in

    switch result {

    case .success(let value):

        print("latitude: \(value.latitude) | longitude: \(value.longitude)")

    case .failure(let error):

        print(error.description)

    }

}
```
## Installation

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate MagicalAPIClient into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
pod 'LocatorManager', :git => "https://github.com/AnasAlhasani/LocatorManager"
```

Then, run the following command:

```bash
$ pod install
```


