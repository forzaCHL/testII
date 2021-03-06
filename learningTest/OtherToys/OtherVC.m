//
//  OtherVC.m
//  learningTest
//
//  Created by Apple on 2018/3/29.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "OtherVC.h"
#import "RSAViewController.h"
#import "MyCollectionViewCell.h"
#import "BannerViewController.h"
#import "KvokvcVC.h"
#import "cats.h"
#import "dogs.h"
@interface OtherVC ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
{
    UICollectionView *mainCollectionView;
}
@end

@implementation OtherVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"Other Chicken Leg";
    //1.初始化layout
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    //设置collectionView滚动方向
    //    [layout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    //设置headerView的尺寸大小
    layout.headerReferenceSize = CGSizeMake(self.view.frame.size.width, 44);
    //该方法也可以设置itemSize
//    layout.itemSize =CGSizeMake(110, 150);
    
    //2.初始化collectionView
    mainCollectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    [self.view addSubview:mainCollectionView];
    mainCollectionView.backgroundColor = [UIColor clearColor];
    
    //3.注册collectionViewCell
    //注意，此处的ReuseIdentifier 必须和 cellForItemAtIndexPath 方法中 一致 均为 cellId
    [mainCollectionView registerClass:[MyCollectionViewCell class] forCellWithReuseIdentifier:@"cellId"];
    
    //注册headerView  此处的ReuseIdentifier 必须和 cellForItemAtIndexPath 方法中 一致  均为reusableView
    [mainCollectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"reusableView"];
    
    //4.设置代理
    mainCollectionView.delegate = self;
    mainCollectionView.dataSource = self;
    
}

#pragma mark collectionView代理方法
//返回section个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 5;
}

//每个section的item个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 9;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    MyCollectionViewCell *cell = (MyCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"cellId" forIndexPath:indexPath];
    cell.contentView.layer.borderWidth = .5;
    cell.contentView.layer.borderColor = [UIColor redColor].CGColor;
    cell.botlabel.text = [NSString stringWithFormat:@"{%ld,%ld}",(long)indexPath.section,(long)indexPath.row];
    
//    cell.backgroundColor = [UIColor yellowColor];
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0:
                cell.botlabel.text = @"应用跳转";
                break;
            case 1:
                cell.botlabel.text = @"RSA&AES";
                break;
            case 2:
                cell.botlabel.text = @"BannerView";
                break;
            case 3:
                cell.botlabel.text = @"kvokvc";
                break;
            case 4:
                cell.botlabel.text = @"table-cat";
                break;
            case 5:
                cell.botlabel.text = @"table-dog";
                break;
            default:
                break;
        }
    }
    
    return cell;
}

//设置每个item的尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(70, 90);
}

//footer的size
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
//{
//    return CGSizeMake(10, 10);
//}

//header的size
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
//{
//    return CGSizeMake(10, 10);
//}

//设置每个item的UIEdgeInsets
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}

//设置每个item水平间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}


//设置每个item垂直间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 15;
}

//通过设置SupplementaryViewOfKind 来设置头部或者底部的view，其中 ReuseIdentifier 的值必须和 注册是填写的一致，本例都为 “reusableView”
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"reusableView" forIndexPath:indexPath];
    headerView.backgroundColor = RGB(240, 240, 240);
    
    
//    重用
//    UILabel *label = [[UILabel alloc] initWithFrame:headerView.bounds];
//    label.text = @"这是collectionView的头部";
//    label.font = [UIFont systemFontOfSize:20];
//    [headerView addSubview:label];
    
    
    UILabel *label1 = [headerView viewWithTag:3000];
    if (!label1) {
        label1 = [[UILabel alloc] initWithFrame:headerView.bounds];
        label1.tag = 3000;
        label1.font = [UIFont systemFontOfSize:20];
        [headerView addSubview:label1];
    }
    
    label1.text = [NSString stringWithFormat:@"这是collectionView的头部:%zd,%zd",indexPath.section,indexPath.row];
    
    
    return headerView;
    
    
    
}



//点击item方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    MyCollectionViewCell *cell = (MyCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    NSString *msg = cell.botlabel.text;
    NSLog(@"%@",msg);
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0:
            {
                AppPushViewController *vc =[AppPushViewController new];
                [self.navigationController pushViewController:vc animated:YES];
            }
                break;
            case 1:
            {
                RSAViewController *vc =[RSAViewController new];
                [self.navigationController pushViewController:vc animated:YES];
            }
                break;
            case 2:
            {
                BannerViewController *vc =[BannerViewController new];
                [self.navigationController pushViewController:vc animated:YES];
            }
                break;
            case 3:
            {
                KvokvcVC *vc =[KvokvcVC new];
                [self.navigationController pushViewController:vc animated:YES];
            }
                break;
            case 4:
            {
                cats *vc =[cats new];
                [self.navigationController pushViewController:vc animated:YES];
            }
                break;
            case 5:
            {
                dogs *vc =[dogs new];
                [self.navigationController pushViewController:vc animated:YES];
            }
                break;
            default:
                break;
        }
    }
}


//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    RSAViewController *vc = [RSAViewController new];
//    [self.navigationController pushViewController:vc animated:YES];
//}

@end
