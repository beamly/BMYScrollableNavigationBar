#BMYScrollableNavigationBar

Facebook-style scrollable navigation bar as used in the [Beamly iOS app](https://itunes.apple.com/gb/app/beamly-tv-by-zeebox/id454689266?mt=8).

![1](https://img-i.zeebox.com/images/ugc/uu7c909116-f781-4222-ba26-f9f6d74f5f0a/c1cbdafb-d690-455b-954f-d548d29da117.gif)

This version of the scrollable navigation bar feature is an evolution on [Valentin Shergin](https://github.com/shergin)'s [SherginScrollableNavigationBar](https://github.com/shergin/SherginScrollableNavigationBar). There are a few open source components ([1](https://github.com/andreamazz/AMScrollingNavbar), [2](https://github.com/telly/TLYShyNavBar), [3](https://github.com/luugiathuy/GTScrollNavigationBar), [4](https://github.com/justinswart/JSCollapsingNavBarViewController)) for iOS but all of them suffer of different issues (included the original SherginScrollableNavigationBar) and work only with translucent or opaque navigation bars.

This version aims to support both translucent and opaque navigation bars.

Try out the included demo project or just run `pod try BMYScrollableNavigationBar` to give it a try.

Simple usage:

- copy all the classes in the `BMYScrollableNavigationBar` folder into your project or install via CocoaPods adding the following line to your Podfile

```
pod "BMYScrollableNavigationBar"
```

- import `BMYScrollableNavigationBar.h` where the navigation controller of your view controller is created

- when creating your `UINavigationViewController`, do the following

``` objective-c
UINavigationController *navigationController = [[UINavigationController alloc] initWithNavigationBarClass:[BMYScrollableNavigationBar class] toolbarClass:nil];
[navigationController setViewControllers:@[myViewController] animated:NO];
```

- import `BMYScrollableNavigationBarViewController.h` in your `UIViewController` and make it inherit from `BMYScrollableNavigationBarViewController`

- make sure the scrollview has the following autoresizingMask:

``` objective-c
self.scrollView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
```

- after setting the frame on the scrollview, in the `viewDidLoad`, add the following line:

``` objective-c
[self bindNavigationBarToScrollView:self.scrollView];
```

#Licensing

This project is licensed under the [BSD 3-Clause license](http://opensource.org/licenses/BSD-3-Clause)

#Contributions

Note that we are not accepting pull requests at this time.
