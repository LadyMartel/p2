//
//  ViewController.m
//  Project2
//
//  Created by Rose on 9/20/13.
//  Copyright (c) 2013 LadyMartel. All rights reserved.
//

#import "ViewController.h"
#import "TableViewController.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UISegmentedControl *typeSegmentControl;
@property (strong, nonatomic) IBOutlet UITextField *mainText;
@property (strong, nonatomic) IBOutlet UITextField *detailText;
@property (nonatomic, strong) TableViewController *tableViewController;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.toDoArray = [[NSMutableArray alloc] init];
    self.toBuyArray = [[NSMutableArray alloc] init];
    self.tableViewController = [[TableViewController alloc] initWithStyle:UITableViewStyleGrouped];
    
    self.tableViewController.toBuyArray = self.toBuyArray;
    self.tableViewController.toDoArray = self.toDoArray;
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)addToList:(id)sender {
    if (self.typeSegmentControl.selectedSegmentIndex == 0){
        [self.toDoArray addObject:[[NSMutableArray alloc] initWithArray:@[self.mainText.text, self.detailText.text]]];
    } else {
        [self.toBuyArray addObject:[[NSMutableArray alloc] initWithArray:@[self.mainText.text, self.detailText.text]]];
    }
    self.mainText.text = @"";
    self.detailText.text = @"";
    [self.view endEditing:YES];
}
- (IBAction)showTable:(id)sender {
    

    [self presentViewController:self.tableViewController animated:YES completion:^{
 
    }];
    [self.tableViewController.tableView reloadData];
}

@end
