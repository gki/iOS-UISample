//
//  ViewController3.m
//  UISample
//
//  Created by gki on 2015/06/30.
//  Copyright (c) 2015年 gki. All rights reserved.
//

#import "ViewController3.h"
#import "UIView+Toast.h"
#import <SVProgressHUD/SVProgressHUD.h>

@interface ViewController3 ()

@property (weak, nonatomic) IBOutlet UILabel *checkmarkLabel;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *partlyIndicator;
@property (weak, nonatomic) IBOutlet UIButton *checkButton;
@property (weak, nonatomic) IBOutlet UISwitch *showAlertTitleSwitch;

@end

@implementation ViewController3

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _checkButton.layer.borderColor = _checkButton.titleLabel.textColor.CGColor;
    _checkButton.layer.borderWidth = 1.0f;
    _checkButton.layer.cornerRadius = 5.0f;
    _checkButton.clipsToBounds = YES;
}

- (void)viewWillAppear:(BOOL)animated {
    _checkmarkLabel.hidden = YES;
    _partlyIndicator.hidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)didTapShowErrorAlert:(id)sender {
    
    NSString* title = nil;
    if (_showAlertTitleSwitch.on) {
        title = @"エラー";
    }
    
    UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:title message:@"新しいパスワードを入力してください。少なくとも、６文字以上で、大文字、小文字、数字を含めてください。" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *keywordOkAction = [UIAlertAction actionWithTitle:@"OK"
                                                              style:UIAlertActionStyleDefault
                                                            handler:nil
                                      ];
    
    // コントローラにアクションを追加
    [alertVc addAction:keywordOkAction];
    [self presentViewController:alertVc animated:YES completion:nil];

}
- (IBAction)didTapShowConfirmationAlert:(id)sender {
    
    NSString* title = nil;
    if (_showAlertTitleSwitch.on) {
        title = @"Confirmation";
    }
    
    UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:title message:@"Pairing Coaching Sensors Can Be Done by Settings on Type-R." preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *keywordOkAction = [UIAlertAction actionWithTitle:@"OK"
                                                              style:UIAlertActionStyleDefault
                                                            handler:nil
                                      ];
    UIAlertAction *keywordCancelAction = [UIAlertAction actionWithTitle:@"Cancel"
                                                              style:UIAlertActionStyleCancel
                                                            handler:nil
                                      ];
    
    // コントローラにアクションを追加
    [alertVc addAction:keywordOkAction];
    [alertVc addAction:keywordCancelAction];
    [self presentViewController:alertVc animated:YES completion:nil];
}

- (IBAction)didTapShowIndicatorFullScreen:(id)sender {
    [SVProgressHUD showWithStatus:@"Connecting..." maskType:SVProgressHUDMaskTypeBlack];
    [self performSelector:@selector(dismissProgress) withObject:nil afterDelay:5.0f];
}

- (void)dismissProgress {
    [SVProgressHUD dismiss];
    
}


- (IBAction)didTapShowPartlyIndicator:(id)sender {
    
    if (_partlyIndicator.isAnimating) {
        return;
    }
    _checkmarkLabel.hidden = YES;
    _partlyIndicator.hidden = NO;
    [_partlyIndicator startAnimating];
    
    [self performSelector:@selector(stopPartlyIndicator) withObject:nil afterDelay:5.0f];
}

- (void)stopPartlyIndicator {
    [_partlyIndicator stopAnimating];
    _partlyIndicator.hidden = YES;
    _checkmarkLabel.hidden = NO;
}

- (IBAction)didTapShowToast:(id)sender {
    [self.view makeToast:@"Analyzing your uploaded data is finished."];
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
