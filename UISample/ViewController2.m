//
//  ViewController2.m
//  UISample
//
//  Created by gki on 2015/06/29.
//  Copyright (c) 2015年 gki. All rights reserved.
//

#import "ViewController2.h"
#import "EmailProvider.h"

@interface ViewController2 ()
@property (weak, nonatomic) IBOutlet UITextField *email5;

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    _email5.text = [[EmailProvider sharedManager] email];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)didTapOk:(id)sender {
    [[EmailProvider sharedManager] setEmail:_email5.text];
    [self.navigationController popViewControllerAnimated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
