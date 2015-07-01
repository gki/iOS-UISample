//
//  TableViewController1.m
//  UISample
//
//  Created by gki on 2015/07/01.
//  Copyright (c) 2015年 gki. All rights reserved.
//

#import "TableViewController1.h"

@interface TableViewController1 ()

@end

@implementation TableViewController1
{
    NSMutableArray *strings;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    strings =  [NSMutableArray arrayWithArray:@[@"ABC",@"DEF",@"GHI",@"JKL",@"NMO",@"PQR",@"STU"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return strings.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CELL"];
    cell.textLabel.text = [strings objectAtIndex:indexPath.row];
    return cell;
}

- (IBAction)refresh:(UIRefreshControl *)sender
{
    [strings addObject:@"XXX"];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // Reload the table data with the new data
        [self.tableView reloadData];
        
        // Restore the view to normal
        [sender endRefreshing];
    });
}

@end
