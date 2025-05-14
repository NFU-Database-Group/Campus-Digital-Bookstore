# 資料庫初始化

注意 `init_db.sql` 路徑。

```bash
mysql -u <username> -p < init_db.sql

# PowerShell
Get-Content .\init_db.sql | mysql -u <username> -p
```
