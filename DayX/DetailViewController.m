//
//  DetailViewController.m
//  DayX
//
//  Created by Christopher Hoffmann on 4/7/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "DetailViewController.h"

// Add a static key for entry
static NSString * const keyForEntry = @"entry";

// Add a static key for title
static NSString * const keyForTitle = @"title";

// Add a static key for pody text
static NSString * const keyForBodyText = @"body text";


@interface DetailViewController () <UITextFieldDelegate, UITextViewDelegate>


@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITextView *textView;


@end

@implementation DetailViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Retrieve a dictionary from user defaults for the entry key
    NSDictionary *entry = [[NSUserDefaults standardUserDefaults]objectForKey:keyForEntry];
    
    // call the updateWithDictionary method and pass in the dictionary retrieved
    [self updateViewWithDictionary:entry];
    
    
    
    
    // capture the values for all the different key value pairs
    //
    //    NSDictionary *iceCreamShops = [self iceCreamShops];
    //    NSString *cityName = [iceCreamShops objectForKey:@"city"];
    //    NSArray *storesArray = [iceCreamShops objectForKey:@"stores"];
    //    NSDictionary *firstStore = storesArray[0];
    //    NSDictionary *secondStore = storesArray[1];
    //    NSString *firstStoreName = [firstStore objectForKey:@"name"];
    //    NSString *firstStoreAddress = [firstStore objectForKey:@"address"];
    
    
}
- (IBAction)clear:(id)sender {
    
    self.textField.text = @"";
    self.textView.text = @"";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    
    return YES;
}




- (void)textFieldDidEndEditing:(UITextField *)textField {
    
    [self save];
}


- (void)textViewDidChange:(UITextView *)textView {
    
    [self save];
    
}

- (void)save {
    
    NSDictionary *entry = @{keyForTitle: self.textField.text, keyForBodyText: self.textView.text};
    
    // store the dictionary in NSUserDefaults for the entry key
    [[NSUserDefaults standardUserDefaults] setObject:entry forKey:keyForEntry];
    [[NSUserDefaults standardUserDefaults]synchronize];
}

-(void)updateViewWithDictionary:(NSDictionary *)dictionary {
    
    self.textView.text = dictionary[keyForBodyText];
    self.textField.text = dictionary[keyForTitle];
}

// Create a dictionary for ice cream shops
//- (NSDictionary *)iceCreamShops {
//
//    return @{
//             @"city":@"provo",
//             @"stores":
//                 @[
//                     @{
//                         @"name": @"coldstone",
//                         @"address": @"123 Main St."
//                    },
//                    @{
//                         @"name": @"creamery",
//                         @"address": @"900 East"
//                    }
//                ]
//             };
//}


@end