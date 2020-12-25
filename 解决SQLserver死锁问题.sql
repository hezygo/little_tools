-- 解决死锁问题
select spid, blocked, loginame, last_batch, status, cmd, hostname, program_name
from sysprocesses
where spid in
( select blocked from sysprocesses where blocked <> 0 ) or (blocked <>0)
---进程号 直接替换spid
kill spid