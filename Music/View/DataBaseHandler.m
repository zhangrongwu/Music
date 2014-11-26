//
//  DataBaseHandler.m
//  数据库_9.19
//
//  Created by lothario on 14-9-19.
//  Copyright (c) 2014年 lanou3g.com. All rights reserved.
//

#import "DataBaseHandler.h"

@implementation DataBaseHandler

+ (DataBaseHandler *)shareInstance
{
    //static 一个应用程序执行期间, 只会执行一次
    static DataBaseHandler *dbHandler = nil;
    
    if (dbHandler == nil) {
        //如果指针指向空, 就创建一个对象
        dbHandler = [[DataBaseHandler alloc] init];
        [dbHandler openDB];
        [dbHandler createTable];
    }
    
    return dbHandler;
    
}


- (void)openDB
{
    //打开数据库的函数:
    
    
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    //拼接一个数据库文件路径
    NSString *dbPath = [docPath stringByAppendingPathComponent:@"dataBase.db"];
    
    //参数1:数据库文件的路径
    //参数2:数据库指针的地址
    int result = sqlite3_open([dbPath UTF8String], &dbPoint);
    
//    SQLITE_OK  错误码
    
    NSLog(@"执行结果: %d", result);
    NSLog(@"路径: %@", dbPath);
}

- (void)closeDB
{
    //关闭数据库
    sqlite3_close(dbPoint);
}


- (void)createTable
{
    //执行SQL语句的函数
    
    //参数1:数据库指针
    //参数2:sql语句
    NSString *sql = [NSString stringWithFormat:@"create table Music (uid integer, id integer primary key)"];
    
    int result = sqlite3_exec(dbPoint, [sql UTF8String], NULL, NULL, NULL);
    
    NSLog(@"创建表结果: %d", result);
    
}

- (void)insertStudent:(NSInteger)musicId uid:(NSString *)uid
{
    NSString *sql = [NSString stringWithFormat:@"insert into Music values(%@, %d)", uid, musicId];

    int result = sqlite3_exec(dbPoint, [sql UTF8String], NULL, NULL, NULL);

    NSLog(@"执行结果:%d", result);



}
- (void)deleteTable:(NSString *)uid
{
    NSString *sql = [NSString stringWithFormat:@"delete from Music where uid=%@", uid];
    int result = sqlite3_exec(dbPoint, [sql UTF8String], NULL, NULL, NULL);
    
    NSLog(@"执行结果%d", result);
}


- (NSArray *)selectAllStudents:(NSString *)uid
{
    //1.创建一个数据库指针的替身
    //替身作为一个临时的数据库指针, 保存所有对数据库的操作, 最终确认无误后写入本地数据库
    
    sqlite3_stmt *stmt = nil;
    
    //2.检查sql语句, 准备执行
    //作用:把替身和数据库指针连接起来
    
    //参数1:数据库指针
    //参数2:sql语句
    NSString *sql = [NSString stringWithFormat:@"select id from Music where uid=%@", uid];
    //参数3:限制sql语句的长度(-1为不限制)
    //参数4:替身的指针
    int result = sqlite3_prepare_v2(dbPoint, [sql UTF8String], -1, &stmt, NULL);
    
    //对sql语句的检查结果进行判断
    if (result == SQLITE_OK) {
        
        NSMutableArray *arr = [NSMutableArray array];
        
        //当符合sql语句查询条件的结果有多行, 就执行循环体的代码
        while (sqlite3_step(stmt) == SQLITE_ROW) {
            //参数1:替身
            //参数2:取的是第几列
//            const unsigned char* nameStr = sqlite3_column_text(stmt, 0);
//            NSString *name = [NSString stringWithUTF8String:nameStr];
            //把拿到的nsstring数据给一个学生对象赋值
//            Student *stu = [[Student alloc] init];
//            stu.name = name;
            
            int a = sqlite3_column_int(stmt, 0);
//            stu.age = sqlite3_column_double(stmt, 2);
            
            //把创建好的学生对象添加到数组中
             NSString *musicId = [NSString stringWithFormat:@"%d", a];
            [arr addObject:musicId];
//            [stu release];
            
            
            
            
        }
        //释放替身的内存占用, 将替身的所有操作应用到底层数据库文件
        sqlite3_finalize(stmt);
        return arr;
    }
    //若失败,返回空
    sqlite3_finalize(stmt);
    return nil;
}


@end
