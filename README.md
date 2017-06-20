# TWLocalize

[![Build Status](https://travis-ci.org/tom-wolters/TWLocalize.svg?branch=master)](https://travis-ci.org/tom-wolters/TWLocalize)
[![Version](https://img.shields.io/cocoapods/v/TWLocalize.svg?style=flat)](http://cocoapods.org/pods/TWLocalize)
[![License](https://img.shields.io/cocoapods/l/TWLocalize.svg?style=flat)](http://cocoapods.org/pods/TWLocalize)
[![Platform](https://img.shields.io/cocoapods/p/TWLocalize.svg?style=flat)](http://cocoapods.org/pods/TWLocalize)

TWLocalize written in Swift makes iOS localizations easy. No longer do you need to localize your app, keep multiple .string files and use NSLocalizedString.

## Usage

The framework uses a dictionary to retrieve the desired strings. Simply add your own TWLocalizedText dictionary with all the desired translated strings.

```ruby
struct MyStrings {
  static let MyText:TWLocalizedText = [.english: "This is my text", .dutch: "Dit is mijn tekst"]
}
```

```ruby
let label = UILabel()
label.setLocalized(text: MyStrings.MyText)
```

or use the localized property of MyText directly.

```ruby
label.text = Strings.MyText.localized
```

TWLocalize makes use of the current locale language. It's possible to change the language.

```ruby
TWLocalize.setLanguage(to: .dutch)
```

Reset the custom set language
```ruby
TWLocalize.setLanguage(to: nil)
```

## Installation

TWLocalize is available through [CocoaPods](http://cocoapods.org). To install it, simply add the following line to your Podfile:

```ruby
pod "TWLocalize"
```

## Author

Tom Wolters, https://twitter.com/tom_wolters

## License

TWLocalize is available under the MIT license. See the LICENSE file for more info.
