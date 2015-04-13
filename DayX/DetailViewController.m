//
//  DetailViewController.m
//  DayX
//
//  Created by Dalton on 4/7/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "DetailViewController.h"
#import "DXEntryController.h"

@interface DetailViewController () <UITextFieldDelegate, UITextViewDelegate>


@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITextView *textView;

@property (strong, nonatomic) Entry *entry;


@end

@implementation DetailViewController



// dd a method updateWithEntry:(Entry *)entry that will update the detail view
-(void)updateWithEntry:(Entry *)entry {
    
    
    // Store the Entry passed in to the entry property (self.entry)
    self.entry = entry;
    
    
    // Set the text of your title textField and text textView to the values from the entry object
    self.textField.text = entry.title;
    self.textView.text = entry.body;
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // Set the text of your title and text to the entry's values
    self.textField.text = self.entry.title;
    self.textView.text = self.entry.body;
    
    
//    // TO DO: take this code out when you implement the list
//    self.entry = [DXEntryController sharedInstance].allEntries.firstObject;
//    [self updateWithTitle:self.entry.title body:self.entry.body];
}


#pragma mark - TextField Delegate Method

// dismiss the keyboard inside this method
-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    
    return YES;
}



#pragma mark - My Own Methods

- (IBAction)clear:(id)sender {
    
    // Set the text of textField and textView to an empty string so it clears when the clear button is tapped
    self.textField.text = @"";
    self.textView.text = @"";
}






- (IBAction)save:(id)sender {
    
    Entry *entry = [[Entry alloc] initWithDictionary:@{keyForTitle: self.textField.text, keyForBodyText: self.textView.text}];
    
    // Check to see if self.entry == nil
    if (self.entry) {
        
        [[DXEntryController sharedInstance] replaceEntry:self.entry withEntry:entry];
    }
    
    else {
    
        // if it's nil, create a new entry and set it to self.entry
        [[DXEntryController sharedInstance]addEntry:entry];
    }
    
}




@end
