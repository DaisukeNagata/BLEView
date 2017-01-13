# BLEView

[![CI Status](http://img.shields.io/travis/永田大祐/BLEView.svg?style=flat)](https://travis-ci.org/永田大祐/BLEView)
[![Version](https://img.shields.io/cocoapods/v/BLEView.svg?style=flat)](http://cocoapods.org/pods/BLEView)
[![License](https://img.shields.io/cocoapods/l/BLEView.svg?style=flat)](http://cocoapods.org/pods/BLEView)
[![Platform](https://img.shields.io/cocoapods/p/BLEView.svg?style=flat)](http://cocoapods.org/pods/BLEView)

初回起動で同じアプリケーションを持った端末があれば、接続できます。
文字列を入力して、改行を押すと接続した端末に入力した文字列が音声で流れます。
文字を入力すると電波の強度を表します。端末が離れるて、強度が弱くなることに値が増加します。
空文字を入力すると再度電波強度を取得します。
If you have a terminal with the same application on first launch, you can connect.
When you enter a character string and press line feed, the character string entered to the connected terminal flows by voice.
When you enter a letter, it represents the strength of the radio waves. As the terminal leaves, the value increases because the strength becomes weak.
When you enter empty characters, you will get the explosion strength.

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

BLEView is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "BLEView"
```

## Author

DaisukeNagata dbank0208@gmail.com

## License
If you want to use, please give me a star.
BLEView is available under the MIT license. See the LICENSE file for more info.
