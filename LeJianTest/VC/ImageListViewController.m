//
//  ImageListViewController.m
//  LeJianTest
//
//  Created by Guo Grey on 2020/10/19.
//

#import "ImageListViewController.h"

#import "ListCollectionView.h"

#import "ListModel.h"

@interface ImageListViewController ()<ListCollectionViewDelegate>
@property(nonatomic, copy)ListCollectionView *listCollectionView;

@property (nonatomic, assign)NSInteger pageNumber;
@property (nonatomic, assign)NSInteger totoalPageSize;
@end

@implementation ImageListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setBasicUI];
    [self requestData:1];
    // Do any additional setup after loading the view.
}

-(void)setBasicUI
{
    [self.view addSubview:self.listCollectionView];
    [self.listCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(5);
        make.right.mas_equalTo(-5);
        make.top.mas_equalTo(STATUSBARHEIGHT);
        make.bottom.mas_equalTo(-BOTTOMHEIGHT);
    }];
}

-(void)requestData:(NSInteger)pageNumber
{
    NSDictionary *paramContent = @{@"userToken": USERTOKEN, @"pageNumber": @(pageNumber)};
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:paramContent options:NSJSONWritingPrettyPrinted error:nil];
    NSString *paramContentJsonStr =  [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    NSDictionary *param = @{@"ByRequest": @{@"requestData": paramContentJsonStr}};
    
    [HttpRequest requestWithURLString:GetBlindBoxSeriesLitByTabTypeURL parameters:param type:HttpRequestTypePost success:^(id  _Nonnull responseObject) {
        BOOL success = [responseObject[@"success"] boolValue];
        self.totoalPageSize = [responseObject[@"total"] integerValue];
        if(success)
        {
            self.pageNumber = pageNumber;
            NSArray *data = responseObject[@"data"];
            if(!data || self.totoalPageSize == 0)
            {
                [self showMessageWarning:@"没有数据了"];
            }
            else
            {
                NSMutableArray *listArray = [NSMutableArray array];
                for(NSDictionary *dic in data)
                {
                    ListModel *result = [[ListModel alloc]initWithDictionary:dic];
                    [listArray addObject:result];
                }
                
                if(self.listCollectionView.collectionArray && self.pageNumber != 1)
                {
                    self.listCollectionView.collectionArray = [self.listCollectionView.collectionArray arrayByAddingObjectsFromArray:listArray];
                }
                else
                {
                    self.listCollectionView.collectionArray = [NSArray arrayWithArray:listArray];
                }
                if(self.totoalPageSize == self.listCollectionView.collectionArray.count)
                {
                    [self.listCollectionView.mj_footer endRefreshingWithNoMoreData];
                }
                else
                {
                    [self.listCollectionView.mj_footer endRefreshing];
                }
                [self.listCollectionView.mj_header endRefreshing];
                [self.listCollectionView reloadData];
            }
        }
        else
        {
            [self showMessageWarning:responseObject[@"resultDesc"]];
        }
    } failure:^(NSError * _Nonnull error) {
        [MBProgressHUD hideHUDForView:self.view animated:true];
        [self showMessageWarning:@"网络连接失败"];
    }];
}

-(void)showMessageWarning:(NSString *)message
{
    MBProgressHUD *HUD = [MBProgressHUD showHUDAddedTo:self.view animated:true];
    HUD.mode = MBProgressHUDModeText;
    HUD.label.text = message;
    [HUD hideAnimated:true afterDelay:1.0f];
}

#pragma mark ListCollectionViewDelegate
-(void)selectCellIndexpath:(NSIndexPath *)indexPath
{
    NSLog(@"点击了第%ld个cell", indexPath.row);
}

#pragma mark HeaderAndFooter
-(void)refreshHeader
{
    [self.listCollectionView.mj_header beginRefreshing];
    [self requestData:1];
}

-(void)refreshFooter
{
    [self requestData:self.pageNumber + 1];
}

#pragma mark LazyLoad
- (ListCollectionView *)listCollectionView
{
    if(!_listCollectionView)
    {
        _listCollectionView = [[ListCollectionView alloc]initWithFrame:self.view.frame collectionViewLayout:[UICollectionViewFlowLayout new]];
        _listCollectionView.myDelegate = self;
        
        _listCollectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshHeader)];
        
        MJRefreshAutoFooter *footer = [MJRefreshAutoFooter footerWithRefreshingTarget:self refreshingAction:@selector(refreshFooter)];
        footer.triggerAutomaticallyRefreshPercent = -50;
        _listCollectionView.mj_footer = footer;
    }
    return _listCollectionView;
}

@end
