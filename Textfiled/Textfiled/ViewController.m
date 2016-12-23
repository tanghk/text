//
//  ViewController.m
//  Textfiled
//
//  Created by otouzi on 2016/12/23.
//  Copyright © 2016年 tanghk. All rights reserved.
//

#import "ViewController.h"

#define kScreenWidth   ([UIScreen mainScreen].bounds.size.width)
#define kScreenHeight   ([UIScreen mainScreen].bounds.size.height)
@interface ViewController ()

@end
//输入金额判断，
//第一位为0 第二位只能是”.“
//第一位为“.”变为0.
//小数点后质能输入两位
//最大输入金额9位数


 
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self createTextFiled];
    
}



 

-(void)createTextFiled{

    /*
     //     *请输入金额
     //     */
        _enterAmount = [UITextField new];
        _enterAmount.delegate = self;
    _enterAmount.layer.borderWidth = 1;
        _enterAmount.keyboardType = UIKeyboardTypeDecimalPad;
        _enterAmount.clearButtonMode = UITextFieldViewModeAlways;
        _enterAmount.font = [UIFont boldSystemFontOfSize:17];
        _enterAmount.placeholder = @"请输入提现金额";
        [_enterAmount addTarget:self
                         action:@selector(textFiledChanged:)
                   forControlEvents:UIControlEventEditingChanged];
    
    _enterAmount.frame = CGRectMake(30, kScreenHeight/3, kScreenWidth-60, 40);
        [self.view addSubview:_enterAmount];
    


}



- (void)textFiledChanged:(UITextField *)textField{
    
    
    
    NSLog(@"输入数字：%@",textField.text);
    
    
    
   

}
// 清除文字按钮点击事件
- (BOOL)textFieldShouldClear:(UITextField *)textField {
    // NSLog(@"清除输入内容了");
    _dot = NO;
       return YES;
}



// 判断是否输入内容，或者用户点击的是键盘的删除按钮
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    // 判断是否输入内容，或者用户点击的是键盘的删除按钮
    
    
    if (![string isEqualToString:@""]) {
        
        
        
        if (textField == _enterAmount) {
            
            // 小数点在字符串中的位置 第一个数字从0位置开始
            
            NSInteger dotLocation = [textField.text rangeOfString:@"."].location;
            
            
            
            // 判断字符串中是否有小数点，并且小数点不在第一位
            
            // NSNotFound 表示请求操作的某个内容或者item没有发现，或者不存在
            
            // range.location 表示的是当前输入的内容在整个字符串中的位置，位置编号从0开始
            
            if (dotLocation == NSNotFound && range.location != 0) {
                
                // 取只包含“myDotNumbers”中包含的内容，其余内容都被去掉

                if (range.location >= 9)
                {
                    
                    NSLog(@"单笔金额不能超过亿位");
                    
                    if ([string isEqualToString:@"."] && range.location == 9)
                    {
                        
                    return YES;
                        
                    }

                    return NO;
                    
                }else{
                    
                    
                    if (_dot ==YES)
                    {
                        
                        if ([string isEqualToString:@"."])
                        {
                            
                        return YES;
                        }
                        
                        return NO;
                        
                        
                    }else{
                        
                        
                        NSString *first = [textField.text substringFromIndex:0];
                        if ([first isEqualToString:@"0"])
                        {
                            
                            if ([string isEqualToString:@"."])
                            {
                                
                            return YES;
                            }
                            
                            return NO;
                            
                        }else{
                            
                            return YES;
                            
                        }
                        
                    }
                    
                }
                
            }else {
                
                
                if ([string isEqualToString:@"."]){
                    
                    NSString *first = [textField.text substringFromIndex:0];
                    
                    if ([first isEqualToString:@"0"]) {
                        
                        _enterAmount.text = @"0";
                        
                    }else if ([first isEqualToString:@""]){
                        
                        _enterAmount.text = @"0";
                        
                    }else{
                        
                        if ([string isEqualToString:@"."]){
                            
                            return NO;
                            
                        }
                        
                        return YES;
                    }
                }
                
                
              
                if ([string isEqualToString:@"0"]){
                    
                    _dot =YES;
                    
                }else{
                    _dot =NO;
                    
                    
                }
          
            
            }
            
         
            
            
            
            if (dotLocation != NSNotFound && range.location > dotLocation + 2) {
                
                
                return NO;
                
            }
            
            if (textField.text.length > 11) {
                
                return NO;
                
            }
            
        }
        
    }
    
    return YES;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
