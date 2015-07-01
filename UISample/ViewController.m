//
//  ViewController.m
//  UISample
//
//  Created by gki on 2015/06/29.
//  Copyright (c) 2015年 gki. All rights reserved.
//

#import "ViewController.h"
#import "EmailProvider.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate, UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *email1;
@property (weak, nonatomic) IBOutlet UITextField *email2;
@property (weak, nonatomic) IBOutlet UITextField *email3;
@property (weak, nonatomic) IBOutlet UITextField *email4;
@property (weak, nonatomic) IBOutlet UITableView *table;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _table.delegate = self;
    _table.dataSource = self;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [_table reloadData];
    [super viewWillAppear:animated];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BasicCell"];
    
    cell.textLabel.text = @"Email";
    NSString *text = [[EmailProvider sharedManager] email] != nil ? [[EmailProvider sharedManager] email] : @"Input your email.";
    cell.detailTextLabel.text = text;
    
    return cell;
};

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"ToInputView" sender:nil];
}



- (IBAction)didTapInputWithDialog:(id)sender {
    UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:@"Input" message:@"Input your email." preferredStyle:UIAlertControllerStyleAlert];
    [alertVc addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"Email";
    }];
    
    UIAlertAction *keywordOkAction = [UIAlertAction actionWithTitle:@"OK"
                                                              style:UIAlertActionStyleDefault
                                                            handler:^(UIAlertAction *action) {
                                                                // ボタンタップ時の処理
                                                                NSLog(@"textAlert.textFields.firstObject %@", alertVc.textFields.firstObject);
                                                                UITextField *textField = alertVc.textFields.firstObject;
                                                                NSLog(@"textField %@", textField.text);
                                                                
                                                            }
                                      ];
    
    UIAlertAction *keywordCancelAction = [UIAlertAction actionWithTitle:@"CANCEL"
                                                                  style:UIAlertActionStyleDefault
                                                                handler:^(UIAlertAction *action) {
                                                                    // ボタンタップ時の処理
                                                                    
                                                                }
                                          ];
    
    // コントローラにアクションを追加
    [alertVc addAction:keywordCancelAction];
    [alertVc addAction:keywordOkAction];
    [self presentViewController:alertVc animated:YES completion:nil];

}

-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    if(gestureRecognizer.view == touch.view){
        return YES;
    }else{
        return NO;
    }
}

- (IBAction)didTapBaseView:(id)sender {
    [self.view endEditing:YES];
}

@end
