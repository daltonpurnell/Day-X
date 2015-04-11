//
//  DetailViewController.m
//  DayX
//
//  Created by Christopher Hoffmann on 4/7/15.
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
    
}

#pragma mark - custom methods

- (IBAction)clear:(id)sender {
    
    self.textField.text = @"";
    self.textView.text = @"";
    [self save:sender];
}

- (IBAction)save:(id)sender{
    
    if (!self.entry) {
        self.entry = [[Entry alloc] init];
        self.entry.title = self.textField.text;
        self.entry.body = self.textView.text;
    }
    
    NSMutableArray *entries = [Entry loadEntriesFromDefaults];
    [entries addObject:self.entry];
    
    [Entry storeEntriesInDefaults:entries];
    
}


-(void)updateViewWithDictionary:(NSDictionary *)dictionary {
    
    if (dictionary[TitleKey]) {
        self.textView.text = dictionary[BodyKey];
    }
    if (dictionary[BodyKey]) {
        self.textField.text = dictionary[TitleKey];

    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    
    return YES;
}



@end