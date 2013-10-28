//
//  KDQueryTableViewControler.m
//  HoogleIOS
//
//  Created by Keith Miller on 10/27/13.
//  Copyright (c) 2013 KeithDon. All rights reserved.
//

#import "KDQueryTableViewControler.h"
#import "KDQueryResult.h"

@interface KDQueryTableViewControler () <NSURLConnectionDelegate>

@end

@implementation KDQueryTableViewControler

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
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
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}

- (NSArray *) parseDataFrom:(NSData *)json {
 
  NSError *error = nil;
  NSDictionary *parsedObject = [NSJSONSerialization JSONObjectWithData:json options:0 error:&error];
  
  NSMutableArray *results = [[NSMutableArray alloc] init];
  
  NSArray *matches = [parsedObject objectForKey:@"results"];
  
  for (NSDictionary *match in matches) {
    
    KDQueryResult *q = [[KDQueryResult alloc] init];
    
    q.location = [match objectForKey:@"location"];
    q.type = [match objectForKey:@"self"];
    q.docs = [match objectForKey:@"docs"];
    
    [results addObject:q];
    
  }
  
  return results;
  
}

#pragma mark NSURLConnection Delegate Methods
- (NSData *) getDataFrom:(NSString *)query{
  NSString *url = [NSString stringWithFormat:@"http://www.haskell.org/hoogle/?mode=json&hoogle=%@&start=1&count=50",[query stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
  NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
  [request setHTTPMethod:@"GET"];
  [request setURL:[NSURL URLWithString:url]];
  
  NSError *error = [[NSError alloc] init];
  NSHTTPURLResponse *responseCode = nil;
  
  NSData *oResponseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&responseCode error:&error];
  
  if([responseCode statusCode] != 200){
    NSLog(@"Error getting %@, HTTP status code %i", url, [responseCode statusCode]);
    return nil;
  }
  
  return oResponseData;
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

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
