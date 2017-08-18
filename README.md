# LWTableViewCell

[![Version](https://img.shields.io/cocoapods/v/LWTableViewCell.svg?style=flat)](http://cocoapods.org/pods/LWTableViewCell)
[![License](https://img.shields.io/cocoapods/l/LWTableViewCell.svg?style=flat)](http://cocoapods.org/pods/LWTableViewCell)
[![Platform](https://img.shields.io/cocoapods/p/LWTableViewCell.svg?style=flat)](http://cocoapods.org/pods/LWTableViewCell)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

LWTableViewCell is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'LWTableViewCell'
```

## Usage

Subclass LWTableViewCell and use drawCellView: instead of drawRect: to draw most of the content in the cell.

LWTableViewCell clears the subviews' stack and keeps one subview only, the one where we're going to draw most of the content in.
So force yourself to draw any static image and text using CoreGraphics, but use an UIImageView if you need an asynchronous image loading.
Avoid gradients, avoid blendings, and keep all pixel-perfect rounding coordinates and dimensions with ceil and floor, or using the .integral attribute of CGRect.

Have fun!

## Author

Paolo Arduin: arduin.paolo@gmail.com.

LWTableViewCell is based on the logic behind [ABTableViewCell](https://github.com/enormego/ABTableViewCell/tree/4e9861651b827d5e4716e56c870a52a0c3ab2027). 

## License

LWTableViewCell is available under the MIT license. See the LICENSE file for more info.
