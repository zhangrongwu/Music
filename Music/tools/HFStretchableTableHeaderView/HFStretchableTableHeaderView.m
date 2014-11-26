//
//  StretchableTableHeaderView.m
//  StretchableTableHeaderView
//

#import "HFStretchableTableHeaderView.h"

@interface HFStretchableTableHeaderView()
{
    CGRect initialFrame;
    CGFloat defaultViewHeight;
    CGFloat defaultViewWith;
}
@end


@implementation HFStretchableTableHeaderView

@synthesize tableView = _tableView;
@synthesize view = _view;

- (void)stretchHeaderForTableView:(UITableView*)tableView withView:(UIView*)view
{
    _tableView = tableView;
    _view = view;
    
    initialFrame       = _view.frame;
    defaultViewHeight  = initialFrame.size.height;
    defaultViewWith    = initialFrame.size.width;
    
    UIView* emptyTableHeaderView = [[UIView alloc] initWithFrame:initialFrame];
    _tableView.tableHeaderView = emptyTableHeaderView;
    
    [_tableView addSubview:_view];
}

- (void)scrollViewDidScroll:(UIScrollView*)scrollView
{
//    CGRect f = _view.frame;
//    f.size.width = _tableView.frame.size.width;
//    _view.frame = f;
//    
//    if(scrollView.contentOffset.y < 0) {
//        CGFloat offsetY = (scrollView.contentOffset.y + scrollView.contentInset.top) * -1;
//    initialFrame.origin.y = offsetY * -1;
////        initialFrame.origin.x = offsetY * -1;
//        initialFrame.size.height = defaultViewHeight + offsetY;
//        initialFrame.size.width = defaultViewWith + offsetY;
//        _view.frame = initialFrame;
//
//    }
    
    CGFloat yOffset   = scrollView.contentOffset.y;
    if (yOffset < 0) {
        
        CGFloat factor = ((ABS(yOffset)+defaultViewHeight)*defaultViewWith)/defaultViewHeight;
        CGRect f = CGRectMake(-(factor-defaultViewWith)/2, 0, factor, defaultViewHeight+ABS(yOffset));
        _view.frame = f;
    } else {
        CGRect f = _view.frame;
        f.origin.y = -yOffset;
        _view.frame = f;
    }
    
}

- (void)resizeView
{
    initialFrame.size.width = _tableView.frame.size.width;
    _view.frame = initialFrame;
}


@end
