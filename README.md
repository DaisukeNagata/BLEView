# BLEView

[![CI Status](http://img.shields.io/travis/永田大祐/BLEView.svg?style=flat)](https://travis-ci.org/永田大祐/BLEView)
[![Version](https://img.shields.io/cocoapods/v/BLEView.svg?style=flat)](http://cocoapods.org/pods/BLEView)
[![License](https://img.shields.io/cocoapods/l/BLEView.svg?style=flat)](http://cocoapods.org/pods/BLEView)
[![Platform](https://img.shields.io/cocoapods/p/BLEView.svg?style=flat)](http://cocoapods.org/pods/BLEView)

初回起動で同じアプリケーションを持った端末と通信接続できます。
文字列を入力して、改行を押すと接続した端末に入力した文字列が音声で流れます。
文字を入力すると電波の強度を表します。端末が離れると、強度が弱くなることに値が増加します。
空文字を入力すると再度電波強度を取得します。画面をタップすると、電波強度のみ取得します。
Collection_BLEのブランチは、iphone端末専用で、グラフを端末毎に電波強度を描画表示できます。
例えばipad用の電波強度グラフ、iphone用電波強度グラフで確認ができます。


You can communicate with a terminal that has the same application at the first launch.
When entering a character string and pressing a line feed, the character string entered to the connected terminal flows by voice.
When you enter a letter, it represents the strength of the radio waves. When the terminal leaves, the value increases to weakening intensity.
When you enter empty characters, you will get the radio field intensity again. When you tap the screen, you will only get the radio field intensity.
The branch of Collection_BLE is dedicated to the iphone terminal, and the radio field intensity can be drawn and displayed for each terminal on the graph.
For example, you can check with radio field intensity graph for ipad, radio field intensity graph for iphone.


![](https://github.com/daisukenagata/BLEView/blob/master/BLE.gif?raw=true)
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
