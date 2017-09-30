//
//  ListViewController.h
//  TestApp
//
//  Created by vinsi on 9/25/17.
//  Copyright © 2017 vinsi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListCellTableViewCell.h"
#import "INextNavigating.h"

typedef void(^blkOnComplete)(bool success,NSArray *records );
typedef void(^blkTask)(blkOnComplete callback) ;
typedef UITableViewCell* (blkCreateCell)(UITableViewCell*cell,NSIndexPath *indexpath);



@interface ListViewController : UIViewController
@property(nonatomic,copy) blkTask taskCallback;

@property(nonatomic,weak) IBOutlet UITableView *tblView;
@property(nonatomic,strong) id<INextNavigating>navDelegate;


@end
