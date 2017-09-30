# ARNAlert

[![CI Status](http://img.shields.io/travis/Airin/ARNAlert.svg?style=flat)](https://travis-ci.org/xxxAIRINxxx/ARNAlert)
[![Version](https://img.shields.io/cocoapods/v/ARNAlert.svg?style=flat)](http://cocoadocs.org/docsets/ARNAlert)
[![License](https://img.shields.io/cocoapods/l/ARNAlert.svg?style=flat)](http://cocoadocs.org/docsets/ARNAlert)
[![Platform](https://img.shields.io/cocoapods/p/ARNAlert.svg?style=flat)](http://cocoadocs.org/docsets/ARNAlert)

Wrapper of UIAlertView & UIAlertController.

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

### Show No Action Alert

```objective-c

[ARNAlert showNoActionAlertWithTitle:@"no action title" message:@"no action message" buttonTitle:@"No Acttion"];

// iOS8 : UIAlertController addAction(UIAlertActionStyleCancel)
// iOS7 : UIAlertView clickedButtonAtIndex(cancelButtonIndex)

```

### Show Simple Action Alert

```objective-c

[ARNAlert showAlertWithTitle:@"test Title"
                     message:@"test Message"
           cancelButtonTitle:@"Cancel"
                 cancelBlock:^(id action){
                     NSLog(@"cancelBlock call!");

                     // iOS8 : UIAlertController addAction(UIAlertActionStyleCancel)
                     // iOS7 : UIAlertView clickedButtonAtIndex(cancelButtonIndex)
                 }
               okButtonTitle:@"OK"
                     okBlock:^(id action){
          		  	 NSLog(@"okBlock call!");

                     // iOS8 : UIAlertController addAction(UIAlertActionStyleDefault)
      				 // iOS7 : UIAlertView clickedButtonAtIndex(buttonIndex)
}];

```

### Show Some Action Alert

```objective-c

ARNAlert *alert = [[ARNAlert alloc] initWithTitle:@"test Title" message:@"test Message"];
[alert addActionTitle:@"button" actionBlock:^(id action) {
    NSLog(@"button Button tapped!");

    // iOS8 : UIAlertController addAction(UIAlertActionStyleDefault)
    // iOS7 : UIAlertView clickedButtonAtIndex(buttonIndex)
}];
[alert setCancelTitle:@"cancel" cancelBlock:^(id action) {
    NSLog(@"cancel Button tapped!");

    // iOS8 : UIAlertController addAction(UIAlertActionStyleCancel)
    // iOS7 : UIAlertView  clickedButtonAtIndex(cancelButtonIndex)
}];
[alert show];

```

### Show Some Textfield Alert

```objective-c

    ARNAlert *alert = [[ARNAlert alloc] initWithTitle:@"test Text " message:@"test Message"];

    [alert addTextFieldWithPlaceholder:@"place1" fillInText:@"tex1"];
    [alert addTextFieldWithPlaceholder:@"place2" fillInText:@"tex2"];
    // iOS7 is Nothing
    [alert addTextFieldWithPlaceholder:@"place3" fillInText:@"tex3"];

    [alert addActionTitle:@"button1"
              actionBlock:^(NSArray *texitFields) {
                  NSLog(@"button1 tapped!");
                  NSLog(@"texitFields : %@", texitFields);
                  for (int i = 0; i < texitFields.count; ++i) {
                      UITextField *textField = texitFields[i];
                      NSLog(@"texitField.text : %@", textField.text);
                  }
              }];
    [alert addActionTitle:@"button2"
              actionBlock:^(NSArray *texitFields) {
                  NSLog(@"button2 tapped!");
                  NSLog(@"texitFields : %@", texitFields);
                  for (int i = 0; i < texitFields.count; ++i) {
                      UITextField *textField = texitFields[i];
                      NSLog(@"texitField.text : %@", textField.text);
                  }
              }];
    [alert setCancelTitle:@"Cancel"
              cancelBlock:^(NSArray *texitFields) {
                  NSLog(@"cancel Button tapped!");
                  NSLog(@"texitFields : %@", texitFields);
                  for (int i = 0; i < texitFields.count; ++i) {
                      UITextField *textField = texitFields[i];
                      NSLog(@"texitField.text : %@", textField.text);
                  }
              }];

    [alert show];

```

## Requirements

* iOS 7.0+
* ARC

## Installation

ARNAlert is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

    pod "ARNAlert"

## License

ARNAlert is available under the MIT license. See the LICENSE file for more info.
