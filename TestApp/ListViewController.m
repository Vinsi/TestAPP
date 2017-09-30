//
//  ListViewController.m
//  TestApp
//
//  Created by vinsi on 9/25/17.
//  Copyright © 2017 vinsi. All rights reserved.
//

#import "ListViewController.h"
#import "APIClient.h"
#import "ItemModal.h"
@interface ListViewController ()

@property(nonatomic,strong) NSArray<MTLModel*> *items;

@end

@implementation ListViewController
-(IBAction)btnNavRightTapped:(id)sender{

    [self.navDelegate ShowNextWithNavigationController:self.navigationController];

}



- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"settings"] style:UIBarButtonItemStylePlain target:self action:@selector(btnNavRightTapped:)];
     __weak typeof (self) wkself =self;
    self.taskCallback(^(bool success, NSArray *records) {
        
        
        if(!success){
            return ;
        
        }
        wkself.items = records;
        [wkself.tblView reloadData];
        
        
    });
    
//     __weak typeof (self) wkself =self;
//    [[APIClient SharedClient] SearchAPPsinItunesWithName:@"trolley" onComplete:^(bool Success, ItemsResponseModal *response) {
//        
//        wkself.items = response.results;
//        [wkself.tblView reloadData];
//        
//        
//        
//    }];
    
    self.title = NSLocalizedString(@"apptitle", nil) ;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark tableView delegate


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString* cellIdentifier = @"CellIdentifier";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    ItemModal *item = self.items[indexPath.row];
    cell.textLabel.text = item.artistName ;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}


@end
