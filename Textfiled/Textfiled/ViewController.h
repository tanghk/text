//
//  ViewController.h
//  Textfiled
//
//  Created by otouzi on 2016/12/23.
//  Copyright © 2016年 tanghk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate>
{

 
    BOOL _dot;
    UITextField *_enterAmount;//输入金额
}

@end

