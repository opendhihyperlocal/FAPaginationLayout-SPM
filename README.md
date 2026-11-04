# FAPaginationLayout-SPM

[![Swift Package Manager](https://img.shields.io/badge/SPM-compatible-brightgreen.svg?style=flat)](https://swift.org/package-manager/)
[![Platform](https://img.shields.io/badge/platform-iOS%2013%2B-blue.svg?style=flat)](https://developer.apple.com/ios/)
[![Swift](https://img.shields.io/badge/Swift-5.5%2B-orange.svg?style=flat)](https://swift.org)
[![License](https://img.shields.io/badge/license-MIT-lightgrey.svg?style=flat)](LICENSE)

A custom `UICollectionViewFlowLayout` that adds card-style pagination to a horizontal collection view, packaged for **Swift Package Manager**.
Each swipe snaps to the next cell, and the neighbouring cells peek in from the sides so users can see there is more content.

## What's different in this package

- Installable with Swift Package Manager (`Package.swift`)
- Library source moved to `Sources/FAPaginationLayout`
- Minimum iOS raised to 13 and Swift tools 5.5
- Usage examples updated for modern Swift (`UIEdgeInsets`, `.fast` deceleration)

## Features

- Snaps to one cell per swipe (pagination)
- Shows parts of the previous and next cells
- Works with the collection view's content insets
- Easy to add scale or rotation animations while scrolling
- Works with Swift Package Manager and CocoaPods

## Requirements

- iOS 13.0+
- Swift 5.5+
- Xcode 13.0+

## Installation

### Swift Package Manager (recommended)

**Xcode:** File → Add Package Dependencies… and enter:

```
https://github.com/abhishekpundir-arch/FAPaginationLayout-SPM.git
```

Choose version `1.0.0` or later, then add the **FAPaginationLayout** library to your app target.

**Package.swift:**

```swift
dependencies: [
    .package(url: "https://github.com/abhishekpundir-arch/FAPaginationLayout-SPM.git", from: "1.0.0")
],
targets: [
    .target(
        name: "YourApp",
        dependencies: [
            .product(name: "FAPaginationLayout", package: "FAPaginationLayout-SPM")
        ]
    )
]
```

### CocoaPods

```ruby
pod 'FAPaginationLayout', :git => 'https://github.com/abhishekpundir-arch/FAPaginationLayout-SPM.git', :tag => '1.0.0'
```

## Usage

```swift
import FAPaginationLayout
```

### Step 1: Set the layout

In code:

```swift
let layout = FAPaginationLayout()
layout.scrollDirection = .horizontal
collectionView.collectionViewLayout = layout
collectionView.decelerationRate = .fast
```

Or in a storyboard, select the collection view's **Flow Layout**, set its class to `FAPaginationLayout` and module to `FAPaginationLayout`.

### Step 2: Set the insets and cell size

```swift
collectionView.contentInset = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30)

func collectionView(_ collectionView: UICollectionView,
                    layout collectionViewLayout: UICollectionViewLayout,
                    sizeForItemAt indexPath: IndexPath) -> CGSize {
    var cellSize = collectionView.bounds.size
    cellSize.width -= collectionView.contentInset.left * 2
    cellSize.width -= collectionView.contentInset.right * 2
    cellSize.height = cellSize.width
    return cellSize
}
```

### Optional: Scale cells while scrolling

```swift
override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    updateCellsLayout()
}

func scrollViewDidScroll(_ scrollView: UIScrollView) {
    updateCellsLayout()
}

func updateCellsLayout() {
    let centerX = collectionView.contentOffset.x + collectionView.frame.size.width / 2

    for cell in collectionView.visibleCells {
        let offsetX = abs(centerX - cell.center.x)
        let scale = 1 - offsetX / (view.bounds.width * 2.7)
        cell.transform = CGAffineTransform(scaleX: scale, y: scale)
    }
}
```

### Optional: Rotate cells while scrolling

Use the same setup as above, but change `updateCellsLayout()`:

```swift
func updateCellsLayout() {
    let centerX = collectionView.contentOffset.x + collectionView.frame.size.width / 2

    for cell in collectionView.visibleCells {
        let offsetX = abs(centerX - cell.center.x)
        if offsetX > 0 {
            let rotation = 1 - offsetX / view.bounds.width
            cell.transform = CGAffineTransform(rotationAngle: rotation - 45)
        }
    }
}
```

### Without animation

Use insets that match your design, and remove the doubling of the insets in the cell size:

```swift
collectionView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)

func collectionView(_ collectionView: UICollectionView,
                    layout collectionViewLayout: UICollectionViewLayout,
                    sizeForItemAt indexPath: IndexPath) -> CGSize {
    var cellSize = collectionView.bounds.size
    cellSize.width -= collectionView.contentInset.left
    cellSize.width -= collectionView.contentInset.right
    return cellSize
}
```

## Example

Open `FAPaginationLayout.xcodeproj` to run the demo app. It shows all three styles: size animation, rotation animation and no animation.

## Maintainer

[abhishekpundir-arch](https://github.com/abhishekpundir-arch)

## License

Available under the MIT license. See [LICENSE](LICENSE) for details.

## Credits

This package is based on [FAPaginationLayout](https://github.com/fahidattique55/FAPaginationLayout) by Fahid Attique (MIT license), with contributions from Evyasafmordechai and orlandoamorim. The original copyright notice is kept in [LICENSE](LICENSE).
