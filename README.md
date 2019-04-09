#  Wacky Tab Bar

The purpose of this project was to see if there is a way to customize a UITabBarController without resorting to extreme measures, such as introducing new views, private APIs, or completely re-engineering the UITabBarController. 

## Primary Features

The primary features of the project: 

### WackTabBarController

A subclass of UITabBarController, allows us to configure various properties. Right now, this class uses `traitCollectionDidChange` to re-configure the tab bar items of its view controllers so they display correctly for both compact and regular size classes. 

`configureTabBarItem(_:for:)` uses the UITabBarController's current `traitCollection` values to adjust the tab bar item. Right now this sets the `titlePositionAdjustment` and `imageInsets` to appropriate values based on ther horizontal size class.  

### WackyTabBar

A subclass of UITabBar. The override in `sizeThatFits` adjusts the geomoetry of the tab bar. I chose to use an offset as opposed to hardcosing a height because we'd need different values based on device. 

### RootFlowCoordinator

This is a very basic version of our current flow coordinator setup. This class does the basic job of instantiating the tab bar controller, setting its view controllers, and then getting this into the window. 

## Testing

I've tested this on different simulators including the iPhone XR and iPhone 8 to get a sense of how well this works for notch and non-notch phones. Also on the iPad under different multitasking cases and rotation. It seemes to work pretty well and hasn't broken anything that I can tell yet. 

The container view of the UITabViewController seems to have the correct size to show all the content without clipping, which was a concern. I tested this on phones and the iPad under differernt multitasking cases. 
