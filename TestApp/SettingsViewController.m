//
//  SettingsViewController.m
//  TestApp
//
//  Created by vinsi on 9/30/17.
//  Copyright © 2017 vinsi. All rights reserved.
//

#import "SettingsViewController.h"
#import "LanguageManager.h"
@interface SettingsViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UITextField *txtLanguage;
@property(nonatomic,strong) UIPickerView *pkrLanguage;
@property(nonatomic,strong) NSArray *items;
@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.items = [LanguageManager languageStrings];
    self.pkrLanguage =[[ UIPickerView alloc]init];
    [self.pkrLanguage reloadInputViews];
    self.txtLanguage.inputView =self.pkrLanguage;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Picker delegates
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{

    return self.items.count;
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{

    return self.items[row];

}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{


    self.txtLanguage.text = self.items[row];
}
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{

    return 1;
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
