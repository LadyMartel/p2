//
//  TableViewController.m
//  Project2
//
//  Created by Rose on 9/20/13.
//  Copyright (c) 2013 LadyMartel. All rights reserved.
//

#import "TableViewController.h"
#import "ViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    
    NSLog(@"There are %d items to do",[self.toDoArray count]);
    NSLog(@"There are %d items to buy",[self.toBuyArray count]);

    if (section == 0)
        return [self.toDoArray count];
    else
        return [self.toBuyArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //static NSString *CellIdentifier = @"Cell";
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    //IMPORTANT NOTE: we have removed the second parameter that came with the function in the UITableViewController template that XCode created for us.
    //That pertains to another way to deal with cells that is, honestly, more modern and better, but not the way we're doing things in this class
    
    //The above dequeues a cell, but cell will be nil the first few times this method is called, so we create them here.
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
        //Note that the first time through we used UITableViewCellStyleDefault
    }
    
    
    // Configure the cell...
//    cell.textLabel.text = [NSString stringWithFormat: @"Section %d Row %d", indexPath.section, indexPath.row];
//    cell.detailTextLabel.text = @"something here";
    if(indexPath.section == 0){
        cell.textLabel.text = [[self.toDoArray objectAtIndex: indexPath.row] objectAtIndex:0];
        cell.detailTextLabel.text = [[self.toDoArray objectAtIndex: indexPath.row] objectAtIndex:1];
    }else {
        cell.textLabel.text = [[self.toBuyArray objectAtIndex:indexPath.row] objectAtIndex: 0];
        cell.detailTextLabel.text = [[self.toBuyArray objectAtIndex: indexPath.row] objectAtIndex:1];
    }
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //[self dismissViewControllerAnimated:YES completion:^{
    //}];
    
    NSString *item = [[self.toDoArray objectAtIndex: indexPath.row] objectAtIndex:0];
    NSString *detail =  [[self.toDoArray objectAtIndex: indexPath.row] objectAtIndex:1];
    
    NSString *m = [NSString stringWithFormat: @"Item: %@, Detail: %@", item, detail];
    

    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Selection"
                                                        message: m
                                                       delegate:nil
                                              cancelButtonTitle:@"Okay"
                                              otherButtonTitles:nil];
    
    [alertView show];

    
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
