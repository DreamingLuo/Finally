//
//  BGViewController.m
//  EmptyNester
//
//  Created by shao on 16/5/16.
//  Copyright © 2016年 曹少帅. All rights reserved.
//

#import "BGViewController.h"

@interface BGViewController ()

@end

@implementation BGViewController

@synthesize textView;
@synthesize accessoryView;

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [textView becomeFirstResponder];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillShow:)name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:)name:UIKeyboardWillHideNotification object:nil];
    
}
- (void)viewDidUnload {
    
    [super viewDidUnload];
    
    self.textView =nil;
    self.accessoryView =nil;
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}
- (BOOL)textViewShouldBeginEditing:(UITextView *)aTextView {
    
    /*
     添加AccessoryView 附属视图
     */
    
    if (textView.inputAccessoryView ==nil) {
        [[NSBundle mainBundle] loadNibNamed:@"AccessoryView"owner:self options:nil];
        
        textView.inputAccessoryView =accessoryView;
        
        
        // 设置完之后我们不需要总是对附属视图进行引用！可以置为空
        self.accessoryView =nil;
    }
    
    return YES;
}
#pragma mark Responding to keyboard events

- (void)keyboardWillShow:(NSNotification *)notification {
    
    NSDictionary *userInfo = [notification userInfo];
    
    NSValue* aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    
    CGRect keyboardRect = [aValue CGRectValue];
    keyboardRect = [self.view convertRect:keyboardRect fromView:nil];
    
    CGFloat keyboardTop = keyboardRect.origin.y;
    CGRect newTextViewFrame = self.view.bounds;
    newTextViewFrame.size.height = keyboardTop -self.view.bounds.origin.y;
    
    NSValue *animationDurationValue = [userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration;
    [animationDurationValue getValue:&animationDuration];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:animationDuration];
    
    textView.frame = newTextViewFrame;
    
    [UIView commitAnimations];
}
- (void)keyboardWillHide:(NSNotification *)notification {
    
    NSDictionary* userInfo = [notification userInfo];
    
    NSValue *animationDurationValue = [userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    
    NSTimeInterval animationDuration;
    [animationDurationValue getValue:&animationDuration];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:animationDuration];
    
    textView.frame =self.view.bounds;
    
    [UIView commitAnimations];
}
- (void)dealloc
{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:nil object:nil];
}

- (BOOL)textViewShouldEndEditing:(UITextView *)aTextView {
    [aTextView resignFirstResponder];
    return YES;
}


- (IBAction)sendMessage:(UIButton *)sender
{
    NSMutableString *text = [textView.text mutableCopy];
    NSRange selectedRange = textView.selectedRange;
    [text replaceCharactersInRange:selectedRange withString:_textField.text];
    textView.text =text;
}
@end
