/**
 * Database schema required by CDbAuthManager.
 *
 * @author Qiang Xue <qiang.xue@gmail.com>
 * @link http://www.yiiframework.com/
 * @copyright 2008 Yii Software LLC
 * @license http://www.yiiframework.com/license/
 * @since 1.0
 */

drop table if exists `tbl_User_AuthAssignment`;
drop table if exists `tbl_User_AuthItemChild`;
drop table if exists `tbl_User_AuthItem`;

create table `tbl_User_AuthItem`
(
   `name`                 varchar(64) not null,
   `type`                 integer not null,
   `description`          text,
   `bizrule`              text,
   `data`                 text,
   primary key (`name`)
) engine InnoDB;

create table `tbl_User_AuthItemChild`
(
   `parent`               varchar(64) not null,
   `child`                varchar(64) not null,
   primary key (`parent`,`child`),
   foreign key (`parent`) references `tbl_User_AuthItem` (`name`) on delete cascade on update cascade,
   foreign key (`child`) references `tbl_User_AuthItem` (`name`) on delete cascade on update cascade
) engine InnoDB;

create table `tbl_User_AuthAssignment`
(
   `itemname`             varchar(64) not null,
   `userid`               varchar(64) not null,
   `bizrule`              text,
   `data`                 text,
   primary key (`itemname`,`userid`),
   foreign key (`itemname`) references `tbl_User_AuthItem` (`name`) on delete cascade on update cascade
) engine InnoDB;
