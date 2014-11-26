//
//  DataBaseHandler.h
//  数据库_9.19
//
//  Created by lothario on 14-9-19.
//  Copyright (c) 2014年 lanou3g.com. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <sqlite3.h>


//所有对数据库的操作都在这个类中处理
//把这个类写成单例类 (在一个应用程序中, 只会产生一个对象)

@interface DataBaseHandler : NSObject

{
    //创建一个数据库指针, 指向本地的数据库文件
    sqlite3 *dbPoint;
}


//单例方法
+ (DataBaseHandler *)shareInstance;

//在进行数据库的增删改查操作之前, 需要打开数据库(dbPoint跟本地的数据库文件连接起来)
- (void)openDB;
- (void)closeDB;
- (void)deleteTable:(NSString *)uid;

//创建表
- (void)createTable;
//添加表
- (void)insertStudent:(NSInteger)musicId uid:(NSString *)uid;

//查询
- (NSArray *)selectAllStudents:(NSString *)uid;


@end
