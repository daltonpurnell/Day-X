//
//  DetailViewController.m
//  DayX
//
//  Created by Dalton on 4/7/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "DetailViewController.h"
#import "Entry.h"

@interface DetailViewController () <UITextFieldDelegate, UITextViewDelegate>


@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITextView *textView;

@property (strong, nonatomic) Entry *entry;


@end

@implementation DetailViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Retrieve a dictionary from user defaults for the entry key
    NSDictionary *entry = [[NSUserDefaults standardUserDefaults]objectForKey:keyForEntry];
    
// call the updateWithDictionary method and pass in the dictionary retrieved
    [self updateViewWithDictionary:entry];
}

// Set the text of textField and textView to an empty string so it clears when the clear button is tapped
- (IBAction)clear:(id)sender {
    
    self.textField.text = @"";
    self.textView.text = @"";
    
    [self save:sender];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - TextField Delegate Methods

// dismiss the keyboard inside this method
-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    
    return YES;
}


// call the save method inside the textFieldDidEndEditing method
- (void)textFieldDidEndEditing:(UITextField *)textField {
    
    [self save:textField];
}


#pragma mark - TextView Delegate Methods

// call the save method inside the textViewDidChange method
- (void)textViewDidChange:(UITextView *)textView {

    [self save:textView];
    
}


#pragma mark - My Own Methods

- (IBAction)save:(id)sender {
    
    // Check to see if sel.entry == nil
    if (!self.entry) {
        
        // if it's nil, create a new entry and set it to self.entry
        self.entry = [[Entry alloc] init];
        
        // set the properties of self.entry to the title and textfield text values
        self.entry.title = self.textField.text;
        self.entry.body = self.textView.text;
    }

    // grab the array of entries from [Entry loadEntriesFromDefaults]
    NSMutableArray *entries = [Entry loadEntriesFromDefaults];
    
    // Add self.entry to the array
    [entries addObject:self.entry];
    
    // call [Entry storeEntriesInDefaults:self.entry] and pass in self.entry
    [Entry storeEntriesInDefaults:entries];
    
}


// create an updateViewWithDictionary method that takes an NSDictionary and updates the textView and textField text to the body text key and title key dictionaries

-(void)updateViewWithDictionary:(NSDictionary *)dictionary {
    
//    // check to see if there is a title and body key first
//    
//    if (dictionary[keyForBodyText]) {
//        self.textView.text = dictionary[keyForBodyText];
//    }
//    
//    if (dictionary[keyForTitle]) {
//        self.textField.text = dictionary[keyForTitle];
//    }
    
    
    self.textView.text = dictionary[keyForBodyText];
    self.textField.text = dictionary[keyForTitle];
}


@end
