//
//  DSwiftHelper.swift
//  BookReader
//
//  Created by Arthur on 16/9/2.
//  Copyright © 2016年 Arthur. All rights reserved.
//

import UIKit
import Foundation

/** Need to determine device platform & processor cores */
//#import <sys/utsname.h>

/** Need to determine processor cores */
//#include <mach/mach_host.h>

/** Need for MD5 & SHA hashes */
//#import <CommonCrypto/CommonDigest.h>

/** Need to determine IP address */
//#include <ifaddrs.h>
//#include <arpa/inet.h>

/** Need for AES crypto */
//#import <CommonCrypto/CommonCryptor.h>

/** Need for GZIP */
//import <zlib.h>

/** Need to determine MIME types */
import MobileCoreServices

import EventKit
import AddressBook

// MARK: Debug

//    #if DEBUG
//    func DLog(fmt, ...){
//        NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
//    }
//    #else
//    let DLog(...)
//    #endif

// --------------------------------------------------

// MARK:  Device

let kDeviceIsPad: Bool = (UIDevice.currentDevice().userInterfaceIdiom == .Pad)
let kDeviceIsPhone: Bool = (UIDevice.currentDevice().userInterfaceIdiom == .Phone)

let kiPhone5ScreenWidth: Float = 320
let kiPhone5ScreenHeight: Float = 568
let kiPhone6ScreenWidth: Float = 375
let kiPhone6ScreenHeight: Float = 667
let kiPhone6PlusScreenWidth: Float = 414
let kiPhone6PlusScreenHeight: Float = 736

var kDeviceIsPhoneSmallerOrEqual35:Bool {
    return (kDeviceIsPhone && max(UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height) <= 480.0);
}
var kDeviceIsPhoneSmallerOrEqual40:Bool{
    return (kDeviceIsPhone && max(UIScreen.mainScreen().bounds.size.width, UIScreen.mainScreen().bounds.size.height) <= 568.0);
}
var kDeviceIsPhoneSmallerOrEqual47:Bool{
    return (kDeviceIsPhone && max(UIScreen.mainScreen().bounds.size.width, UIScreen.mainScreen().bounds.size.height) <= 667.0);
}
var kDeviceIsPhoneSmallerOrEqual55:Bool{
    return (kDeviceIsPhone && max(UIScreen.mainScreen().bounds.size.width, UIScreen.mainScreen().bounds.size.height) <= 1104.0)
}

let kDeviceIsRetina:Bool = (UIScreen.mainScreen().scale >= 2.0)
let kDeviceIsNotRetina:Bool = (UIScreen.mainScreen().scale == 1.0)

let kMainScreenScale:CGFloat = UIScreen.mainScreen().scale

let kMainScreenWidth:CGFloat = UIScreen.mainScreen().bounds.size.width
let kMainScreenHeight:CGFloat = UIScreen.mainScreen().bounds.size.height

let kMainScreenSideMax:CGFloat = max(UIScreen.mainScreen().bounds.size.width, UIScreen.mainScreen().bounds.size.height)
let kMainScreenSideMin:CGFloat = min(UIScreen.mainScreen().bounds.size.width, UIScreen.mainScreen().bounds.size.height)

let kSystemVersion:Float = Float(UIDevice.currentDevice().systemVersion) ?? 0
let kSystemName:String = UIDevice.currentDevice().systemName
let kDeviceModel:String = UIDevice.currentDevice().model
let kDeviceModelLocalized:String = UIDevice.currentDevice().localizedModel
let kDeviceName:String = UIDevice.currentDevice().name
let kDeviceBatteryLevel:Float = UIDevice.currentDevice().batteryLevel
let kDeviceBatteryState:UIDeviceBatteryState = UIDevice.currentDevice().batteryState
let kDeviceOrientation:UIDeviceOrientation = UIDevice.currentDevice().orientation
let kDeviceBeginGeneratingDeviceOrientationNotifications = [UIDevice.currentDevice().beginGeneratingDeviceOrientationNotifications]
let kDeviceEndGeneratingDeviceOrientationNotifications = [UIDevice.currentDevice().endGeneratingDeviceOrientationNotifications]
let kDeviceIsGeneratingDeviceOrientationNotifications:Bool = UIDevice.currentDevice().generatesDeviceOrientationNotifications

let kProcessorNumberOfCores = NSProcessInfo.processInfo().processorCount
let kProcessorNumberActiveOfCores = NSProcessInfo.processInfo().activeProcessorCount

let kDeviceIsOld = (NSProcessInfo.processInfo().activeProcessorCount < 2)

let kStatusBarOrientation = UIApplication.sharedApplication().statusBarOrientation
let kStatusBarOrientationIsPortrait = UIInterfaceOrientationIsPortrait(UIApplication.sharedApplication().statusBarOrientation)
let kStatusBarOrientationIsLandscape = UIInterfaceOrientationIsLandscape(UIApplication.sharedApplication().statusBarOrientation)
let kStatusBarHidden = UIApplication.sharedApplication().statusBarHidden

let kLanguageDefault = NSLocale.preferredLanguages()[0] // "en"
let kCountryCode = NSLocale.currentLocale().objectForKey(NSLocaleCountryCode)// "en"
let kTimeZone = NSTimeZone.localTimeZone
let kTimeZoneName = NSTimeZone.localTimeZone().name // "America/Los_Angeles"

// --------------------------------------------------

// MARK:  Directories

let kMainBundleDirectoryURL = NSURL.fileURLWithPath(NSBundle.mainBundle().resourcePath!)
let kApplicationsDirectoryURL = NSFileManager.defaultManager().URLsForDirectory(NSSearchPathDirectory.ApplicationDirectory, inDomains: NSSearchPathDomainMask.UserDomainMask).last
let kDocumentsDirectoryURL = NSFileManager.defaultManager().URLsForDirectory(NSSearchPathDirectory.DocumentDirectory, inDomains: NSSearchPathDomainMask.UserDomainMask).last

let kInfoDictionary = NSBundle.mainBundle().infoDictionary
let kBuildVersion = NSBundle.mainBundle().infoDictionary!["CFBundleVersion"]
let kAppVersion = NSBundle.mainBundle().infoDictionary!["CFBundleShortVersionString"]

// --------------------------------------------------

// MARK:  Reductions

let kUserDefaults = NSUserDefaults.standardUserDefaults
let kFileManager = NSFileManager.defaultManager
let kApplication = UIApplication.sharedApplication
let kNotificationCenter = NSNotificationCenter.defaultCenter
let kAppDelegate = UIApplication.sharedApplication().delegate
let kMainBundle = NSBundle.mainBundle
let kMainScreen = UIScreen.mainScreen
let kAppWindow = UIApplication.sharedApplication().delegate?.window
let kRootViewController = UIApplication.sharedApplication().delegate?.window!!.rootViewController

func kUserDefaultsIsKeyExists(key: String) -> Bool{
    return NSUserDefaults.standardUserDefaults().dictionaryRepresentation().keys.contains(key)
}

// --------------------------------------------------

// MARK:  Colors

func kColorRGBA(r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat) -> UIColor{
    return UIColor.init(red: (r)/255.0, green: (g)/255.0, blue: (b)/255.0, alpha: (a))
}

func kColorRGB(r:CGFloat, g:CGFloat, b:CGFloat) -> UIColor{
    return UIColor.init(red: (r)/255.0, green: (g)/255.0, blue: (b)/255.0, alpha: 1.0)
}

// --------------------------------------------------

// MARK:  Geometry

func kDegreesToRadians(d:Double) -> Double{
    return ((d) * M_PI / 180);
}
func kRadiansToDegrees(r:Double) -> Double{
    return ((r) * 180.0 / M_PI)
}

// --------------------------------------------------

// MARK:  Regex

let kRegexForNumbers = "^([+-]?)(?:|0|[1-9]\\d*)(?:\\.\\d*)?$"
let kRegexForIntegers = "^([+-]?)(?:|0|[1-9]\\d*)?$"

func kIsStringANumber(string:String) -> Bool{
    return NSPredicate.init(format:"SELF MATCHES %@", kRegexForNumbers).evaluateWithObject(string);
}

func kIsStringAnInteger(string:String) -> Bool{
    return NSPredicate.init(format: "SELF MATCHES %@", kRegexForIntegers).evaluateWithObject(string);
}

// --------------------------------------------------

// MARK:  Localized

func LS(key: String) -> String {
    return NSLocalizedString(key, comment:"")
}

// --------------------------------------------------

// MARK:  Sizes

let kNavBarHeight:CGFloat = 44.0 //self.navigationController.navigationBar.frame.size.height
let kStatusBarHeight:CGFloat = 20.0 //[UIApplication sharedApplication].statusBarFrame.size.height
let kStatusAndNavBarsHeight:CGFloat = 64.0//([UIApplication sharedApplication].statusBarFrame.size.height+self.navigationController.navigationBar.frame.size.height)
var kTabBarHeight:CGFloat {
    return kSystemVersion >= 8.0 ? 49 : kSystemVersion >= 7.0 ? 56 : kSystemVersion >= 6.0 ? 49 : 0
}
// --------------------------------------------------

// MARK:  Aspects
// width : height

let kAspect1x1:CGFloat = 1.0       // 1 : 1
let kAspect4x3:CGFloat = 1.33    // 4 : 3
let kAspect16x10:CGFloat = 1.6     // 16 : 10
let kAspect16x9:CGFloat = 1.78    // 16 : 9

// --------------------------------------------------

// MARK:  Alphabets

let kAlphabetEnLowercaseArray = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
let kAlphabetEnUppercaseArray = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
let kAlphabetRuLowercaseArray = ["а", "б", "в", "г", "д", "е", "ё", "ж", "з", "и", "й", "к", "л", "м", "н", "о", "п", "р", "с", "т", "у", "ф", "х", "ц", "ч", "ш", "щ", "ъ", "ы", "ь", "э", "ю", "я"]
let kAlphabetRuUppercaseArray = ["А", "Б", "В", "Г", "Д", "Е", "Ё", "Ж", "З", "И", "Й", "К", "Л", "М", "Н", "О", "П", "Р", "С", "Т", "У", "Ф", "Х", "Ц", "Ч", "Ш", "Щ", "Ъ", "Ы", "Ь", "Э", "Ю", "Я"]

// --------------------------------------------------

// MARK:  Recomended touch area sizes

let kSizeStandardSmall = 32.0
let kSizeStandardMedium = 44.0
let kSizeStandardLarge = 64.0

// --------------------------------------------------

// MARK:  Animations

let kAnimationSpringToNormal = 0.66

// MARK:  Useful

//Mark: Reductions

// [NSArray arrayWithObjects:@"1", @"2", nil]                                       == @[@"1", @"2"];
// [NSDictionary dictionaryWithObjects:@"1", @"2", nil forKeys:@"one", @"two", nil] == @{@"one" : @"1", @"two" : @"2"}
// [NSNumber numberWithChar:'A']                                                    == NSNumber *theA = @'A';
// [NSNumber numberWithInt:42]                                                      == NSNumber *fortyTwo = @42;
// [NSNumber numberWithUnsignedInt:42U]                                             == NSNumber *fortyTwoUnsigned = @42U;
// [NSNumber numberWithLong:42L]                                                    == NSNumber *fortyTwoLong = @42L;
// [NSNumber numberWithLongLong:42LL]                                               == NSNumber *fortyTwoLongLong = @42LL;
// [NSNumber numberWithFloat:3.141592654F]                                          == NSNumber *piFloat = @3.141592654F;
// [NSNumber numberWithDouble:3.1415926535]                                         == NSNumber *piDouble = @3.1415926535;
// [NSNumber numberWithBool:YES]                                                    == NSNumber *yesNumber = @YES;
// [NSNumber numberWithBool:NO]                                                     == NSNumber *noNumber = @NO;

// MARK: Colors

// [color colorWithAlphaComponent:(CGFloat)] - задает новое значение alpha

// MARK: Animations

// [UIView animateWithDuration:(NSTimeInterval) delay:(NSTimeInterval) options:(UIViewAnimationOptions) animations:^(void)animations completion:^(BOOL finished)completion]

// [UIView transitionFromView:(UIView *) toView:(UIView *) duration:(NSTimeInterval) options:(UIViewAnimationOptions) completion:^(BOOL finished)completion]

// [UIView transitionWithView:(UIView *) duration:(NSTimeInterval) options:(UIViewAnimationOptions) animations:^(void)animations completion:^(BOOL finished)completion]

// CATransition *transition = [CATransition new];
// transition.type = kCATransitionPush;
// transition.subtype = kCATransitionFromRight;
// transition.duration = 0.2;
// [transition setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
// [self.view.layer addAnimation:transition forKey:@"transition"];

// MARK: Stop performSelector

// [object cancelPreviousPerformRequestsWithTarget:target selector:@selector(selector:) object:object];

// MARK: Threads

// Grand Central Dispatch

// dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void)block);

// dispatch_async(dispatch_get_main_queue(), ^(void)block);

// dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC)), dispatch_get_main_queue(), ^(void)block);

// dispatch_apply(count, dispatch_get_global_queue(0, 0), ^(size_t i)block); // многопоточный аналог цикла for (int i=0; i<=coint-1; i++) { }

// dispatch_queue_t queue = dispatch_queue_create("com.example.unique.identifier", NULL);
// dispatch_async(queue, ^(void)block);
// dispatch_release(queue);

// Perform Selector

// NSOperationQueue *queue = [NSOperationQueue new];
// NSInvocationOperation *operation = [[NSInvocationOperation alloc] initWithTarget:(id) selector:(SEL) object:(id)];
// [queue addOperation:operation];
// [self performSelectorOnMainThread:(SEL) withObject:(id) waitUntilDone:(BOOL)];

// MARK: Scroll View

// [_scrollView scrollRectToVisible:(CGRect) animated:(BOOL)]; // прокручивает скролл вью

// MARK: Lock Screen Play Music

// NSDictionary *currentlyPlayingTrackInfo = @{ MPMediaItemPropertyTitle : (NSString *) };
// [MPNowPlayingInfoCenter defaultCenter].nowPlayingInfo = currentlyPlayingTrackInfo;

// MARK: Singleton

// static func(instancetype)sharedManager
// {
//     static dispatch_once_t once;
//     static id sharedManager;
//
//     dispatch_once(&once, ^(void)
//                   {
//                       sharedManager = [super new];
//                   });
//
//     return sharedManager;
// }

// MARK: Add @property to category

// #import <objc/runtime.h>

// - (void)setObject:(Class *)object
// {
//     objc_setAssociatedObject(self, @selector(object), object, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
// }

// - (Class *)object
// {
//     return objc_getAssociatedObject(self, @selector(object));
// }

// MARK: UITableView alphabet scroll indicator

// - (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
// {
//     return @[@"a", @"b", @"c"];
// }

// MARK: Warnings

// #pragma GCC diagnostic push
// #pragma GCC diagnostic ignored "-Wdeprecated-declarations"
//     place here some warning, needs to be hidden
// #pragma GCC diagnostic pop

// MARK: System Version

// #if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_7_0
// #endif

// #if __IPHONE_OS_VERSION_MAX_ALLOWED < __IPHONE_8_0
// #endif

// MARK:  Enum

// UIButton *button = [UIButton new];
// [button setTitle:@"title" forState:UIControlStateSelected|UIControlStateHighlighted];
// [button setSelected:YES];
// [button setHighlighted:YES];

// if ((button.state & (UIControlStateSelected|UIControlStateHighlighted)) == (UIControlStateSelected|UIControlStateHighlighted))
// {
//     // return YES;
// }
// else
// {
//     // return NO;
// }

// MARK:  Attributes

// __attribute__((unavailable("description")));
// __attribute__((annotate("some_annotation")))

// MARK:  UIViewController

// self.automaticallyAdjustsScrollViewInsets = NO;
// self.extendedLayoutIncludesOpaqueBars = YES;
//
// if (kSystemVersion < 7.0)
//     self.wantsFullScreenLayout = YES;

// MARK:  Interface

/** Need to send email and sms */
//@import MessageUI;
import MessageUI

/** Need to open addresses and coorinates on map */
//@import MapKit;
import MapKit

enum  DImageScalingMode: Int{
    case DImageScalingModeAspectFill = 0, DImageScalingModeAspectFit
}



class DSwiftHelper : NSObject
{
    static let sharedInstance = DSwiftHelper()
    
    private override init() {
        super.init();
    }
    
    
    
    
    
    // MARK: UIView
    
    static func superviewForView( view:UIView, withClass superViewClass:AnyClass) -> UIView?
    {
        var superView = view.superview;
        var foundSuperView:UIView?;
        
        while (nil != superView && nil == foundSuperView)
        {
            if((superView?.isKindOfClass(superViewClass)) != nil){
                foundSuperView = superView
            }
            else{
                superView = superView!.superview;
            }
        }
        
        return foundSuperView;
    }
    
    static func firstResponderInView(view:UIView) ->UIView?
    {
        if (view.subviews.count > 0){
            return nil;
        }
    
        var firstResponderView :UIView?;
    
        for subview in view.subviews
        {
            if (subview.canBecomeFirstResponder() && subview.isFirstResponder()){
                firstResponderView = subview;
            }
            else{
                firstResponderView = DSwiftHelper.firstResponderInView(subview)
            }
            
            if (firstResponderView != nil) {
                break;
            }
        }
    
        return firstResponderView;
    }
    
    static func isViewEditing(view:UIView) -> Bool
    {
        return (DSwiftHelper.firstResponderInView(view) != nil);
    }
    
    // MARK: UIScrollView
    
    static func scrollView(scrollView:UIScrollView, scrollRectToVisible:CGRect, edgeInsets:UIEdgeInsets, animated:Bool)
    {
        var rect = scrollRectToVisible
        
        rect.origin.x -= edgeInsets.left;
        rect.origin.y -= edgeInsets.top;
        rect.size.width += (edgeInsets.left+edgeInsets.right);
        rect.size.height += (edgeInsets.top+edgeInsets.bottom);
        
        scrollView.scrollRectToVisible(rect, animated: animated)
    }
    
    static func scrollView(scrollView:UIScrollView, animated:Bool)
    {
        let firstResponderView:UIView? = DSwiftHelper.firstResponderInView(scrollView)
        if (firstResponderView != nil) {
            return;
        }
        
        if let frame = firstResponderView?.frame{
            scrollView.scrollRectToVisible(frame, animated: animated)
        }
    }
    
    static func scrollView(scrollView:UIScrollView, scrollFirstResponderToVisibleWithEdgeInsets:UIEdgeInsets, animated:Bool)
    {
        let firstResponderView:UIView? = DSwiftHelper.firstResponderInView(scrollView);
        if (firstResponderView == nil){
            return;
        }
    
        if let frame = firstResponderView?.frame{
            DSwiftHelper.scrollView(scrollView,
                                    scrollRectToVisible: frame,
                                    edgeInsets: scrollFirstResponderToVisibleWithEdgeInsets,
                                    animated: animated)
        }
    }
    
//    static func(void)scrollView:(UIScrollView *)scrollView focusOnView:(UIView *)view bottomShift:(CGFloat)bottomShift
//    {
//    CGRect viewRect = CGRectMake(0.f, 0.f, view.frame.size.width, view.frame.size.height);
//    if ([view isKindOfClass:[UITextView class]])
//    {
//    UITextView *textView = (UITextView *)view;
//    
//    viewRect = [textView caretRectForPosition:textView.selectedTextRange.start];
//    }
//    else if ([view isKindOfClass:[UITextField class]])
//    {
//    UITextField *textField = (UITextField *)view;
//    
//    viewRect = [textField caretRectForPosition:textField.selectedTextRange.start];
//    }
//    
//    // if the control is a deep in the hierarchy below the scroll view, this will calculate the frame as if it were a direct subview
//    CGRect controlFrameInScrollView = [scrollView convertRect:viewRect fromView:view];
//    
//    // replace bottomShift with any nice visual offset between control and keyboard or control and top of the scroll view.
//    controlFrameInScrollView.size.height += bottomShift;
//    
//    CGFloat controlVisualOffsetToTopOfScrollView = controlFrameInScrollView.origin.y - scrollView.contentOffset.y;
//    CGFloat controlVisualBottom = controlVisualOffsetToTopOfScrollView + controlFrameInScrollView.size.height;
//    
//    // this is the visible part of the scroll view
//    CGFloat scrollViewVisibleHeight = scrollView.frame.size.height - scrollView.contentInset.bottom;
//    
//    if (controlVisualBottom > scrollViewVisibleHeight)
//    {
//    // check if the keyboard will hide the control in question
//    // scroll up until the control is in place
//    CGPoint newContentOffset = scrollView.contentOffset;
//    newContentOffset.y += (controlVisualBottom - scrollViewVisibleHeight);
//    
//    // make sure we don't set an impossible offset caused by the "nice visual offset"
//    // if a control is at the bottom of the scroll view, it will end up just above the keyboard to eliminate scrolling inconsistencies
//    newContentOffset.y = MIN(newContentOffset.y, scrollView.contentSize.height - scrollViewVisibleHeight);
//    
//    [scrollView setContentOffset:newContentOffset animated:NO]; // animated:NO because we have created our own animation context around this code
//    }
//    else if (controlFrameInScrollView.origin.y < scrollView.contentOffset.y)
//    {
//    // if the control is not fully visible, make it so (useful if the user taps on a partially visible input field
//    CGPoint newContentOffset = scrollView.contentOffset;
//    newContentOffset.y = controlFrameInScrollView.origin.y;
//    
//    // animated:NO because we have created our own animation context around this code
//    [scrollView setContentOffset:newContentOffset animated:NO];
//    }
//    }
//    
//    static func(void)scrollViewKillScroll:(UIScrollView *)scrollView
//    {
//    scrollView.scrollEnabled = NO;
//    scrollView.scrollEnabled = YES;
//    }
//    
//    // MARK: Images
//    
//    static func(UIImage *)imageWithOrientationExifFix:(UIImage *)image
//    {
//    // No-op if the orientation is already correct
//    if (image.imageOrientation == UIImageOrientationUp) return image;
//    
//    // We need to calculate the proper transformation to make the image upright.
//    // We do it in 2 steps: Rotate if Left/Right/Down, and then flip if Mirrored.
//    CGAffineTransform transform = CGAffineTransformIdentity;
//    
//    switch (image.imageOrientation)
//    {
//    case UIImageOrientationDown:
//    case UIImageOrientationDownMirrored:
//    transform = CGAffineTransformTranslate(transform, image.size.width, image.size.height);
//    transform = CGAffineTransformRotate(transform, M_PI);
//    break;
//    
//    case UIImageOrientationLeft:
//    case UIImageOrientationLeftMirrored:
//    transform = CGAffineTransformTranslate(transform, image.size.width, 0.f);
//    transform = CGAffineTransformRotate(transform, M_PI_2);
//    break;
//    
//    case UIImageOrientationRight:
//    case UIImageOrientationRightMirrored:
//    transform = CGAffineTransformTranslate(transform, 0.f, image.size.height);
//    transform = CGAffineTransformRotate(transform, -M_PI_2);
//    break;
//    case UIImageOrientationUp:
//    case UIImageOrientationUpMirrored:
//    break;
//    }
//    
//    switch (image.imageOrientation)
//    {
//    case UIImageOrientationUpMirrored:
//    case UIImageOrientationDownMirrored:
//    transform = CGAffineTransformTranslate(transform, image.size.width, 0.f);
//    transform = CGAffineTransformScale(transform, -1.f, 1.f);
//    break;
//    
//    case UIImageOrientationLeftMirrored:
//    case UIImageOrientationRightMirrored:
//    transform = CGAffineTransformTranslate(transform, image.size.height, 0.f);
//    transform = CGAffineTransformScale(transform, -1.f, 1.f);
//    break;
//    case UIImageOrientationUp:
//    case UIImageOrientationDown:
//    case UIImageOrientationLeft:
//    case UIImageOrientationRight:
//    break;
//    }
//    
//    // Now we draw the underlying CGImage into a new context, applying the transform
//    // calculated above.
//    CGContextRef ctx = CGBitmapContextCreate(NULL,
//    image.size.width,
//    image.size.height,
//    CGImageGetBitsPerComponent(image.CGImage), 0.f,
//    CGImageGetColorSpace(image.CGImage),
//    CGImageGetBitmapInfo(image.CGImage));
//    CGContextConcatCTM(ctx, transform);
//    switch (image.imageOrientation)
//    {
//    case UIImageOrientationLeft:
//    case UIImageOrientationLeftMirrored:
//    case UIImageOrientationRight:
//    case UIImageOrientationRightMirrored:
//    // Grr...
//    CGContextDrawImage(ctx, CGRectMake(0.f, 0.f, image.size.height, image.size.width), image.CGImage);
//    break;
//    
//    default:
//    CGContextDrawImage(ctx, CGRectMake(0.f, 0.f, image.size.width, image.size.height), image.CGImage);
//    break;
//    }
//    
//    // And now we just create a new UIImage from the drawing context
//    CGImageRef cgimg = CGBitmapContextCreateImage(ctx);
//    UIImage *img = [UIImage imageWithCGImage:cgimg];
//    CGContextRelease(ctx);
//    CGImageRelease(cgimg);
//    return img;
//    }
//    
//    static func(UIImage *)image1x1WithColor:(UIColor *)color
//    {
//    CGRect rect = CGRectMake(0.f, 0.f, 1.f, 1.f);
//    
//    UIGraphicsBeginImageContext(rect.size);
//    
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    
//    CGContextSetFillColorWithColor(context, color.CGColor);
//    CGContextFillRect(context, rect);
//    
//    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    
//    return image;
//    }
//    
//    static func(UIImage *)image:(UIImage *)image withAlpha:(CGFloat)alpha
//    {
//    CGRect rect = CGRectMake(0.f, 0.f, image.size.width, image.size.height);
//    
//    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0.f);
//    
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    
//    CGContextScaleCTM(context, 1.f, -1.f);
//    CGContextTranslateCTM(context, 0.f, -rect.size.height);
//    
//    CGContextSetBlendMode(context, kCGBlendModeMultiply);
//    CGContextSetAlpha(context, alpha);
//    
//    CGContextDrawImage(context, rect, image.CGImage);
//    
//    UIImage *imageNew = UIGraphicsGetImageFromCurrentImageContext();
//    
//    UIGraphicsEndImageContext();
//    
//    return imageNew;
//    }
//    
//    static func(UIImage *)image:(UIImage *)image withColor:(UIColor *)color
//    {
//    CGRect rect = CGRectMake(0.f, 0.f, image.size.width, image.size.height);
//    
//    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0.f);
//    
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    
//    [image drawInRect:rect];
//    
//    CGContextSetBlendMode(context, kCGBlendModeSourceIn);
//    CGContextSetFillColorWithColor(context, color.CGColor);
//    CGContextFillRect(context, rect);
//    
//    UIImage *imageNew = UIGraphicsGetImageFromCurrentImageContext();
//    
//    UIGraphicsEndImageContext();
//    
//    return imageNew;
//    }
//    
//    static func(UIImage *)imageBlackAndWhite:(UIImage *)image
//    {
//    CGRect rect = CGRectMake(0.f, 0.f, image.size.width, image.size.height);
//    
//    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0.f);
//    
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    
//    [image drawInRect:rect];
//    
//    CGContextSetBlendMode(context, kCGBlendModeLuminosity);
//    CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
//    CGContextFillRect(context, rect);
//    
//    UIImage *imageNew = UIGraphicsGetImageFromCurrentImageContext();
//    
//    UIGraphicsEndImageContext();
//    
//    return imageNew;
//    }
//    
//    static func(UIImage *)image:(UIImage *)image scaleToSize:(CGSize)size scalingMode:(LGImageScalingMode)scalingMode
//    {
//    return [LGHelper image:image scaleToSize:size scalingMode:scalingMode backgroundColor:nil];
//    }
//    
//    static func(UIImage *)image:(UIImage *)image scaleToSize:(CGSize)size scalingMode:(LGImageScalingMode)scalingMode backgroundColor:(UIColor *)backgroundColor
//    {
//    if (scalingMode == LGImageScalingModeAspectFit)
//    {
//    CGFloat koefWidth = (image.size.height > image.size.width ? image.size.width/image.size.height : 1.f);
//    CGFloat koefHeight = (image.size.width > image.size.height ? image.size.height/image.size.width : 1.f);
//    
//    size.width *= koefWidth;
//    size.height *= koefHeight;
//    }
//    
//    CGRect rect = CGRectMake(0.f, 0.f, size.width, size.height);
//    
//    UIGraphicsBeginImageContextWithOptions(size, NO, 0.f);
//    
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    
//    if (backgroundColor && ![backgroundColor isEqual:[UIColor clearColor]])
//    {
//    CGContextSetFillColorWithColor(context, backgroundColor.CGColor);
//    CGContextFillRect(context, rect);
//    }
//    
//    if (scalingMode == LGImageScalingModeAspectFill)
//    {
//    if (image.size.width / image.size.height >= 1 && image.size.width / image.size.height > size.width / size.height)
//    size.width = size.height * (image.size.width / image.size.height);
//    else if (image.size.height / image.size.width >= 1 && image.size.height / image.size.width > size.height / size.width)
//    size.height = size.width * (image.size.height / image.size.width);
//    
//    if (rect.size.width < size.width)
//    {
//    rect.origin.x = -(size.width - rect.size.width)/2;
//    rect.size.width = size.width;
//    }
//    
//    if (rect.size.height < size.height)
//    {
//    rect.origin.y = -(size.height - rect.size.height)/2;
//    rect.size.height = size.height;
//    }
//    }
//    else if (scalingMode == LGImageScalingModeAspectFit)
//    {
//    if (image.size.width / image.size.height <= 1 && image.size.width / image.size.height < size.width / size.height)
//    size.width = size.height * (image.size.width / image.size.height);
//    else if (image.size.height / image.size.width <= 1 && image.size.height / image.size.width < size.height / size.width)
//    size.height = size.width * (image.size.height / image.size.width);
//    
//    if (rect.size.width > size.width)
//    {
//    rect.origin.x = (rect.size.width - size.width)/2;
//    rect.size.width = size.width;
//    }
//    
//    if (rect.size.height > size.height)
//    {
//    rect.origin.y = (rect.size.height - size.height)/2;
//    rect.size.height = size.height;
//    }
//    }
//    
//    [image drawInRect:rect];
//    
//    UIImage *imageNew = UIGraphicsGetImageFromCurrentImageContext();
//    
//    UIGraphicsEndImageContext();
//    
//    return imageNew;
//    }
//    
//    static func(UIImage *)image:(UIImage *)image scaleWithMultiplier:(float)multiplier
//    {
//    CGSize size = CGSizeMake(image.size.width*multiplier, image.size.height*multiplier);
//    CGRect rect = CGRectMake(0.f, 0.f, size.width, size.height);
//    
//    UIGraphicsBeginImageContextWithOptions(size, NO, 0.f);
//    
//    [image drawInRect:rect];
//    
//    UIImage *imageNew = UIGraphicsGetImageFromCurrentImageContext();
//    
//    UIGraphicsEndImageContext();
//    
//    return imageNew;
//    }
//    
//    static func(UIImage *)image:(UIImage *)image roundWithRadius:(CGFloat)radius
//    {
//    return [LGHelper image:image roundWithRadius:radius backgroundColor:nil];
//    }
//    
//    static func(UIImage *)image:(UIImage *)image roundWithRadius:(CGFloat)radius backgroundColor:(UIColor *)backgroundColor
//    {
//    CGRect rect = CGRectMake(0.f, 0.f, image.size.width, image.size.height);
//    
//    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0.f);
//    
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    
//    if (backgroundColor && ![backgroundColor isEqual:[UIColor clearColor]])
//    {
//    CGContextSetFillColorWithColor(context, backgroundColor.CGColor);
//    CGContextFillRect(context, rect);
//    }
//    
//    [[UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius] addClip];
//    
//    [image drawInRect:rect];
//    
//    UIImage *imageNew = UIGraphicsGetImageFromCurrentImageContext();
//    
//    UIGraphicsEndImageContext();
//    
//    return imageNew;
//    }
//    
//    static func(UIImage *)image:(UIImage *)image cropCenterWithSize:(CGSize)size
//    {
//    return [LGHelper image:image cropCenterWithSize:size backgroundColor:nil];
//    }
//    
//    static func(UIImage *)image:(UIImage *)image cropCenterWithSize:(CGSize)size backgroundColor:(UIColor *)backgroundColor
//    {
//    CGRect rect = CGRectMake(0.f, 0.f, size.width, size.height);
//    
//    UIGraphicsBeginImageContextWithOptions(size, NO, 0.f);
//    
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    
//    if (backgroundColor && ![backgroundColor isEqual:[UIColor clearColor]])
//    {
//    CGContextSetFillColorWithColor(context, backgroundColor.CGColor);
//    CGContextFillRect(context, rect);
//    }
//    
//    int heightDifference = size.height-image.size.height;
//    int widthDifference = size.width-image.size.width;
//    
//    CGRect bounds = CGRectMake(widthDifference/2, heightDifference/2, image.size.width, image.size.height);
//    
//    [image drawInRect:bounds];
//    
//    UIImage *imageNew = UIGraphicsGetImageFromCurrentImageContext();
//    
//    UIGraphicsEndImageContext();
//    
//    return imageNew;
//    }
//    
//    static func(UIImage *)image:(UIImage *)image withMaskImage:(UIImage *)maskImage
//    {
//    CGImageRef imageReference = image.CGImage;
//    CGImageRef maskImageReference = maskImage.CGImage;
//    
//    maskImageReference = CGImageMaskCreate(CGImageGetWidth(maskImageReference),
//    CGImageGetHeight(maskImageReference),
//    CGImageGetBitsPerComponent(maskImageReference),
//    CGImageGetBitsPerPixel(maskImageReference),
//    CGImageGetBytesPerRow(maskImageReference),
//    CGImageGetDataProvider(maskImageReference),
//    NULL,
//    YES);
//    
//    CGImageRef maskedImageReference = CGImageCreateWithMask(imageReference, maskImageReference);
//    CGImageRelease(maskImageReference);
//    
//    UIImage *maskedImage = [UIImage imageWithCGImage:maskedImageReference];
//    CGImageRelease(maskedImageReference);
//    
//    return maskedImage;
//    }
//    
//    static func(UIImage *)imageFromView:(UIView *)view
//    {
//    return [LGHelper imageFromView:view inPixels:NO];
//    }
//    
//    static func(UIImage *)imageFromView:(UIView *)view inPixels:(BOOL)inPixels
//    {
//    UIGraphicsBeginImageContextWithOptions(view.frame.size, NO, (inPixels ? 1.f : 0.f));
//    
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    
//    [view.layer renderInContext:context];
//    
//    UIImage *capturedImage = UIGraphicsGetImageFromCurrentImageContext();
//    
//    UIGraphicsEndImageContext();
//    
//    return capturedImage;
//    }
//    
//    static func(UIColor *)image:(UIImage *)image colorAtPixel:(CGPoint)point
//    {
//    // Cancel if point is outside image coordinates
//    if (!CGRectContainsPoint(CGRectMake(0.0f, 0.0f, image.size.width, image.size.height), point))
//    return nil;
//    
//    // Create a 1x1 pixel byte array and bitmap context to draw the pixel into.
//    // Reference: http://stackoverflow.com/questions/1042830/retrieving-a-pixel-alpha-value-for-a-uiimage
//    NSInteger pointX = trunc(point.x);
//    NSInteger pointY = trunc(point.y);
//    CGImageRef cgImage = image.CGImage;
//    NSUInteger width = image.size.width;
//    NSUInteger height = image.size.height;
//    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
//    int bytesPerPixel = 4;
//    int bytesPerRow = bytesPerPixel * 1;
//    NSUInteger bitsPerComponent = 8;
//    unsigned char pixelData[4] = { 0, 0, 0, 0 };
//    CGContextRef context = CGBitmapContextCreate(pixelData,
//    1,
//    1,
//    bitsPerComponent,
//    bytesPerRow,
//    colorSpace,
//    kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big);
//    CGColorSpaceRelease(colorSpace);
//    CGContextSetBlendMode(context, kCGBlendModeCopy);
//    
//    // Draw the pixel we are interested in onto the bitmap context
//    CGContextTranslateCTM(context, -pointX, pointY-(CGFloat)height);
//    CGContextDrawImage(context, CGRectMake(0.0f, 0.0f, (CGFloat)width, (CGFloat)height), cgImage);
//    CGContextRelease(context);
//    
//    // Convert color values [0..255] to floats [0.0..1.0]
//    CGFloat red   = (CGFloat)pixelData[0] / 255.0f;
//    CGFloat green = (CGFloat)pixelData[1] / 255.0f;
//    CGFloat blue  = (CGFloat)pixelData[2] / 255.0f;
//    CGFloat alpha = (CGFloat)pixelData[3] / 255.0f;
//    
//    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
//    }
//    
//    static func(BOOL)maskAlphaImage:(UIImage *)maskImage pointIsCorrect:(CGPoint)point
//    {
//    UIColor *pixelColor = [LGHelper image:maskImage colorAtPixel:point];
//    CGFloat alpha = 0.0;
//    
//    [pixelColor getRed:NULL green:NULL blue:NULL alpha:&alpha];
//    
//    return alpha > 0.f;
//    }
//    
//    static func(BOOL)maskAlphaImage:(UIImage *)maskImage pointIsCorrect:(CGPoint)point containerSize:(CGSize)containerSize
//    {
//    CGSize imageSize = maskImage.size;
//    
//    point.x *= (containerSize.width != 0) ? (imageSize.width / containerSize.width) : 1;
//    point.y *= (containerSize.height != 0) ? (imageSize.height / containerSize.height) : 1;
//    
//    UIColor *pixelColor = [LGHelper image:maskImage colorAtPixel:point];
//    CGFloat alpha = 0.0;
//    
//    [pixelColor getRed:NULL green:NULL blue:NULL alpha:&alpha];
//    
//    return alpha > 0.f;
//    }
//    
//    static func(BOOL)maskBlackAndWhiteImage:(UIImage *)maskImage pointIsCorrect:(CGPoint)point
//    {
//    UIColor *pixelColor = [LGHelper image:maskImage colorAtPixel:point];
//    
//    return ![pixelColor isEqual:[UIColor blackColor]];
//    }
//    
//    static func(BOOL)maskBlackAndWhiteImage:(UIImage *)maskImage pointIsCorrect:(CGPoint)point containerSize:(CGSize)containerSize
//    {
//    CGSize imageSize = maskImage.size;
//    
//    point.x *= (containerSize.width != 0) ? (imageSize.width / containerSize.width) : 1;
//    point.y *= (containerSize.height != 0) ? (imageSize.height / containerSize.height) : 1;
//    
//    UIColor *pixelColor = [LGHelper image:maskImage colorAtPixel:point];
//    
//    return ![pixelColor isEqual:[UIColor blackColor]];
//    }
//    
//    // MARK: Network Activity Indicator
//    
//    static func(void)networkActivityIndicatorSetHidden:(BOOL)hidden
//    {
//    [UIApplication sharedApplication].networkActivityIndicatorVisible = !hidden;
//    }
//    
//    // MARK: NSUserDefaults clear storage
//    
//    static func(void)userDefaultsClear
//    {
//    [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:[[NSBundle mainBundle] bundleIdentifier]];
//    }
//    
//    // MARK: Screenshot
//    
//    static func(UIImage *)screenshotMakeInPixels:(BOOL)inPixels
//    {
//    UIWindow *window = [[UIApplication sharedApplication].delegate window];
//    
//    UIGraphicsBeginImageContextWithOptions(window.frame.size, NO, (inPixels ? 1.f : 0.f));
//    
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    
//    [window.layer renderInContext:context];
//    
//    UIImage *capturedImage = UIGraphicsGetImageFromCurrentImageContext();
//    
//    UIGraphicsEndImageContext();
//    
//    return capturedImage;
//    }
//    
//    static func(UIImage *)screenshotMakeOfView:(UIView *)view inPixels:(BOOL)inPixels
//    {
//    UIGraphicsBeginImageContextWithOptions(view.frame.size, NO, (inPixels ? 1.f : 0.f));
//    
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    
//    [view.layer renderInContext:context];
//    
//    UIImage *capturedImage = UIGraphicsGetImageFromCurrentImageContext();
//    
//    UIGraphicsEndImageContext();
//    
//    return capturedImage;
//    }
//    
//    // MARK: Keyboard Notifications
//    
//    static func(void)keyboardNotificationsAddToTarget:(id)target selector:(SEL)selector
//    {
//    [[NSNotificationCenter defaultCenter] addObserver:target selector:selector name:UIKeyboardWillShowNotification object:nil];
//    //    [[NSNotificationCenter defaultCenter] addObserver:target selector:selector name:UIKeyboardWillChangeFrameNotification object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:target selector:selector name:UIKeyboardWillHideNotification object:nil];
//    }
//    
//    static func(void)keyboardNotificationsRemoveFromTarget:(id)target selector:(SEL)selector
//    {
//    [[NSNotificationCenter defaultCenter] removeObserver:target name:UIKeyboardWillShowNotification object:nil];
//    //    [[NSNotificationCenter defaultCenter] removeObserver:target name:UIKeyboardWillChangeFrameNotification object:nil];
//    [[NSNotificationCenter defaultCenter] removeObserver:target name:UIKeyboardWillHideNotification object:nil];
//    }
//    
//    static func(void)keyboardNotificationsAddToScrollView:(UIScrollView *)scrollView
//    {
//    if (!scrollView) return;
//    
//    if (!LGHelperShared.keyboardNotificationsScrollViews)
//    LGHelperShared.keyboardNotificationsScrollViews = [NSMutableArray new];
//    
//    if (![LGHelperShared.keyboardNotificationsScrollViews containsObject:scrollView])
//    {
//    [LGHelperShared.keyboardNotificationsScrollViews addObject:scrollView];
//    
//    if (!LGHelperShared.isKeyboardNotificationsExists)
//    {
//    LGHelperShared.keyboardNotificationsExists = YES;
//    [LGHelper keyboardNotificationsAddToTarget:LGHelperShared selector:@selector(keyboardNotification:)];
//    }
//    }
//    }
//    
//    static func(void)keyboardNotificationsRemoveFromScrollView:(UIScrollView *)scrollView
//    {
//    if (!scrollView) return;
//    
//    if ([LGHelperShared.keyboardNotificationsScrollViews containsObject:scrollView])
//    {
//    [LGHelperShared.keyboardNotificationsScrollViews removeObject:scrollView];
//    
//    if (!LGHelperShared.keyboardNotificationsScrollViews.count)
//    {
//    LGHelperShared.keyboardNotificationsScrollViews = nil;
//    
//    if (LGHelperShared.isKeyboardNotificationsExists)
//    {
//    [LGHelper keyboardNotificationsRemoveFromTarget:LGHelperShared selector:@selector(keyboardNotification:)];
//    LGHelperShared.keyboardNotificationsExists = NO;
//    }
//    }
//    }
//    }
//    
//    static func(void)keyboardAnimateWithNotificationUserInfo:(NSDictionary *)notificationUserInfo
//    animations:(void(^)(CGFloat keyboardHeight))animations
//    {
//    CGFloat keyboardHeight = (notificationUserInfo[UIKeyboardFrameEndUserInfoKey] ? [notificationUserInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue].size.height : 0.f);
//    
//    if (!keyboardHeight) return;
//    
//    NSTimeInterval animationDuration = [notificationUserInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
//    int animationCurve = [notificationUserInfo[UIKeyboardAnimationCurveUserInfoKey] intValue];
//    
//    [UIView beginAnimations:nil context:NULL];
//    [UIView setAnimationDuration:animationDuration];
//    [UIView setAnimationCurve:animationCurve];
//    
//    if (animations) animations(keyboardHeight);
//    
//    [UIView commitAnimations];
//    }
//    
//    - (void)keyboardNotification:(NSNotification *)notification
//    {
//    [LGHelper keyboardAnimateWithNotificationUserInfo:notification.userInfo
//    animations:^(CGFloat keyboardHeight)
//    {
//    for (UIScrollView *scrollView in LGHelperShared.keyboardNotificationsScrollViews)
//    {
//    UIEdgeInsets contentInset = scrollView.contentInset;
//    contentInset.bottom = ([notification.name isEqualToString:UIKeyboardWillShowNotification] ? keyboardHeight : 0.f);
//    if (scrollView.contentInset.bottom != contentInset.bottom)
//    {
//    scrollView.contentInset = contentInset;
//    scrollView.scrollIndicatorInsets = contentInset;
//    }
//    }
//    }];
//    }
//    
//    // MARK: Disk capacity
//    
//    static func(uint64_t)diskGetFreeSpace
//    {
//    uint64_t totalSpace = 0.0f;
//    uint64_t totalFreeSpace = 0.0f;
//    NSError *error = nil;
//    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    NSDictionary *dictionary = [[NSFileManager defaultManager] attributesOfFileSystemForPath:[paths lastObject] error: &error];
//    
//    if (dictionary)
//    {
//    NSNumber *fileSystemSizeInBytes = [dictionary objectForKey:NSFileSystemSize];
//    NSNumber *freeFileSystemSizeInBytes = [dictionary objectForKey:NSFileSystemFreeSize];
//    
//    totalSpace = [fileSystemSizeInBytes floatValue];
//    totalFreeSpace = [freeFileSystemSizeInBytes floatValue];
//    
//    NSLog(@"Memory Capacity of %llu MiB with %llu MiB Free memory available.", ((totalSpace/1024ll)/1024ll), ((totalFreeSpace/1024ll)/1024ll));
//}
//else
//{
//    NSLog(@"Error Obtaining System Memory Info: Domain = %@, Code = %ld", [error domain], (long)[error code]);
//}
//
//return totalFreeSpace;
//}
//
//// MARK: MIME Type
//
//static func(NSString *)mimeTypeForPath:(NSString *)path
//{
//    NSString *mimeTypeString;
//    
//    if (path.length && path.pathExtension.length)
//    mimeTypeString = [LGHelper mimeTypeForExtension:path.pathExtension];
//    
//    return mimeTypeString;
//    }
//    
//    static func(NSString *)mimeTypeForExtension:(NSString *)extension
//    {
//        NSString *mimeTypeString;
//        
//        if (extension.length)
//        {
//        CFStringRef extension_ = (__bridge CFStringRef)extension;
//        CFStringRef UTI = UTTypeCreatePreferredIdentifierForTag(kUTTagClassFilenameExtension, extension_, NULL);
//        assert(UTI != NULL);
//        
//        NSString *mimetype = CFBridgingRelease(UTTypeCopyPreferredTagWithClass(UTI, kUTTagClassMIMEType));
//        assert(mimetype != NULL);
//        
//        CFRelease(UTI);
//        
//        mimeTypeString = mimetype;
//        }
//        
//        return mimeTypeString;
//}
//
//// MARK: IP address
//
//static func(NSString *)ipAddressLocal
//{
//    NSString *address = @"error";
//    struct ifaddrs *interfaces = NULL;
//    struct ifaddrs *temp_addr = NULL;
//    int success = 0;
//    
//    // retrieve the current interfaces - returns 0 on success
//    success = getifaddrs(&interfaces);
//    
//    if (success == 0)
//    {
//        // Loop through linked list of interfaces
//        temp_addr = interfaces;
//        
//        while(temp_addr != NULL)
//        {
//            if(temp_addr->ifa_addr->sa_family == AF_INET)
//            {
//                // Get NSString from C String
//                address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)];
//            }
//            
//            temp_addr = temp_addr->ifa_next;
//        }
//    }
//    
//    // Free memory
//    freeifaddrs(interfaces);
//    
//    return address;
//    }
//    
//    static func(NSString *)ipAddressGlobal
//        {
//            NSUInteger an_Integer;
//            NSArray *ipItemsArray;
//            NSString *externalIP;
//            
//            NSURL *ipUrl = [NSURL URLWithString:@"http://www.dyndns.org/cgi-bin/check_ip.cgi"];
//            
//            if (ipUrl)
//            {
//                NSError *error = nil;
//                NSString *theIpHtml = [NSString stringWithContentsOfURL:ipUrl encoding:NSUTF8StringEncoding error:&error];
//                
//                if (!error)
//                {
//                    NSScanner *theScanner;
//                    NSString *text = nil;
//                    
//                    theScanner = [NSScanner scannerWithString:theIpHtml];
//                    
//                    while ([theScanner isAtEnd] == NO)
//                    {
//                        // find start of tag
//                        [theScanner scanUpToString:@"<" intoString:NULL] ;
//                        
//                        // find end of tag
//                        [theScanner scanUpToString:@">" intoString:&text] ;
//                        
//                        // replace the found tag with a space
//                        //(you can filter multi-spaces out later if you wish)
//                        theIpHtml = [theIpHtml stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@>", text]
//                        withString:@" "];
//                        ipItemsArray = [theIpHtml  componentsSeparatedByString:@" "];
//                        an_Integer = [ipItemsArray indexOfObject:@"Address:"];
//                        externalIP =[ipItemsArray objectAtIndex:  ++an_Integer];
//                    }
//                }
//                else NSLog(@"%s Error: %@", __PRETTY_FUNCTION__, error);
//            }
//            
//            return externalIP;
//}
//
//// MARK: MD5 hash
//
//static func(NSString *)md5HashFromData:(NSData *)data
//{
//    NSUInteger length = CC_MD5_DIGEST_LENGTH;
//    
//    unsigned char result[length];
//    
//    CC_MD5(data.bytes, (CC_LONG)data.length, result);
//    
//    NSMutableString *output = [NSMutableString  stringWithCapacity:length * 2];
//    
//    for(int i = 0; i < length; i++)
//    [output appendFormat:@"%02x", result[i]];
//    
//    return output;
//    }
//    
//    static func(NSString *)md5HashFromString:(NSString *)string
//{
//    NSUInteger length = CC_MD5_DIGEST_LENGTH;
//    
//    const char *cStr = [string UTF8String];
//    unsigned char result[length];
//    
//    CC_MD5(cStr, (CC_LONG)strlen(cStr), result);
//    
//    NSMutableString *output = [NSMutableString  stringWithCapacity:length * 2];
//    
//    for(int i = 0; i < length; i++)
//    [output appendFormat:@"%02x", result[i]];
//    
//    return output;
//}
//
//// MARK: SHA hash
//
//static func(NSString *)shaHashFromData:(NSData *)data length:(NSUInteger)length
//{
//    unsigned char result[length];
//    
//    CC_SHA1(data.bytes, (CC_LONG)data.length, result);
//    
//    NSMutableString *output = [NSMutableString  stringWithCapacity:length * 2];
//    
//    for(int i = 0; i < length; i++)
//    [output appendFormat:@"%02x", result[i]];
//    
//    return output;
//    }
//    
//    static func(NSString *)sha1HashFromData:(NSData *)data
//{
//    return [LGHelper shaHashFromData:data length:CC_SHA1_DIGEST_LENGTH];
//    }
//    
//    static func(NSString *)sha224HashFromData:(NSData *)data
//{
//    return [LGHelper shaHashFromData:data length:CC_SHA224_DIGEST_LENGTH];
//    }
//    
//    static func(NSString *)sha256HashFromData:(NSData *)data
//{
//    return [LGHelper shaHashFromData:data length:CC_SHA256_DIGEST_LENGTH];
//    }
//    
//    static func(NSString *)sha384HashFromData:(NSData *)data
//{
//    return [LGHelper shaHashFromData:data length:CC_SHA384_DIGEST_LENGTH];
//    }
//    
//    static func(NSString *)sha512HashFromData:(NSData *)data
//{
//    return [LGHelper shaHashFromData:data length:CC_SHA512_DIGEST_LENGTH];
//    }
//    
//    static func(NSString *)shaHashFromString:(NSString *)string length:(NSUInteger)length
//{
//    const char *cStr = [string UTF8String];
//    unsigned char result[length];
//    
//    CC_SHA1(cStr, (CC_LONG)strlen(cStr), result);
//    
//    NSMutableString *output = [NSMutableString  stringWithCapacity:length * 2];
//    
//    for(int i = 0; i < length; i++)
//    [output appendFormat:@"%02x", result[i]];
//    
//    return output;
//    }
//    
//    static func(NSString *)sha1HashFromString:(NSString *)string
//{
//    return [LGHelper shaHashFromString:string length:CC_SHA1_DIGEST_LENGTH];
//    }
//    
//    static func(NSString *)sha224HashFromString:(NSString *)string
//{
//    return [LGHelper shaHashFromString:string length:CC_SHA224_DIGEST_LENGTH];
//    }
//    
//    static func(NSString *)sha256HashFromString:(NSString *)string
//{
//    return [LGHelper shaHashFromString:string length:CC_SHA256_DIGEST_LENGTH];
//    }
//    
//    static func(NSString *)sha384HashFromString:(NSString *)string
//{
//    return [LGHelper shaHashFromString:string length:CC_SHA384_DIGEST_LENGTH];
//    }
//    
//    static func(NSString *)sha512HashFromString:(NSString *)string
//{
//    return [LGHelper shaHashFromString:string length:CC_SHA512_DIGEST_LENGTH];
//}
//
//// MARK: XOR Crypto
//
//static func(NSData *)xorCryptedData:(NSData *)data key:(NSString *)key
//{
//    NSMutableData *result = data.mutableCopy;
//    
//    // Get pointer to data to obfuscate
//    char *dataPtr = (char *)[result mutableBytes];
//    
//    // Get pointer to key data
//    char *keyData = (char *)[[key dataUsingEncoding:NSUTF8StringEncoding] bytes];
//    
//    // Points to each char in sequence in the key
//    char *keyPtr = keyData;
//    int keyIndex = 0;
//    
//    // For each character in data, xor with current value in key
//    for (int x = 0; x < data.length; x++)
//    {
//        // Replace current character in data with
//        // current character xor'd with current key value.
//        // Bump each pointer to the next character
//        *dataPtr = *dataPtr ^ *keyPtr;
//        dataPtr++;
//        keyPtr++;
//        
//        // If at end of key data, reset count and
//        // set key pointer back to start of key value
//        if (++keyIndex == [key length])
//        keyIndex = 0, keyPtr = keyData;
//    }
//    
//    return result;
//    }
//    
//    static func(NSString *)xorCryptedString:(NSString *)string key:(NSString *)key
//{
//    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
//    
//    NSData *resultData = [LGHelper xorCryptedData:data key:key];
//    
//    NSString *resultString = [[NSString alloc] initWithData:resultData encoding:NSUTF8StringEncoding];
//    
//    return resultString;
//}
//
//// MARK: AES Crypto
//
//static func(NSData *)aesCryptedWithKeySize:(NSUInteger)keySize operation:(CCOperation)operation data:(NSData *)data key:(NSString *)key
//{
//    // 'key' should be 32 bytes for AES256, will be null-padded otherwise
//    // 'key' should be 24 bytes for AES192, will be null-padded otherwise
//    // 'key' should be 16 bytes for AES128, will be null-padded otherwise
//    char keyPtr[keySize+1]; // room for terminator (unused)
//    bzero(keyPtr, sizeof(keyPtr)); // fill with zeroes (for padding)
//    
//    // fetch key data
//    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
//    
//    NSUInteger dataLength = [data length];
//    
//    //See the doc: For block ciphers, the output size will always be less than or
//    //equal to the input size plus the size of one block.
//    //That's why we need to add the size of one block here
//    size_t bufferSize = dataLength + kCCBlockSizeAES128;
//    void *buffer = malloc(bufferSize);
//    
//    size_t numBytesEncrypted = 0;
//    CCCryptorStatus cryptStatus = CCCrypt(operation,
//                                          kCCAlgorithmAES128,
//                                          kCCOptionPKCS7Padding,
//                                          keyPtr,
//                                          keySize,
//                                          NULL /* initialization vector (optional) */,
//        [data bytes],
//        dataLength, /* input */
//        buffer,
//        bufferSize, /* output */
//        &numBytesEncrypted);
//    if (cryptStatus == kCCSuccess)
//    {
//        //the returned NSData takes ownership of the buffer and will free it on deallocation
//        return [NSData dataWithBytesNoCopy:buffer length:numBytesEncrypted];
//    }
//    
//    free(buffer); //free the buffer;
//    return nil;
//    }
//    
//    static func(NSData *)aes128EncryptedData:(NSData *)data key:(NSString *)key
//{
//    return [LGHelper aesCryptedWithKeySize:kCCKeySizeAES128 operation:kCCEncrypt data:data key:key];
//    }
//    
//    static func(NSData *)aes128DecryptedData:(NSData *)data key:(NSString *)key
//{
//    return [LGHelper aesCryptedWithKeySize:kCCKeySizeAES128 operation:kCCDecrypt data:data key:key];
//    }
//    
//    static func(NSData *)aes192EncryptedData:(NSData *)data key:(NSString *)key
//{
//    return [LGHelper aesCryptedWithKeySize:kCCKeySizeAES192 operation:kCCEncrypt data:data key:key];
//    }
//    
//    static func(NSData *)aes192DecryptedData:(NSData *)data key:(NSString *)key
//{
//    return [LGHelper aesCryptedWithKeySize:kCCKeySizeAES192 operation:kCCDecrypt data:data key:key];
//    }
//    
//    static func(NSData *)aes256EncryptedData:(NSData *)data key:(NSString *)key
//{
//    return [LGHelper aesCryptedWithKeySize:kCCKeySizeAES256 operation:kCCEncrypt data:data key:key];
//    }
//    
//    static func(NSData *)aes256DecryptedData:(NSData *)data key:(NSString *)key
//{
//    return [LGHelper aesCryptedWithKeySize:kCCKeySizeAES256 operation:kCCDecrypt data:data key:key];
//}
//
//// MARK: GZIP
//
//static func(NSData *)gZippedData:(NSData *)data compressionLevel:(float)level
//{
//    if (data.length)
//    {
//        z_stream stream;
//        stream.zalloc = Z_NULL;
//        stream.zfree = Z_NULL;
//        stream.opaque = Z_NULL;
//        stream.avail_in = (uint)[data length];
//        stream.next_in = (Bytef *)[data bytes];
//        stream.total_out = 0;
//        stream.avail_out = 0;
//        
//        int compression = (level < 0.0f)? Z_DEFAULT_COMPRESSION: (int)(roundf(level * 9));
//        
//        if (deflateInit2(&stream, compression, Z_DEFLATED, 31, 8, Z_DEFAULT_STRATEGY) == Z_OK)
//        {
//            NSMutableData *mutableData = [NSMutableData dataWithLength:kLGHelperGZIPChunkSize];
//            
//            while (stream.avail_out == 0)
//            {
//                if (stream.total_out >= [mutableData length])
//                mutableData.length += kLGHelperGZIPChunkSize;
//                
//                stream.next_out = (uint8_t *)[mutableData mutableBytes] + stream.total_out;
//                stream.avail_out = (uInt)([mutableData length] - stream.total_out);
//                deflate(&stream, Z_FINISH);
//            }
//            
//            deflateEnd(&stream);
//            mutableData.length = stream.total_out;
//            
//            return mutableData;
//        }
//    }
//    
//    return nil;
//    }
//    
//    static func(NSData *)gZippedData:(NSData *)data
//{
//    return [LGHelper gZippedData:data compressionLevel:-1.f];
//    }
//    
//    static func(NSData *)gUnZippedData:(NSData *)data
//{
//    if (data.length)
//    {
//        z_stream stream;
//        stream.zalloc = Z_NULL;
//        stream.zfree = Z_NULL;
//        stream.avail_in = (uint)[data length];
//        stream.next_in = (Bytef *)[data bytes];
//        stream.total_out = 0;
//        stream.avail_out = 0;
//        
//        if (inflateInit2(&stream, 47) == Z_OK)
//        {
//            NSMutableData *mutableData = [NSMutableData dataWithLength:(NSUInteger)([data length] * 1.5)];
//            
//            int status = Z_OK;
//            
//            while (status == Z_OK)
//            {
//                if (stream.total_out >= [mutableData length])
//                mutableData.length += [data length] / 2;
//                
//                stream.next_out = (uint8_t *)[mutableData mutableBytes] + stream.total_out;
//                stream.avail_out = (uInt)([mutableData length] - stream.total_out);
//                status = inflate(&stream, Z_SYNC_FLUSH);
//            }
//            
//            if (inflateEnd(&stream) == Z_OK &&
//                status == Z_STREAM_END)
//            {
//                mutableData.length = stream.total_out;
//                
//                return mutableData;
//            }
//        }
//    }
//    
//    return nil;
//}
//
//// MARK: Open URL's
//
//static func(void)urlOpenInSafari:(NSURL *)url
//{
//    [[UIApplication sharedApplication] openURL:url];
//    }
//    
//    static func(void)phoneCallToNumber:(NSString *)number
//{
//    NSString *newString = [LGHelper stringByRemovingAllExeptPhoneSymbols:number];
//    
//    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel:%@", newString]]];
//    }
//    
//    static func(void)phoneCallWithConfirmationToNumber:(NSString *)number
//{
//    NSString *newString = [LGHelper stringByRemovingAllExeptPhoneSymbols:number];
//    
//    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"telprompt:%@", newString]]];
//    }
//    
//    static func(void)emailSendToAddress:(NSString *)address
//{
//    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"mailto:%@", address]]];
//}
//
//// MARK: Locations
//
//static func(void)addressOpenOnMap:(NSString *)address
//{
//    Class mapItemClass = [MKMapItem class];
//    
//    if (mapItemClass && [mapItemClass respondsToSelector:@selector(openMapsWithItems:launchOptions:)])
//    {
//        CLGeocoder *geocoder = [CLGeocoder new];
//        
//        [geocoder geocodeAddressString:address
//            completionHandler:^(NSArray *placemarks, NSError *error)
//            {
//            // Convert the CLPlacemark to an MKPlacemark
//            // Note: There's no error checking for a failed geocode
//            CLPlacemark *geocodedPlacemark = [placemarks objectAtIndex:0];
//            
//            MKPlacemark *placemark = [[MKPlacemark alloc] initWithCoordinate:geocodedPlacemark.location.coordinate
//            addressDictionary:geocodedPlacemark.addressDictionary];
//            
//            // Create a map item for the geocoded address to pass to Maps app
//            MKMapItem *mapItem = [[MKMapItem alloc] initWithPlacemark:placemark];
//            [mapItem setName:geocodedPlacemark.name];
//            
//            [mapItem openInMapsWithLaunchOptions:nil];
//            }];
//    }
//    }
//    
//    static func(void)addressOpenOnMapWithTrack:(NSString *)address
//{
//    Class mapItemClass = [MKMapItem class];
//    
//    if (mapItemClass && [mapItemClass respondsToSelector:@selector(openMapsWithItems:launchOptions:)])
//    {
//        CLGeocoder *geocoder = [CLGeocoder new];
//        
//        [geocoder geocodeAddressString:address
//            completionHandler:^(NSArray *placemarks, NSError *error)
//            {
//            // Convert the CLPlacemark to an MKPlacemark
//            // Note: There's no error checking for a failed geocode
//            CLPlacemark *geocodedPlacemark = [placemarks objectAtIndex:0];
//            
//            MKPlacemark *placemark = [[MKPlacemark alloc] initWithCoordinate:geocodedPlacemark.location.coordinate
//            addressDictionary:geocodedPlacemark.addressDictionary];
//            
//            // Create a map item for the geocoded address to pass to Maps app
//            MKMapItem *mapItem = [[MKMapItem alloc] initWithPlacemark:placemark];
//            
//            [mapItem setName:geocodedPlacemark.name];
//            
//            // Set the directions mode to "Driving"
//            // Can use MKLaunchOptionsDirectionsModeWalking instead
//            NSDictionary *launchOptions = @{MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving};
//            
//            // Get the "Current User Location" MKMapItem
//            MKMapItem *currentLocationMapItem = [MKMapItem mapItemForCurrentLocation];
//            
//            // Pass the current location and destination map items to the Maps app
//            // Set the direction mode in the launchOptions dictionary
//            [MKMapItem openMapsWithItems:@[currentLocationMapItem, mapItem] launchOptions:launchOptions];
//            }];
//    }
//    }
//    
//    static func(void)coordinateOpenOnMap:(CLLocationCoordinate2D)coordinate
//{
//    Class mapItemClass = [MKMapItem class];
//    
//    if (mapItemClass && [mapItemClass respondsToSelector:@selector(openMapsWithItems:launchOptions:)])
//    {
//        // Create an MKMapItem to pass to the Maps app
//        MKPlacemark *placemark = [[MKPlacemark alloc] initWithCoordinate:coordinate
//            addressDictionary:nil];
//        
//        MKMapItem *mapItem = [[MKMapItem alloc] initWithPlacemark:placemark];
//        
//        [mapItem setName:@"My Place"];
//        
//        [mapItem openInMapsWithLaunchOptions:nil];
//    }
//    }
//    
//    static func(void)coordinateOpenOnMapTrack:(CLLocationCoordinate2D)coordinate
//{
//    Class mapItemClass = [MKMapItem class];
//    
//    if (mapItemClass && [mapItemClass respondsToSelector:@selector(openMapsWithItems:launchOptions:)])
//    {
//        // Create an MKMapItem to pass to the Maps app
//        MKPlacemark *placemark = [[MKPlacemark alloc] initWithCoordinate:coordinate
//            addressDictionary:nil];
//        
//        MKMapItem *mapItem = [[MKMapItem alloc] initWithPlacemark:placemark];
//        
//        [mapItem setName:@"My Place"];
//        
//        // Set the directions mode to "Walking"
//        // Can use MKLaunchOptionsDirectionsModeDriving instead
//        NSDictionary *launchOptions = @{MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeWalking};
//        
//        // Get the "Current User Location" MKMapItem
//        MKMapItem *currentLocationMapItem = [MKMapItem mapItemForCurrentLocation];
//        
//        // Pass the current location and destination map items to the Maps app
//        // Set the direction mode in the launchOptions dictionary
//        [MKMapItem openMapsWithItems:@[currentLocationMapItem, mapItem]
//        launchOptions:launchOptions];
//    }
//}
//
//// MARK: Calendar
//
//static func(void)calendarAddEventWithTitle:(NSString *)title
//startDate:(NSDate *)startDate
//duration:(NSTimeInterval)duration
//completionHandler:(void(^)(BOOL accessGranted, NSString *identifier))completionHandler
//{
//    EKEventStore *store = [EKEventStore new];
//    
//    [store requestAccessToEntityType:EKEntityTypeEvent
//        completion:^(BOOL granted, NSError *error)
//        {
//        if (!granted || error)
//        {
//        dispatch_async_main_safe(^(void)
//        {
//        if (completionHandler) completionHandler(granted, nil);
//        });
//        return;
//        }
//        
//        // -----
//        
//        NSDate *endDate = [startDate dateByAddingTimeInterval:duration];
//        
//        EKCalendar *calendar = [store defaultCalendarForNewEvents];
//        
//        NSPredicate *predicate = [store predicateForEventsWithStartDate:startDate endDate:endDate calendars:@[calendar]];
//        
//        NSArray *matchesEvents = [store eventsMatchingPredicate:predicate];
//        
//        EKEvent *mathesEvent = nil;
//        
//        for (EKEvent *event in matchesEvents)
//        {
//        if ([event.title isEqualToString:title])
//        mathesEvent = event;
//        }
//        
//        // -----
//        
//        if (!mathesEvent)
//        {
//        EKEvent *event = [EKEvent eventWithEventStore:store];
//        event.title = title;
//        event.startDate = startDate;
//        event.endDate = endDate;
//        event.calendar = calendar;
//        NSError *err = nil;
//        [store saveEvent:event span:EKSpanThisEvent commit:YES error:&err];
//        
//        dispatch_async_main_safe(^(void)
//        {
//        if (completionHandler) completionHandler(granted, event.eventIdentifier);
//        });
//        }
//        else
//        {
//        dispatch_async_main_safe(^(void)
//        {
//        if (completionHandler) completionHandler(granted, mathesEvent.eventIdentifier);
//        });
//        }
//        }];
//    }
//    
//    static func(void)calendarRemoveEventWithId:(NSString *)identifier
//completionHandler:(void(^)(BOOL accessGranted))completionHandler
//{
//    EKEventStore *store = [EKEventStore new];
//    
//    [store requestAccessToEntityType:EKEntityTypeEvent
//        completion:^(BOOL granted, NSError *error)
//        {
//        if (!granted || error)
//        {
//        dispatch_async_main_safe(^(void)
//        {
//        if (completionHandler) completionHandler(granted);
//        });
//        return;
//        }
//        
//        EKEvent *eventToRemove = [store eventWithIdentifier:identifier];
//        
//        if (eventToRemove)
//        {
//        NSError* err = nil;
//        [store removeEvent:eventToRemove span:EKSpanThisEvent commit:YES error:&err];
//        }
//        
//        dispatch_async_main_safe(^(void)
//        {
//        if (completionHandler) completionHandler(granted);
//        });
//        }];
//    }
//    
//    static func(void)calendarRemoveEventWithTitle:(NSString *)title
//startDate:(NSDate *)startDate
//duration:(NSTimeInterval)duration
//completionHandler:(void(^)(BOOL accessGranted))completionHandler
//{
//    EKEventStore *store = [EKEventStore new];
//    
//    [store requestAccessToEntityType:EKEntityTypeEvent
//        completion:^(BOOL granted, NSError *error)
//        {
//        if (!granted || error)
//        {
//        dispatch_async_main_safe(^(void)
//        {
//        if (completionHandler) completionHandler(granted);
//        });
//        return;
//        }
//        
//        // -----
//        
//        NSDate *endDate = [startDate dateByAddingTimeInterval:duration];
//        
//        EKCalendar *calendar = [store defaultCalendarForNewEvents];
//        
//        NSPredicate *predicate = [store predicateForEventsWithStartDate:startDate endDate:endDate calendars:@[calendar]];
//        
//        NSArray *matchesEvents = [store eventsMatchingPredicate:predicate];
//        
//        EKEvent *mathesEvent = nil;
//        
//        for (EKEvent *event in matchesEvents)
//        {
//        if ([event.title isEqualToString:title])
//        mathesEvent = event;
//        }
//        
//        // -----
//        
//        if (mathesEvent)
//        {
//        NSError* err = nil;
//        [store removeEvent:mathesEvent span:EKSpanThisEvent commit:YES error:&err];
//        }
//        
//        dispatch_async_main_safe(^(void)
//        {
//        if (completionHandler) completionHandler(granted);
//        });
//        }];
//}
//
//// MARK: Address Book
//
//static func(void)addressBookAddContactWithImage:(UIImage *)image
//firstName:(NSString *)firstName
//lastName:(NSString *)lastName
//middleName:(NSString *)middleName
//nickname:(NSString *)nickname
//organization:(NSString *)organization
//jobTitle:(NSString *)jobTitle
//department:(NSString *)department
//birthday:(NSDate *)birthday
//phonesMobile:(NSArray *)phonesMobile
//phonesHome:(NSArray *)phonesHome
//email:(NSString *)email
//site:(NSString *)site
//country:(NSString *)country
//region:(NSString *)region
//city:(NSString *)city
//street:(NSString *)street
//zip:(NSString *)zip
//note:(NSString *)note
//completionHandler:(void(^)(BOOL accessGranted, NSString *identifier))completionHandler
//{
//    ABAddressBookRef addressBook = ABAddressBookCreateWithOptions(NULL, NULL); // create address book record
//    
//    ABAddressBookRequestAccessWithCompletion(addressBook, ^(bool granted, CFErrorRef error)
//        {
//            if (!granted || error)
//            {
//                dispatch_async_main_safe(^(void)
//                    {
//                        if (completionHandler) completionHandler(granted, nil);
//                    });
//                return;
//            }
//            
//            // -----
//            
//            ABRecordRef person = ABPersonCreate(); // create a person
//            
//            // -----
//            
//            NSData *dataRef = UIImagePNGRepresentation(image);
//            ABPersonSetImageData(person, (__bridge CFDataRef)dataRef, &error);
//            
//            // -----
//            
//            if (firstName.length)       ABRecordSetValue(person, kABPersonFirstNameProperty, (__bridge CFStringRef)firstName, &error);
//            if (lastName.length)        ABRecordSetValue(person, kABPersonLastNameProperty, (__bridge CFStringRef)lastName, &error);
//            if (middleName.length)      ABRecordSetValue(person, kABPersonMiddleNameProperty, (__bridge CFStringRef)middleName, &error);
//            if (nickname.length)        ABRecordSetValue(person, kABPersonNicknameProperty, (__bridge CFStringRef)nickname, &error);
//            if (organization.length)    ABRecordSetValue(person, kABPersonOrganizationProperty, (__bridge CFStringRef)organization, &error);
//            if (jobTitle.length)        ABRecordSetValue(person, kABPersonJobTitleProperty, (__bridge CFStringRef)jobTitle, &error);
//            if (department.length)      ABRecordSetValue(person, kABPersonDepartmentProperty, (__bridge CFStringRef)department, &error);
//            if (birthday)               ABRecordSetValue(person, kABPersonBirthdayProperty, (__bridge CFDateRef)birthday, &error);
//            if (note.length)            ABRecordSetValue(person, kABPersonNoteProperty, (__bridge CFStringRef)note, &error);
//            
//            // -----
//            
//            if (phonesMobile.count || phonesHome.count)
//            {
//                ABMutableMultiValueRef phoneMultiValue = ABMultiValueCreateMutable(kABPersonPhoneProperty);
//                
//                if (phonesMobile.count)
//                for (NSString *phone in phonesMobile)
//                    ABMultiValueAddValueAndLabel(phoneMultiValue, (__bridge CFStringRef)phone, kABPersonPhoneMobileLabel, NULL);
//                
//                if (phonesHome.count)
//                for (NSString *phone in phonesHome)
//                    ABMultiValueAddValueAndLabel(phoneMultiValue, (__bridge CFStringRef)phone, kABPersonPhoneMainLabel, NULL);
//                
//                ABRecordSetValue(person, kABPersonPhoneProperty, phoneMultiValue, nil);
//                CFRelease(phoneMultiValue);
//            }
//            
//            // -----
//            
//            if (country.length || region.length || city.length || street.length || zip.length)
//            {
//                ABMutableMultiValueRef addressMultiValue = ABMultiValueCreateMutable(kABMultiDictionaryPropertyType);
//                
//                if (country.length) ABMultiValueAddValueAndLabel(addressMultiValue, (__bridge CFStringRef)country, kABPersonAddressCountryKey, NULL);
//                if (region.length)  ABMultiValueAddValueAndLabel(addressMultiValue, (__bridge CFStringRef)region, kABPersonAddressStateKey, NULL);
//                if (city.length)    ABMultiValueAddValueAndLabel(addressMultiValue, (__bridge CFStringRef)city, kABPersonAddressCityKey, NULL);
//                if (street.length)  ABMultiValueAddValueAndLabel(addressMultiValue, (__bridge CFStringRef)street, kABPersonAddressStreetKey, NULL);
//                if (zip.length)     ABMultiValueAddValueAndLabel(addressMultiValue, (__bridge CFStringRef)zip, kABPersonAddressZIPKey, NULL);
//                
//                ABRecordSetValue(person, kABPersonAddressProperty, addressMultiValue, &error);
//                CFRelease(addressMultiValue);
//            }
//            
//            // -----
//            
//            if (email.length)
//            {
//                ABMutableMultiValueRef emailMultiValue = ABMultiValueCreateMutable(kABMultiStringPropertyType);
//                
//                ABMultiValueAddValueAndLabel(emailMultiValue, (__bridge CFStringRef)email, kABHomeLabel, NULL);
//                
//                ABRecordSetValue(person, kABPersonEmailProperty, emailMultiValue, &error);
//            }
//            
//            // -----
//            
//            if (site.length)
//            {
//                ABMutableMultiValueRef siteMultiValue = ABMultiValueCreateMutable(kABMultiStringPropertyType);
//                
//                ABMultiValueAddValueAndLabel(siteMultiValue, (__bridge CFStringRef)site, kABHomeLabel, NULL);
//                
//                ABRecordSetValue(person, kABPersonURLProperty, siteMultiValue, &error);
//            }
//            
//            // -----
//            
//            ABAddressBookAddRecord(addressBook, person, &error); //add the new person to the record
//            
//            ABAddressBookSave(addressBook, &error); //save the record
//            
//            ABRecordID identifier = ABRecordGetRecordID(person);
//            
//            dispatch_async_main_safe(^(void)
//                {
//                    if (completionHandler) completionHandler(granted, [NSString stringWithFormat:@"%i", (int)identifier]);
//                });
//    });
//}
//
//// MARK: Cookies
//
//static func(void)cookiesClear
//{
//    NSHTTPCookieStorage *storage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
//    
//    for (NSHTTPCookie *cookie in [storage cookies])
//        [storage deleteCookie:cookie];
//}
//
//// MARK: Strings
//
//static func(NSString *)stringByCapitalizingFirstLetter:(NSString *)string
//{
//    return [string stringByReplacingCharactersInRange:NSMakeRange(0, 1) withString:[string substringToIndex:1].uppercaseString];
//    }
//    
//    static func(NSString *)stringByRemovingAllWhitespacesAndNewLine:(NSString *)string
//{
//    return [[string componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] componentsJoinedByString:@""];
//    }
//    
//    static func(NSString *)stringByRemovingAllNumbers:(NSString *)string
//{
//    return [[string componentsSeparatedByCharactersInSet:[NSCharacterSet decimalDigitCharacterSet]] componentsJoinedByString:@""];
//    }
//    
//    static func(NSString *)stringByRemovingAllExeptNumbers:(NSString *)string
//{
//    return [[string componentsSeparatedByCharactersInSet:[[NSCharacterSet decimalDigitCharacterSet] invertedSet]] componentsJoinedByString:@""];
//    }
//    
//    static func(NSString *)stringByRemovingAllExeptPhoneSymbols:(NSString *)string
//{
//    return [[string componentsSeparatedByCharactersInSet:[[NSCharacterSet characterSetWithCharactersInString:@"+1234567890"] invertedSet]] componentsJoinedByString:@""];
//    }
//    
//    static func(NSString *)string:(NSString *)string byRemovingAllExeptSymbols:(NSString *)symbols
//{
//    return [[string componentsSeparatedByCharactersInSet:[[NSCharacterSet characterSetWithCharactersInString:symbols] invertedSet]] componentsJoinedByString:@""];
//    }
//    
//    static func(NSString *)stringWithNonBreakingSpace
//        {
//            return @"\u00a0";
//}
//
//// MARK: Unicode
//
///** Unicode to normal text */
//static func(NSString *)stringByDecodingHTMLEntitiesInString:(NSString *)input
//{
//    NSMutableString *results = [NSMutableString string];
//    
//    NSScanner *scanner = [NSScanner scannerWithString:input];
//    [scanner setCharactersToBeSkipped:nil];
//    
//    while (![scanner isAtEnd])
//    {
//        NSString *temp;
//        
//        if ([scanner scanUpToString:@"&" intoString:&temp]) [results appendString:temp];
//        
//        if ([scanner scanString:@"&" intoString:NULL])
//        {
//            BOOL valid = YES;
//            unsigned c = 0;
//            NSUInteger savedLocation = [scanner scanLocation];
//            
//            if ([scanner scanString:@"#" intoString:NULL])
//            {
//                // it's a numeric entity
//                if ([scanner scanString:@"x" intoString:NULL])
//                {
//                    // hexadecimal
//                    unsigned int value;
//                    
//                    if ([scanner scanHexInt:&value]) c = value;
//                    
//                    else valid = NO;
//                }
//                else
//                {
//                    // decimal
//                    int value;
//                    
//                    if ([scanner scanInt:&value] && value >= 0) c = value;
//                    
//                    else valid = NO;
//                }
//                
//                if (![scanner scanString:@";" intoString:NULL])
//                {
//                    // not ;-terminated, bail out and emit the whole entity
//                    valid = NO;
//                }
//            }
//            else
//            {
//                if (![scanner scanUpToString:@";" intoString:&temp])
//                {
//                    // &; is not a valid entity
//                    valid = NO;
//                }
//                else if (![scanner scanString:@";" intoString:NULL])
//                {
//                    // there was no trailing ;
//                    valid = NO;
//                }
//                else if ([temp isEqualToString:@"amp"]) c = '&';
//                else if ([temp isEqualToString:@"quot"]) c = '"';
//                else if ([temp isEqualToString:@"lt"]) c = '<';
//                else if ([temp isEqualToString:@"gt"]) c = '>';
//                else
//                {
//                    // unknown entity
//                    valid = NO;
//                }
//            }
//            if (!valid)
//            {
//                // we errored, just emit the whole thing raw
//                [results appendString:[input substringWithRange:NSMakeRange(savedLocation, [scanner scanLocation]-savedLocation)]];
//            }
//            else [results appendFormat:@"%C", (unichar)c];
//        }
//    }
//    return results;
//}
//
//// MARK: Animations
//
//static func(void)animateStandardWithAnimations:(void(^)())animations completion:(void(^)(BOOL finished))completion
//{
//    [LGHelper animateStandardWithDuration:0.5 delay:0.0 animations:animations completion:completion];
//    }
//    
//    static func(void)animateStandardWithDuration:(NSTimeInterval)duration animations:(void(^)())animations completion:(void(^)(BOOL finished))completion
//{
//    [LGHelper animateStandardWithDuration:duration delay:0.0 animations:animations completion:completion];
//    }
//    
//    static func(void)animateStandardWithDelay:(NSTimeInterval)delay animations:(void(^)())animations completion:(void(^)(BOOL finished))completion
//{
//    [LGHelper animateStandardWithDuration:0.5 delay:delay animations:animations completion:completion];
//    }
//    
//    static func(void)animateStandardWithDuration:(NSTimeInterval)duration delay:(NSTimeInterval)delay animations:(void(^)())animations completion:(void(^)(BOOL finished))completion
//{
//    if (kSystemVersion >= 7.0)
//    {
//        [UIView animateWithDuration:duration
//            delay:delay
//            usingSpringWithDamping:1.f
//            initialSpringVelocity:0.5
//            options:0
//            animations:animations
//            completion:completion];
//    }
//    else
//    {
//        [UIView animateWithDuration:duration*kAnimationSpringToNormal
//            delay:delay
//            options:UIViewAnimationOptionCurveEaseInOut
//            animations:animations
//            completion:completion];
//    }
//}
//
//// MARK: Colors
//
///** 0-255, 0-255, 0-255, 0.f-1.f */
//static func(UIColor *)colorWithRGB_red:(NSUInteger)red green:(NSUInteger)green blue:(NSUInteger)blue alpha:(CGFloat)alpha
//{
//    return [UIColor colorWithRed:(CGFloat)red/255.f green:(CGFloat)green/255.f blue:(CGFloat)blue/255.f alpha:alpha];
//    }
//    
//    /** #000000 */
//    static func(UIColor *)colorWithHEX:(UInt32)hex
//{
//    int red = (hex >> 16) & 0xFF;
//    int green = (hex >> 8) & 0xFF;
//    int blue = (hex) & 0xFF;
//    
//    return [UIColor colorWithRed:red/255.f green:green/255.f blue:blue/255.f alpha:1.f];
//    }
//    
//    /** #000000 */
//    static func(NSUInteger)colorHEX:(UIColor *)color
//{
//    CGFloat red, green, blue, alpha;
//    [color getRed:&red green:&green blue:&blue alpha:&alpha];
//    
//    NSInteger ired, igreen, iblue;
//    ired = roundf(red * 255);
//    igreen = roundf(green * 255);
//    iblue = roundf(blue * 255);
//    
//    NSUInteger result = (ired << 16) | (igreen << 8) | iblue;
//    return result;
//    }
//    
//    static func(UIColor *)colorMixedInRGB:(UIColor *)color1 andColor:(UIColor *)color2 percent:(CGFloat)percent
//{
//    CGFloat mixSize = 100;
//    
//    CGFloat r1, g1, b1, r2, g2, b2, r3, g3, b3, empty;
//    
//    [color1 getRed:&r1 green:&g1 blue:&b1 alpha:&empty];
//    [color2 getRed:&r2 green:&g2 blue:&b2 alpha:&empty];
//    
//    CGFloat mixStepR = (r2 - r1) / mixSize;
//    CGFloat mixStepG = (g2 - g1) / mixSize;
//    CGFloat mixStepB = (b2 - b1) / mixSize;
//    
//    r3 = r1 + mixStepR * percent;
//    g3 = g1 + mixStepG * percent;
//    b3 = b1 + mixStepB * percent;
//    
//    return [UIColor colorWithRed:r3 green:g3 blue:b3 alpha:1];
//    }
//    
//    static func(UIColor *)colorMixedInLAB:(UIColor *)color1 andColor:(UIColor *)color2 percent:(CGFloat)percent
//{
//    if (percent <= 0) return color1;
//    else if (percent >= 100) return color2;
//    else
//    {
//        CGFloat mixSize = 100;
//        
//        NSArray *array1 = [self colorConvertRGBtoLAB:color1];
//        NSArray *array2 = [self colorConvertRGBtoLAB:color2];
//        
//        NSArray *array3 = [NSArray arrayWithObjects:
//            [NSNumber numberWithFloat:[[array1 objectAtIndex:0] floatValue] - (([[array1 objectAtIndex:0] floatValue] - [[array2 objectAtIndex:0] floatValue]) * (percent / mixSize))],
//            [NSNumber numberWithFloat:[[array1 objectAtIndex:1] floatValue] - (([[array1 objectAtIndex:1] floatValue] - [[array2 objectAtIndex:1] floatValue]) * (percent / mixSize))],
//            [NSNumber numberWithFloat:[[array1 objectAtIndex:2] floatValue] - (([[array1 objectAtIndex:2] floatValue] - [[array2 objectAtIndex:2] floatValue]) * (percent / mixSize))], nil];
//        
//        return [self colorConvertLABtoRGB:array3];
//    }
//    }
//    
//    /** 0-255 */
//    static func(UIColor *)color:(UIColor *)color darkerOnRGB:(NSUInteger)k
//{
//    if (k > 255) k = 255;
//    
//    CGFloat r, g, b, a;
//    
//    [color getRed:&r green:&g blue:&b alpha:&a];
//    
//    CGFloat rgbMax = 255.f;
//    
//    return [UIColor colorWithRed:r-((CGFloat)k/rgbMax) green:g-((CGFloat)k/rgbMax) blue:b-((CGFloat)k/rgbMax) alpha:a];
//    }
//    
//    /** 0-255 */
//    static func(UIColor *)color:(UIColor *)color lighterOnRGB:(NSUInteger)k
//{
//    if (k > 255) k = 255;
//    
//    CGFloat r, g, b, a;
//    
//    [color getRed:&r green:&g blue:&b alpha:&a];
//    
//    CGFloat rgbMax = 255.f;
//    
//    return [UIColor colorWithRed:r+((CGFloat)k/rgbMax) green:g+((CGFloat)k/rgbMax) blue:b+((CGFloat)k/rgbMax) alpha:a];
//    }
//    
//    /** 0.f-1.f */
//    static func(UIColor *)color:(UIColor *)color darkerOn:(CGFloat)k
//{
//    if (k < 0.f) k = 0.f;
//    if (k > 1.f) k = 1.f;
//    
//    CGFloat r, g, b, a;
//    
//    [color getRed:&r green:&g blue:&b alpha:&a];
//    
//    return [UIColor colorWithRed:r-k green:g-k blue:b-k alpha:a];
//    }
//    
//    /** 0.f-1.f */
//    static func(UIColor *)color:(UIColor *)color lighterOn:(CGFloat)k
//{
//    if (k < 0.f) k = 0.f;
//    if (k > 1.f) k = 1.f;
//    
//    CGFloat r, g, b, a;
//    
//    [color getRed:&r green:&g blue:&b alpha:&a];
//    
//    return [UIColor colorWithRed:r+k green:g+k blue:b+k alpha:a];
//    }
//    
//    /** 0.f-100.f */
//    static func(UIColor *)color:(UIColor *)color darkerOnPercent:(CGFloat)percent
//{
//    if (percent < 0.f) percent = 0.f;
//    if (percent > 100.f) percent = 100.f;
//    
//    CGFloat r, g, b, a;
//    
//    [color getRed:&r green:&g blue:&b alpha:&a];
//    
//    CGFloat percent_ = percent/100.f;
//    
//    return [UIColor colorWithRed:r-r*percent_ green:g-g*percent_ blue:b-b*percent_ alpha:a];
//    }
//    
//    /** 0.f-100.f */
//    static func(UIColor *)color:(UIColor *)color lighterOnPercent:(CGFloat)percent
//{
//    if (percent < 0.f) percent = 0.f;
//    if (percent > 100.f) percent = 100.f;
//    
//    CGFloat r, g, b, a;
//    
//    [color getRed:&r green:&g blue:&b alpha:&a];
//    
//    CGFloat rgbMax = 255.f;
//    
//    CGFloat percent_ = percent/100.f;
//    
//    return [UIColor colorWithRed:r+(rgbMax-r)*percent_ green:g+(rgbMax-g)*percent_ blue:b+(rgbMax-b)*percent_ alpha:a];
//    }
//    
//    static func(NSArray *)colorConvertRGBtoXYZ:(UIColor *)color
//{
//    ////make variables to get color values
//    CGFloat red2;
//    CGFloat green2;
//    CGFloat blue2;
//    
//    [color getRed:&red2 green:&green2 blue:&blue2 alpha:nil];
//    
//    //convert to XYZ
//    
//    float red = (float)red2;
//    float green = (float)green2;
//    float blue = (float)blue2;
//    
//    // adjusting values
//    if (red > 0.04045)
//    {
//        red = (red static func0.055)/1.055;
//        red = pow(red,2.4);
//    }
//    else red = red/12.92;
//    
//    if (green > 0.04045)
//    {
//        green = (green + 0.055)/1.055;
//        green = pow(green,2.4);
//    }
//    else green = green/12.92;
//    
//    if (blue > 0.04045)
//    {
//        blue = (blue + 0.055)/1.055;
//        blue = pow(blue,2.4);
//    }
//    else blue = blue/12.92;
//    
//    red *= 100;
//    green *= 100;
//    blue *= 100;
//    
//    //make x, y and z variables
//    float x;
//    float y;
//    float z;
//    
//    // applying the matrix to finally have XYZ
//    x = (red * 0.4124) + (green * 0.3576) + (blue * 0.1805);
//    y = (red * 0.2126) + (green * 0.7152) + (blue * 0.0722);
//    z = (red * 0.0193) + (green * 0.1192) + (blue * 0.9505);
//    
//    NSNumber *xNumber = [NSNumber numberWithFloat:x];
//    NSNumber *yNumber = [NSNumber numberWithFloat:y];
//    NSNumber *zNumber = [NSNumber numberWithFloat:z];
//    
//    //add them to an array to return.
//    NSArray *xyzArray = [NSArray arrayWithObjects:xNumber, yNumber, zNumber, nil];
//    
//    return xyzArray;
//    }
//    
//    static func(NSArray *)colorConvertRGBtoLAB:(UIColor *)color
//{
//    return [self colorConvertXYZtoLAB:[self colorConvertRGBtoXYZ:color]];
//    }
//    
//    static func(NSArray *)colorConvertXYZtoLAB:(NSArray *)xyzArray
//{
//    NSNumber *xNumber = [xyzArray objectAtIndex:0];
//    NSNumber *yNumber = [xyzArray objectAtIndex:1];
//    NSNumber *zNumber = [xyzArray objectAtIndex:2];
//    
//    //make x, y and z variables
//    float x = xNumber.floatValue;
//    float y = yNumber.floatValue;
//    float z = zNumber.floatValue;
//    
//    //NSLog(@"LGKit: XYZ color - %f, %f, %f", x, y, z);
//    
//    //then convert XYZ to LAB
//    
//    x = x/95.047;
//    y = y/100;
//    z = z/108.883;
//    
//    // adjusting the values
//    if (x > 0.008856) x = powf(x,(1.0/3.0));
//    else x = ((7.787 * x) + (16/116));
//    
//    if (y > 0.008856) y = pow(y,(1.0/3.0));
//    else y = ((7.787 * y) + (16/116));
//    
//    if (z > 0.008856) z = pow(z,(1.0/3.0));
//    else z = ((7.787 * z) + (16/116));
//    
//    //make L, A and B variables
//    float l;
//    float a;
//    float b;
//    
//    //finally have your l, a, b variables!!!!
//    l = ((116 * y) - 16);
//    a = 500 * (x - y);
//    b = 200 * (y - z);
//    
//    NSNumber *lNumber = [NSNumber numberWithFloat:l];
//    NSNumber *aNumber = [NSNumber numberWithFloat:a];
//    NSNumber *bNumber = [NSNumber numberWithFloat:b];
//    
//    //add them to an array to return.
//    NSArray *labArray = [NSArray arrayWithObjects:lNumber, aNumber, bNumber, nil];
//    
//    return labArray;
//    }
//    
//    static func(NSArray *)colorConvertLABtoXYZ:(NSArray *)labArray
//{
//    NSNumber *lNumber = [labArray objectAtIndex:0];
//    NSNumber *aNumber = [labArray objectAtIndex:1];
//    NSNumber *bNumber = [labArray objectAtIndex:2];
//    
//    //make l, a and b variables
//    float l = lNumber.floatValue;
//    float a = aNumber.floatValue;
//    float b = bNumber.floatValue;
//    
//    float delta = 6 / 29;
//    
//    float y = (l + 16) / 116;
//    float x = y + (a / 500);
//    float z = y - (b / 200);
//    
//    if (pow(x, 3.0) > delta) x = pow(x, 3);
//    else x = (x - 16 / 116) * 3 * (delta * delta);
//    
//    if (pow(y, 3.0) > delta) y = pow(y, 3);
//    else y = (y - 16 / 116) * 3 * (delta * delta);
//    
//    if (pow(z, 3.0) > delta) z = pow(z, 3);
//    else z = (z - 16 / 116) * 3 * (delta * delta);
//    
//    x = x * 95.047;
//    y = y * 100;
//    z = z * 108.883;
//    
//    NSNumber *xNumber = [NSNumber numberWithFloat:x];
//    NSNumber *yNumber = [NSNumber numberWithFloat:y];
//    NSNumber *zNumber = [NSNumber numberWithFloat:z];
//    
//    //add them to an array to return.
//    NSArray *xyzArray = [NSArray arrayWithObjects:xNumber, yNumber, zNumber, nil];
//    
//    return xyzArray;
//    }
//    
//    static func(UIColor *)colorConvertXYZtoRGB:(NSArray *)xyzArray
//{
//    NSNumber *xNumber = [xyzArray objectAtIndex:0];
//    NSNumber *yNumber = [xyzArray objectAtIndex:1];
//    NSNumber *zNumber = [xyzArray objectAtIndex:2];
//    
//    //make x, y and z variables
//    float x = xNumber.floatValue;
//    float y = yNumber.floatValue;
//    float z = zNumber.floatValue;
//    
//    x = x / 100;
//    y = y / 100;
//    z = z / 100;
//    
//    float r = x *  3.2406 + y * -1.5372 + z * -0.4986;
//    float g = x * -0.9689 + y *  1.8758 + z *  0.0415;
//    float b = x *  0.0557 + y * -0.2040 + z *  1.0570;
//    
//    if (r > 0.0031308) r = 1.055 * pow(r, 1 / 2.4) - 0.055;
//    else r = 12.92 * r;
//    
//    if (g > 0.0031308) g = 1.055 * pow(g, 1 / 2.4) - 0.055;
//    else g = 12.92 * g;
//    
//    if (b > 0.0031308) b = 1.055 * pow(b, 1 / 2.4) - 0.055;
//    else b = 12.92 * b;
//    
//    return [UIColor colorWithRed:r green:g blue:b alpha:1];
//    }
//    
//    static func(UIColor *)colorConvertLABtoRGB:(NSArray *)labArray
//{
//    return [self colorConvertXYZtoRGB:[self colorConvertLABtoXYZ:labArray]];
//}
//
//// MARK: Email
//
//static func(BOOL)emailIsCorrect:(NSString *)string
//{
//    NSString *regExString =
//        @"(?:[a-zA-Z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-zA-Z0-9!#$%\\&'*+/=?\\^_`{|}"
//    @"~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"
//    @"x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-zA-Z0-9](?:[a-"
//    @"z0-9-]*[a-zA-Z0-9])?\\.)+[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?|\\[(?:(?:25[0-5"
//    @"]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"
//    @"9][0-9]?|[a-zA-Z0-9-]*[a-zA-Z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"
//    @"-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])";
//    
//    NSPredicate *regExPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regExString];
//    BOOL isMatchesRegEx = [regExPredicate evaluateWithObject:string];
//    
//    return isMatchesRegEx;
//    }
//    
//    - (BOOL)emailSendToAddresses:(NSArray *)addresses
//theme:(NSString *)theme
//message:(NSString *)message
//inViewController:(UIViewController *)viewController
//animated:(BOOL)animated
//setupHandler:(void(^)(MFMailComposeViewController *viewController))setupHandler
//presentCompletionHandler:(void(^)())presentCompletionHandler
//completionHandler:(void(^)(MFMailComposeResult result, NSError *error))completionHandler
//dismissCompletionHandler:(void(^)())dismissCompletionHandler
//{
//    return [self emailSendToAddresses:addresses
//        theme:theme
//        message:message
//        inViewController:viewController
//        animated:animated
//        delegate:nil
//        setupHandler:setupHandler
//        presentCompletionHandler:presentCompletionHandler
//        completionHandler:completionHandler
//        dismissCompletionHandler:dismissCompletionHandler];
//    }
//    
//    - (BOOL)emailSendToAddresses:(NSArray *)addresses
//theme:(NSString *)theme
//message:(NSString *)message
//inViewController:(UIViewController *)viewController
//animated:(BOOL)animated
//delegate:(id<MFMailComposeViewControllerDelegate>)delegate
//setupHandler:(void(^)(MFMailComposeViewController *viewController))setupHandler
//presentCompletionHandler:(void(^)())presentCompletionHandler
//{
//    return [self emailSendToAddresses:addresses
//        theme:theme
//        message:message
//        inViewController:viewController
//        animated:animated
//        delegate:delegate
//        setupHandler:setupHandler
//        presentCompletionHandler:presentCompletionHandler
//        completionHandler:nil
//        dismissCompletionHandler:nil];
//    }
//    
//    - (BOOL)emailSendToAddresses:(NSArray *)addresses
//theme:(NSString *)theme
//message:(NSString *)message
//inViewController:(UIViewController *)viewController
//animated:(BOOL)animated
//delegate:(id<MFMailComposeViewControllerDelegate>)delegate
//setupHandler:(void(^)(MFMailComposeViewController *viewController))setupHandler
//presentCompletionHandler:(void(^)())presentCompletionHandler
//completionHandler:(void(^)(MFMailComposeResult result, NSError *error))completionHandler
//dismissCompletionHandler:(void(^)())dismissCompletionHandler
//{
//    BOOL canSendMail = [MFMailComposeViewController canSendMail];
//    
//    if (canSendMail)
//    {
//        _emailViewController = viewController;
//        _emailAnimated = animated;
//        _emailCompletionHandler = completionHandler;
//        _emailDismissCompletionHandler = dismissCompletionHandler;
//        
//        MFMailComposeViewController *mailViewController = [MFMailComposeViewController new];
//        mailViewController.mailComposeDelegate = (delegate ? delegate : self);
//        [mailViewController setSubject:theme];
//        [mailViewController setToRecipients:addresses];
//        [mailViewController setMessageBody:message isHTML:NO];
//        
//        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
//        mailViewController.modalPresentationStyle = UIModalPresentationFormSheet;
//        
//        if (setupHandler) setupHandler(mailViewController);
//        
//        [viewController presentViewController:mailViewController animated:animated completion:presentCompletionHandler];
//    }
//    
//    return canSendMail;
//}
//
//// MARK: Delegate
//
//- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
//{
//    if (_emailCompletionHandler) _emailCompletionHandler(result, error);
//    
//    [_emailViewController dismissViewControllerAnimated:_emailAnimated completion:_emailDismissCompletionHandler];
//}
//
//// MARK: Phone, SMS
//
//static func(BOOL)phoneNumberIsCorrect:(NSString *)string
//{
//    NSString *regExString = @"^[1-9\\+][0-9]{5,15}$";
//    
//    NSPredicate *regExPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regExString];
//    BOOL isMatchesRegEx = [regExPredicate evaluateWithObject:string];
//    
//    return isMatchesRegEx;
//    }
//    
//    - (BOOL)smsSendWithText:(NSString *)text
//inViewController:(UIViewController *)viewController
//animated:(BOOL)animated
//setupHandler:(void(^)(MFMessageComposeViewController *viewController))setupHandler
//presentCompletionHandler:(void(^)())presentCompletionHandler
//completionHandler:(void(^)(MessageComposeResult result))completionHandler
//dismissCompletionHandler:(void(^)())dismissCompletionHandler
//{
//    return [self smsSendWithText:text
//        inViewController:viewController
//        animated:animated
//        delegate:nil
//        setupHandler:setupHandler
//        presentCompletionHandler:presentCompletionHandler
//        completionHandler:completionHandler
//        dismissCompletionHandler:dismissCompletionHandler];
//    }
//    
//    - (BOOL)smsSendWithText:(NSString *)text
//inViewController:(UIViewController *)viewController
//animated:(BOOL)animated
//delegate:(id<MFMessageComposeViewControllerDelegate>)delegate
//setupHandler:(void(^)(MFMessageComposeViewController *viewController))setupHandler
//presentCompletionHandler:(void(^)())presentCompletionHandler
//{
//    return [self smsSendWithText:text
//        inViewController:viewController
//        animated:animated
//        delegate:delegate
//        setupHandler:setupHandler
//        presentCompletionHandler:presentCompletionHandler
//        completionHandler:nil
//        dismissCompletionHandler:nil];
//    }
//    
//    - (BOOL)smsSendWithText:(NSString *)text
//inViewController:(UIViewController *)viewController
//animated:(BOOL)animated
//delegate:(id<MFMessageComposeViewControllerDelegate>)delegate
//setupHandler:(void(^)(MFMessageComposeViewController *viewController))setupHandler
//presentCompletionHandler:(void(^)())presentCompletionHandler
//completionHandler:(void(^)(MessageComposeResult result))completionHandler
//dismissCompletionHandler:(void(^)())dismissCompletionHandler
//{
//    BOOL canSendText = [MFMessageComposeViewController canSendText];
//    
//    if (canSendText)
//    {
//        _smsViewController = viewController;
//        _smsAnimated = animated;
//        _smsCompletionHandler = completionHandler;
//        _smsDismissCompletionHandler = dismissCompletionHandler;
//        
//        MFMessageComposeViewController *messageViewController = [[MFMessageComposeViewController alloc] init];
//        messageViewController.messageComposeDelegate = self;
//        [messageViewController setBody:text];
//        
//        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
//        messageViewController.modalPresentationStyle = UIModalPresentationFormSheet;
//        
//        [viewController presentViewController:messageViewController animated:animated completion:presentCompletionHandler];
//    }
//    
//    return canSendText;
//}
//
//// MARK: Delegate
//
//- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result
//{
//    if (_smsCompletionHandler) _smsCompletionHandler(result);
//    
//    [_smsViewController dismissViewControllerAnimated:_smsAnimated completion:_smsDismissCompletionHandler];
//}
//
//// MARK: UIImagePickerController
//
//- (BOOL)imagePickerControllerShowWithActionSheetInView:(UIView *)view
//inViewController:(UIViewController *)viewController
//animated:(BOOL)animated
//setupHandler:(void(^)(UIImagePickerController *imagePickerController))setupHandler
//presentCompletionHandler:(void(^)())presentCompletionHandler
//completionHandler:(void(^)(UIImage *image))completionHandler
//dismissCompletionHandler:(void(^)())dismissCompletionHandler
//{
//    return [self imagePickerControllerShowWithActionSheetInView:view
//        inViewController:viewController
//        animated:animated
//        delegate:nil
//        setupHandler:setupHandler
//        presentCompletionHandler:presentCompletionHandler
//        completionHandler:completionHandler
//        dismissCompletionHandler:dismissCompletionHandler];
//    }
//    
//    - (BOOL)imagePickerControllerShowWithActionSheetInView:(UIView *)view
//inViewController:(UIViewController *)viewController
//animated:(BOOL)animated
//delegate:(id<UINavigationControllerDelegate, UIImagePickerControllerDelegate>)delegate
//setupHandler:(void(^)(UIImagePickerController *imagePickerController))setupHandler
//presentCompletionHandler:(void(^)())presentCompletionHandler
//{
//    return [self imagePickerControllerShowWithActionSheetInView:view
//        inViewController:viewController
//        animated:animated
//        delegate:delegate
//        setupHandler:setupHandler
//        presentCompletionHandler:presentCompletionHandler
//        completionHandler:nil
//        dismissCompletionHandler:nil];
//    }
//    
//    - (BOOL)imagePickerControllerShowWithActionSheetInView:(UIView *)view
//inViewController:(UIViewController *)viewController
//animated:(BOOL)animated
//delegate:(id<UINavigationControllerDelegate, UIImagePickerControllerDelegate>)delegate
//setupHandler:(void(^)(UIImagePickerController *imagePickerController))setupHandler
//presentCompletionHandler:(void(^)())presentCompletionHandler
//completionHandler:(void(^)(UIImage *image))completionHandler
//dismissCompletionHandler:(void(^)())dismissCompletionHandler
//{
//    BOOL sourceTypeAvailable = NO;
//    
//    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera] &&
//        [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary])
//    {
//        sourceTypeAvailable = YES;
//        
//        _imagePickerController = [UIImagePickerController new];
//        _imagePickerParentViewController = viewController;
//        _imagePickerSetupHandler = setupHandler;
//        _imagePickerPresentCompletionHandler = presentCompletionHandler;
//        _imagePickerCompletionHandler = completionHandler;
//        _imagePickerDismissCompletionHandler = dismissCompletionHandler;
//        _imagePickerAnimated = animated;
//        _imagePickerDelegate = delegate;
//        
//        // -----
//        
//        UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil
//            delegate:self
//            cancelButtonTitle:LS(@"Cancel")
//            destructiveButtonTitle:nil
//            otherButtonTitles:LS(@"Take photo"), LS(@"Choose from gallery"), nil];
//        actionSheet.tag = kLGHelperTagActionSheetImagePicker;
//        [actionSheet showInView:view];
//    }
//    else if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera] ||
//        [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary])
//    {
//        sourceTypeAvailable = YES;
//        
//        _imagePickerController = [UIImagePickerController new];
//        
//        UIImagePickerControllerSourceType sourceType = ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera] ?
//            UIImagePickerControllerSourceTypeCamera :
//            UIImagePickerControllerSourceTypePhotoLibrary);
//        
//        [self imagePickerControllerShowWithSourceType:sourceType
//            inViewController:viewController
//            animated:animated
//            delegate:delegate
//            setupHandler:setupHandler
//            presentCompletionHandler:presentCompletionHandler
//            completionHandler:completionHandler
//            dismissCompletionHandler:dismissCompletionHandler];
//    }
//    
//    return sourceTypeAvailable;
//    }
//    
//    - (BOOL)imagePickerControllerShowWithSourceType:(UIImagePickerControllerSourceType)sourceType
//inViewController:(UIViewController *)viewController
//animated:(BOOL)animated
//setupHandler:(void(^)(UIImagePickerController *imagePickerController))setupHandler
//presentCompletionHandler:(void(^)())presentCompletionHandler
//completionHandler:(void(^)(UIImage *image))completionHandler
//dismissCompletionHandler:(void(^)())dismissCompletionHandler
//{
//    return [self imagePickerControllerShowWithSourceType:sourceType
//        inViewController:viewController
//        animated:animated
//        delegate:nil
//        setupHandler:setupHandler
//        presentCompletionHandler:presentCompletionHandler
//        completionHandler:completionHandler
//        dismissCompletionHandler:dismissCompletionHandler];
//    }
//    
//    - (BOOL)imagePickerControllerShowWithSourceType:(UIImagePickerControllerSourceType)sourceType
//inViewController:(UIViewController *)viewController
//animated:(BOOL)animated
//delegate:(id<UINavigationControllerDelegate, UIImagePickerControllerDelegate>)delegate
//setupHandler:(void(^)(UIImagePickerController *imagePickerController))setupHandler
//presentCompletionHandler:(void(^)())presentCompletionHandler
//{
//    return [self imagePickerControllerShowWithSourceType:sourceType
//        inViewController:viewController
//        animated:animated
//        delegate:delegate
//        setupHandler:setupHandler
//        presentCompletionHandler:presentCompletionHandler
//        completionHandler:nil
//        dismissCompletionHandler:nil];
//    }
//    
//    - (BOOL)imagePickerControllerShowWithSourceType:(UIImagePickerControllerSourceType)sourceType
//inViewController:(UIViewController *)viewController
//animated:(BOOL)animated
//delegate:(id<UINavigationControllerDelegate, UIImagePickerControllerDelegate>)delegate
//setupHandler:(void(^)(UIImagePickerController *imagePickerController))setupHandler
//presentCompletionHandler:(void(^)())presentCompletionHandler
//completionHandler:(void(^)(UIImage *image))completionHandler
//dismissCompletionHandler:(void(^)())dismissCompletionHandler
//{
//    BOOL sourceTypeAvailable = NO;
//    
//    if ([UIImagePickerController isSourceTypeAvailable:sourceType])
//    {
//        sourceTypeAvailable = YES;
//        
//        _imagePickerParentViewController = viewController;
//        _imagePickerCompletionHandler = completionHandler;
//        _imagePickerDismissCompletionHandler = dismissCompletionHandler;
//        _imagePickerAnimated = animated;
//        _imagePickerDelegate = delegate;
//        
//        // -----
//        
//        if (!_imagePickerController)
//        _imagePickerController = [UIImagePickerController new];
//        
//        _imagePickerController.sourceType = sourceType;
//        _imagePickerController.delegate = (delegate ? delegate : self);
//        
//        if (setupHandler) setupHandler(_imagePickerController);
//        
//        [viewController presentViewController:_imagePickerController animated:animated completion:presentCompletionHandler];
//    }
//    
//    return sourceTypeAvailable;
//}
//
//// MARK: Delegate
//
//- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
//{
//    UIImage *image = [info valueForKey:UIImagePickerControllerOriginalImage];
//    image = [LGHelper imageWithOrientationExifFix:image];
//    
//    if (_imagePickerCompletionHandler) _imagePickerCompletionHandler(image);
//    
//    [_imagePickerParentViewController dismissViewControllerAnimated:_imagePickerAnimated completion:^(void)
//    {
//    self.imagePickerController = nil;
//    
//    if (_imagePickerDismissCompletionHandler) _imagePickerDismissCompletionHandler();
//    }];
//    }
//    
//    - (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
//{
//    [_imagePickerParentViewController dismissViewControllerAnimated:_imagePickerAnimated completion:^(void)
//        {
//        self.imagePickerController = nil;
//        
//        if (_imagePickerDismissCompletionHandler) _imagePickerDismissCompletionHandler();
//        }];
//}
//
//// MARK: UIDocumentInteractionController
//
//- (BOOL)documentInteractionControllerShowWithFileURL:(NSURL *)fileUrl
//inViewController:(UIViewController *)viewController
//animated:(BOOL)animated
//setupHandler:(void(^)(UIDocumentInteractionController *documentInteractionController))setupHandler
//didEndPreviewHandler:(void(^)())didEndPreviewHandler
//{
//    return [self documentInteractionControllerShowWithFileURL:fileUrl
//        inViewController:viewController
//        animated:animated
//        delegate:nil
//        setupHandler:setupHandler
//        didEndPreviewHandler:didEndPreviewHandler];
//    }
//    
//    - (BOOL)documentInteractionControllerShowWithFileURL:(NSURL *)fileUrl
//inViewController:(UIViewController *)viewController
//animated:(BOOL)animated
//delegate:(id<UIDocumentInteractionControllerDelegate>)delegate
//setupHandler:(void(^)(UIDocumentInteractionController *documentInteractionController))setupHandler
//{
//    return [self documentInteractionControllerShowWithFileURL:fileUrl
//        inViewController:viewController
//        animated:animated
//        delegate:delegate
//        setupHandler:setupHandler
//        didEndPreviewHandler:nil];
//    }
//    
//    - (BOOL)documentInteractionControllerShowWithFileURL:(NSURL *)fileUrl
//inViewController:(UIViewController *)viewController
//animated:(BOOL)animated
//delegate:(id<UIDocumentInteractionControllerDelegate>)delegate
//setupHandler:(void(^)(UIDocumentInteractionController *documentInteractionController))setupHandler
//didEndPreviewHandler:(void(^)())didEndPreviewHandler
//{
//    _documentInteractionParentViewController = viewController;
//    _documentInteractionDidEndPreviewHandler = didEndPreviewHandler;
//    _documentInteractionAnimated = animated;
//    _documentInteractionDelegate = delegate;
//    
//    // -----
//    
//    _documentInteractionController = [UIDocumentInteractionController interactionControllerWithURL:fileUrl];
//    _documentInteractionController.delegate = (delegate ? delegate : self);
//    
//    if (setupHandler) setupHandler(_documentInteractionController);
//    
//    return [_documentInteractionController presentPreviewAnimated:animated];
//}
//
//// MARK: Delegate
//
//- (UIViewController *)documentInteractionControllerViewControllerForPreview:(UIDocumentInteractionController *)controller
//{
//    return _documentInteractionParentViewController;
//    }
//    
//    - (void)documentInteractionControllerDidEndPreview:(UIDocumentInteractionController *)controller
//{
//    if (_documentInteractionDidEndPreviewHandler) _documentInteractionDidEndPreviewHandler();
//}
//
//// MARK: UIActivityViewController
//
//- (void)activityViewControllerShowWithFilesUrl:(NSArray *)filesUrl
//applicationActivities:(NSArray *)applicationActivities
//excludedActivityTypes:(NSArray *)excludedActivityTypes
//inViewController:(UIViewController *)viewController
//animated:(BOOL)animated
//setupHandler:(void(^)(UIActivityViewController *activityViewController))setupHandler
//completionHandler:(void(^)(NSString *activityType, BOOL completed, NSArray *returnedItems, NSError *activityError))completionHandler
//presentCompletionHandler:(void(^)())presentCompletionHandler
//{
//    UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:filesUrl
//        applicationActivities:applicationActivities];
//    activityViewController.excludedActivityTypes = excludedActivityTypes;
//    
//    if (kSystemVersion < 8.0)
//    {
//        #if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_8_0
//            activityViewController.completionHandler = ^(NSString *activityType, BOOL completed)
//            {
//                if (completionHandler) completionHandler(activityType, completed, nil, nil);
//            };
//        #endif
//    }
//    else
//    {
//        activityViewController.completionWithItemsHandler = ^(NSString *activityType, BOOL completed, NSArray *returnedItems, NSError *activityError)
//        {
//            if (completionHandler) completionHandler(activityType, completed, returnedItems, activityError);
//        };
//    }
//    
//    if (setupHandler) setupHandler(activityViewController);
//    
//    [viewController presentViewController:activityViewController animated:animated completion:presentCompletionHandler];
//}
//
//// MARK: UIActionSheetDelegate
//
//- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
//{
//    if (actionSheet.tag == kLGHelperTagActionSheetImagePicker && buttonIndex != actionSheet.cancelButtonIndex)
//    {
//        UIImagePickerControllerSourceType sourceType;
//        
//        if (buttonIndex == 0)
//        sourceType = UIImagePickerControllerSourceTypeCamera;
//        else
//        sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
//        
//        [self imagePickerControllerShowWithSourceType:sourceType
//        inViewController:_imagePickerParentViewController
//        animated:_imagePickerAnimated
//        delegate:_imagePickerDelegate
//        setupHandler:_imagePickerSetupHandler
//        presentCompletionHandler:_imagePickerPresentCompletionHandler
//        completionHandler:_imagePickerCompletionHandler
//        dismissCompletionHandler:_imagePickerDismissCompletionHandler];
//    }
//}
//
//// MARK: Reachability
//
////static func(Reachability *)reachabilityAddObserver:(id)target selector:(SEL)selector
////{
////    Reachability *reachability = [Reachability reachabilityForInternetConnection];
////    [reachability startNotifier];
////    [[NSNotificationCenter defaultCenter] addObserver:target selector:selector name:kReachabilityChangedNotification object:reachability];
////
////    return reachability;
////}
////
////static func(Reachability *)reachabilityForHostName:(NSString *)hostName addObserver:(id)target selector:(SEL)selector
////{
////    Reachability *reachability = [Reachability reachabilityWithHostName:hostName];
////    [reachability startNotifier];
////    [[NSNotificationCenter defaultCenter] addObserver:target selector:selector name:kReachabilityChangedNotification object:reachability];
////
////    return reachability;
////}
////
////static func(void)reachability:(Reachability *)reachability removeObserver:(id)target
////{
////    [reachability stopNotifier];
////    [[NSNotificationCenter defaultCenter] removeObserver:target name:kReachabilityChangedNotification object:reachability];
////}
////
////static func(NetworkStatus)reachabilityStatus
////{
////    return [[Reachability reachabilityForInternetConnection] currentReachabilityStatus];
////}
////
////static func(NetworkStatus)reachabilityStatusForHostName:(NSString *)hostName
////{
////    return [[Reachability reachabilityWithHostName:hostName] currentReachabilityStatus];
////}
//
//// MARK: MWPhotoBrowser
//
////- (void)photoBrowserShow
////{
////    MWPhotoBrowser *photoBrowser = [[MWPhotoBrowser alloc] initWithDelegate:self];
////    photoBrowser.displayActionButton = YES;     // Show action button to allow sharing, copying, etc (defaults to YES)
////    photoBrowser.displayNavArrows = YES;        // Whether to display left and right nav arrows on toolbar (defaults to NO)
////    photoBrowser.displaySelectionButtons = NO;  // Whether selection buttons are shown on each image (defaults to NO)
////    photoBrowser.zoomPhotosToFill = YES;        // Images that almost fill the screen will be initially zoomed to fill (defaults to YES)
////    photoBrowser.alwaysShowControls = NO;       // Allows to control whether the bars and controls are always visible or whether they fade away to show the photo full (defaults to NO)
////    photoBrowser.enableGrid = NO;               // Whether to allow the viewing of all the photo thumbnails on a grid (defaults to YES)
////    photoBrowser.startOnGrid = NO;              // Whether to start on the grid of thumbnails instead of the first photo (defaults to NO)
////    photoBrowser.enableSwipeToDismiss = NO;
////    photoBrowser.currentPhotoIndex = 0;
////
////    for (NSUInteger i=0; i<someNumber; i++)
////    {
////        MWPhoto *photo = [MWPhoto photoWithURL:PhotoURL];
////        photo.caption = Description;
////
////        [_photosArray addObject:photo];
////    }
////
////    UINavigationController *photoNavController = [[UINavigationController alloc] initWithRootViewController:photoBrowser];
////    [self.navigationController presentViewController:photoNavController animated:YES completion:nil];
////}
//
//// MARK: Delegate
//
////- (NSUInteger)numberOfPhotosInPhotoBrowser:(MWPhotoBrowser *)photoBrowser
////{
////    return _photosArray.count;
////}
////
////- (id<MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser photoAtIndex:(NSUInteger)index
////{
////    if (index < _photosArray.count)
////        return _photosArray[index];
////
////    return nil;
////}
//
//// MARK: Processor
//
////unsigned int countCores()
////{
////    host_basic_info_data_t hostInfo;
////    mach_msg_type_number_t infoCount;
////
////    infoCount = HOST_BASIC_INFO_COUNT;
////    host_info(mach_host_self(), HOST_BASIC_INFO, (host_info_t)&hostInfo, &infoCount);
////
////    return (unsigned int)(hostInfo.max_cpus);
////}
////
////unsigned int countCores()
////{
////    size_t len;
////    unsigned int ncpu;
////
////    len = sizeof(ncpu);
////    sysctlbyname ("hw.ncpu",&ncpu,&len,NULL,0);
////
////    return ncpu;
////}
}



