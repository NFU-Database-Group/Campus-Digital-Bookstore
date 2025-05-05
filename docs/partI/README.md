# Part I

[討論(Github Issue)](https://github.com/NFU-Database-Group/Project-Library/issues/1)

## Table of Content

- [系統需求說明](#系統需求說明)
- [系統分析討論](#系統分析討論)
- [應用情境與使用案例](#應用情境與使用案例)
- [實體關係圖及詳細說明](#實體關係圖及詳細說明)
- [完整性限制](#完整性限制)

## 系統需求說明

- 提供線上網頁服務給讀者
- 書城管理員能夠管理電子書籍
- 讀者能夠借閱與瀏覽電子書

### 功能性需求

- 帳戶管理
  - 讀者或書城管理員可以建立帳號
  - 讀者或書城管理員可以修改帳戶資訊 (如重設密碼等)
  - 書城管理員可以調閱讀者非機密性資訊
- 借閱管理
  - 讀者可以借閱、歸還書籍
  - 書籍有逾期日期屬性
  - 讀者可以查詢借閱紀錄
- 書籍查詢
  - 讀者可以透過ISBN和書名等方式搜尋書籍
- 館藏管理
  - 書城管理員可以管理館藏書籍 (如新增、修改和刪除等)

### 非功能性需求

- 前端圖形化介面
  - 前端響應式設計
  - 黑白主題選項

## 系統分析討論

### 系統使用角色

- 校內讀者
- 書城管理員
- 系統管理員

### 數位書城的使用介面

- 校內讀者的網站
- 書城管理員的後台系統
- 系統管理員的管理系統

## 應用情境與使用案例

### 應用情境

### 使用案例

### 使用案例圖

![Image](https://github.com/user-attachments/assets/ae79fa8d-18e9-4d6f-ac0d-4ae22427350b)

## 實體關係圖及詳細說明

![Image](https://github.com/user-attachments/assets/7ab5af19-315d-43d3-aa39-b47faf23bcd1)

### User

- Attributes
  - UserId (主鍵，使用者ID)
  - Name (使用者名稱)
  - Email (使用者電子郵件)
- Participations
  - authorize，使用者授權給零個管理員
  - rent for，使用者借閱一至多本書
  - read，使用者讀零至多本書

### Admin

- Attributes
  - AdminId (主鍵，管理員ID)
- Participations
  - authorize，管理員授權給一至多個使用者
  - maintain，管理員管理一至多本書

### Book

- Attributes
  - BookId (主鍵，書籍ID)
  - ISBN (書籍ISBN)
  - Amount (正本數量)
  - Publisher (出版社)
  - Release Date (出版日期)
- Participations
  - maintain，書籍管理零個管理員
  - copy to，書籍複製成一至多個副本，並設有時間戳記

### AccessCopy

- Attributes
  - CopyId (主鍵，副本ID)
  - OpenDate (借閱日期)
  - ExpireDate (逾期日期)
  - Owner (擁有者)
- Participations
  - read，副本被一位使用者閱讀
  - copy to，副本無法複製成正本(零個)

## 完整性限制

### 角色與主鍵

| 資料表 | 欄位名稱       | 資料型態     | 說明                     |
|-------|----------------|-------------|--------------------------|
| User        | userId  | int         |  使用者的唯一識別碼        |
| Book        | bookId  | int          |  書籍(正本)的唯一識別碼    |
| BookTitle   | titleId | int         |  書籍標題(不同語言)的唯一識別碼  |
| AccessCopy  | copyId  | int         |  借閱紀錄的唯一識別碼      |

### 外鍵與參照

| 資料表   | 鍵值       | 參照資料表 | 參照鍵值   |
|------|------|------|------|
|BookTitle|bookId|Book|bookId|
|AccessCopy|owner|User|userId|

### 靜態限制

#### User

| 欄位名稱 | 欄位說明       | 資料型態     | 限制                     | 是否可為空 |
|---------|----------------|-------------|--------------------------|----------|
| userId | 使用者ID | int | 八位數字或一字母搭配五位數字 | 否 |

#### Book

| 欄位名稱 | 欄位說明       | 資料型態     | 限制                     | 是否可為空 |
|---------|----------------|-------------|--------------------------|----------|
| isbn    | 書籍ISBN       | varchar(13)      | 必須符合ISBN-10或ISBN-13格式 | 否 |

#### AccessCopy

| 欄位名稱 | 欄位說明       | 資料型態     | 限制                     | 是否可為空 |
|---------|----------------|-------------|--------------------------|----------|
| ExpireDate | 逾期日期     | date      | 日期不得早於當下 | 否 |
