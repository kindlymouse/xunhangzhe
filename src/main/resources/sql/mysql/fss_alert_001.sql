ALTER TABLE `fs_attach`
    DROP COLUMN `from`,
	DROP COLUMN `hash`,
	DROP COLUMN `private`;

ALTER TABLE `fs_attach`
    CHANGE COLUMN `flag_del` `flag_del` TINYINT(1) NOT NULL DEFAULT '0' COMMENT '统一的is_del';

CREATE TABLE `fs_comment` (
	`id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '主键，评论编号',
	`attach_id` INT(11) NOT NULL COMMENT '被评论的图片id',
	`uid` INT(11) NOT NULL DEFAULT '0' COMMENT '评论者编号',
	`content` TEXT NOT NULL COMMENT '评论内容',
	`ctime` INT(11) NOT NULL COMMENT '评论发布的时间',
	`flag_del` TINYINT(1) NOT NULL DEFAULT '0' COMMENT '标记删除（0：没删除，1：已删除）',
	PRIMARY KEY (`id`),
	INDEX `app` (`flag_del`, `attach_id`),
	INDEX `app_3` (`flag_del`),
	INDEX `app_2` (`uid`, `flag_del`)
)
COLLATE='utf8_general_ci'
ENGINE=MyISAM;
