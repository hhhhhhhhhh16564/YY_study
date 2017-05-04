//
//  TableViewController.m
//  archiviewroot
//
//  Created by 周磊 on 16/6/1.
//  Copyright © 2016年 zhl. All rights reserved.
//

#import "TableViewController.h"
#import "NSObject+YYAdd.h"

#import "Model.h"
#import "TableViewCell.h"

static const int block_key;

@interface TableViewController ()
@property(nonatomic, strong) NSMutableArray *mutableArray;
@property(nonatomic, strong) Model *model;
@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor greenColor];
    
    self.model = [[Model alloc]init];
    
    [self.model addObserver:self forKeyPath:@"name" options:(NSKeyValueObservingOptionNew) context:@"哈哈哈"];
   
    JULog(@"%p", &block_key);
    
    int a = 0;
    
    JULog(@"%p", &a);

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    static int i = 100;
    i++;
    
    self.model.name = [NSString stringWithFormat:@"%d",i];
   
    
}


-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    
    JULog(@"值改变: %@ \n ", change);
    
    JULog(@"NSKeyValueChangeOldKey  ：%@", change[NSKeyValueChangeOldKey]);
    JULog(@"NSKeyValueChangeNewKey  ：%@", change[NSKeyValueChangeNewKey]);
    JULog(@"NSKeyValueChangeKindKey  ：%@", change[NSKeyValueChangeKindKey]);
    JULog(@"NSKeyValueChangeIndexesKey  ：%@", change[NSKeyValueChangeIndexesKey]);
    JULog(@"NSKeyValueChangeNotificationIsPriorKey  ：%@", change[NSKeyValueChangeNotificationIsPriorKey]);

    
}

-(void)setBackgroundColor:(UIColor *)color{
    self.view.backgroundColor = color;
}

-(void)text1{
    
    Class archiver;
    Class unarchiver;
    
    @try {
         [unarchiver unarchiveObjectWithData:[archiver archivedDataWithRootObject:self]];

    
        
    } @catch (NSException *exception) {
        
        
        
    }
    
    JULog(@"text1");

}


-(void)text2{
    
    JULog(@"text2");
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)dealloc
{
    [self.model removeObserver:self forKeyPath:@"name"];
}




@end
