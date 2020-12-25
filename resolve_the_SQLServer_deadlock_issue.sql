-- =============================================
--文件    :resolve_the_SQLServer_deadlock_issue.sql
--说明    :解决SQLserver死锁问题
--时间    :2020/12/25 10:30:12
--作者    :一直都没有暴富成功的小何
--版本    :1.0
-- =============================================
-- 解决死锁问题
select spid, blocked, loginame, last_batch, status, cmd, hostname, program_name
from sysprocesses
where spid in
( select blocked from sysprocesses where blocked <> 0 ) or (blocked <>0)
---进程号 直接替换spid
kill spid
