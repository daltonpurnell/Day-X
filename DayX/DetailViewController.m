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


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // TO DO: take this code out when you implement the list
    self.entry = [DXEntryController sharedInstance].allEntries.firstObject;
    [self updateWithTitle:self.entry.title body:self.entry.body];
}


- (void)updateWithTitle:(NSString *)title body:(NSString *)body {
    
    self.textField.text = title;
    self.textView.text = body;
    
}





#pragma mark - TextField Delegate Methods

// dismiss the keyboard inside this method
-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    
    return YES;
}


#pragma mark - My Own Methods

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


// Set the text of textField and textView to an empty string so it clears when the clear button is tapped
- (IBAction)clear:(id)sender {
    
    self.textField.text = @"";
    self.textView.text = @"";
    
    [self save:sender];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
