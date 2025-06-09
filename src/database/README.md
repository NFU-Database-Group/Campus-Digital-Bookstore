# 資料庫初始化

執行順序：

1. `tables.sql`
2. `data.sql`
3. `accounts.sql` (WIP)
4. `views.sql`

```bash
mysql -u <username> -p < init_db.sql

# PowerShell
Get-Content .\init_db.sql | mysql -u <username> -p
```
