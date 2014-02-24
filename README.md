![image](https://github.com/JackTeam/InstagramThumbnail/raw/master/Screenshots/InstagramThumbnailRadius.gif)
![image](https://github.com/JackTeam/InstagramThumbnail/raw/master/Screenshots/InstagramThumbnailWebImage.gif)
![image](https://github.com/JackTeam/InstagramThumbnail/raw/master/Screenshots/InstagramThumbnailGrid.gif)
![image](https://github.com/JackTeam/InstagramThumbnail/raw/master/Screenshots/InstagramThumbnailOnePicture.gif)

==================

InstagramThumbnail is a display thumbnail grid view, based on Instagram App.


Easy to drop into your project.      

You can add this feature to your own project, `InstagramThumbnail` is easy-to-use.        

## Requirements ##

InstagramThumbnail requires Xcode 5, targeting either iOS 6.0 and above, ARC-enabled.      

## Profile

[CocosPods](http://cocosPods.org) is the recommended methods of installation InstagramThumbnail, just add the following line to `Profile`:

```
pod 'InstagramThumbnail', '~> 0.1.1'
```

## How to use ##
```objc
Use this library setup grid thumbnail to show:
InstagramCollectionViewController *instagramCollectionViewController = [InstagramThumbnailCollectionViewController sharedInstagramCollectionViewController];
self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:instagramCollectionViewController];

Use this library setup one pictre to show:
InstagramCollectionViewController *instagramCollectionViewController = [InstagramPictureCollectionViewController sharedInstagramCollectionViewController];
self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:instagramCollectionViewController];

```
## Lincense ##

`InstagramThumbnail` is available under the MIT license. See the LICENSE file for more info.
