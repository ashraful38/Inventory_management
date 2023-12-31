USE [master]
GO
/****** Object:  Database [UserRegistrationDB]    Script Date: 7/22/2023 9:18:14 AM ******/
CREATE DATABASE [UserRegistrationDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UserRegistrationDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\UserRegistrationDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'UserRegistrationDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\UserRegistrationDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [UserRegistrationDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UserRegistrationDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UserRegistrationDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UserRegistrationDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UserRegistrationDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UserRegistrationDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UserRegistrationDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [UserRegistrationDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [UserRegistrationDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UserRegistrationDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UserRegistrationDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UserRegistrationDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UserRegistrationDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UserRegistrationDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UserRegistrationDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UserRegistrationDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UserRegistrationDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [UserRegistrationDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UserRegistrationDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UserRegistrationDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UserRegistrationDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UserRegistrationDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UserRegistrationDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UserRegistrationDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UserRegistrationDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [UserRegistrationDB] SET  MULTI_USER 
GO
ALTER DATABASE [UserRegistrationDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UserRegistrationDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UserRegistrationDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UserRegistrationDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [UserRegistrationDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [UserRegistrationDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'UserRegistrationDB', N'ON'
GO
ALTER DATABASE [UserRegistrationDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [UserRegistrationDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [UserRegistrationDB]
GO
/****** Object:  Table [dbo].[Catagroy]    Script Date: 7/22/2023 9:18:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Catagroy](
	[CatagoryId] [int] IDENTITY(1,1) NOT NULL,
	[CatagoryName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Catagroy] PRIMARY KEY CLUSTERED 
(
	[CatagoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 7/22/2023 9:18:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](50) NULL,
	[Color] [nvarchar](50) NULL,
	[CatagoryId] [int] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Purchase]    Script Date: 7/22/2023 9:18:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Purchase](
	[PurchaseId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NULL,
	[SupplierId] [int] NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_Purchase] PRIMARY KEY CLUSTERED 
(
	[PurchaseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 7/22/2023 9:18:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[SupplierId] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [varchar](50) NULL,
	[Moblie] [int] NULL,
	[Address] [varchar](100) NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[SupplierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRegistration]    Script Date: 7/22/2023 9:18:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRegistration](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Contact] [varchar](50) NULL,
	[Gender] [varchar](10) NULL,
	[Address] [varchar](250) NULL,
	[Username] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
 CONSTRAINT [PK_UserRegistration] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Catagroy] ON 

INSERT [dbo].[Catagroy] ([CatagoryId], [CatagoryName]) VALUES (1, N'Laptop')
INSERT [dbo].[Catagroy] ([CatagoryId], [CatagoryName]) VALUES (2, N'Mobile')
INSERT [dbo].[Catagroy] ([CatagoryId], [CatagoryName]) VALUES (3, N'pc')
INSERT [dbo].[Catagroy] ([CatagoryId], [CatagoryName]) VALUES (4, N'keybord')
SET IDENTITY_INSERT [dbo].[Catagroy] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductId], [ProductName], [Color], [CatagoryId]) VALUES (1, N'Del corei7', N'white', 1)
INSERT [dbo].[Product] ([ProductId], [ProductName], [Color], [CatagoryId]) VALUES (2, N'hp probook', N'white', 1)
INSERT [dbo].[Product] ([ProductId], [ProductName], [Color], [CatagoryId]) VALUES (3, N'del corei5', N'black', 1)
INSERT [dbo].[Product] ([ProductId], [ProductName], [Color], [CatagoryId]) VALUES (4, N'Xiaomi Redmi 12C', N'Black', 2)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Purchase] ON 

INSERT [dbo].[Purchase] ([PurchaseId], [ProductId], [SupplierId], [Quantity]) VALUES (111, 1, 1, 150)
INSERT [dbo].[Purchase] ([PurchaseId], [ProductId], [SupplierId], [Quantity]) VALUES (112, 4, 3, 4)
INSERT [dbo].[Purchase] ([PurchaseId], [ProductId], [SupplierId], [Quantity]) VALUES (114, 1, 2, 11)
SET IDENTITY_INSERT [dbo].[Purchase] OFF
GO
SET IDENTITY_INSERT [dbo].[Supplier] ON 

INSERT [dbo].[Supplier] ([SupplierId], [CompanyName], [Moblie], [Address]) VALUES (1, N'TNT ltd', 11111, N'Kuril')
INSERT [dbo].[Supplier] ([SupplierId], [CompanyName], [Moblie], [Address]) VALUES (2, N'kBc ltd', 22222, N'khilkhet')
INSERT [dbo].[Supplier] ([SupplierId], [CompanyName], [Moblie], [Address]) VALUES (3, N'RT ltd', 3333, N'Dhaka')
INSERT [dbo].[Supplier] ([SupplierId], [CompanyName], [Moblie], [Address]) VALUES (4, N'CTN Ltd', 4444, N'Dhaka')
SET IDENTITY_INSERT [dbo].[Supplier] OFF
GO
SET IDENTITY_INSERT [dbo].[UserRegistration] ON 

INSERT [dbo].[UserRegistration] ([UserID], [FirstName], [LastName], [Contact], [Gender], [Address], [Username], [Password]) VALUES (31, N'Ashraful', N'Alam', N'01788242645', N'Male', N'khilkhet', N'admin', N'1234')
INSERT [dbo].[UserRegistration] ([UserID], [FirstName], [LastName], [Contact], [Gender], [Address], [Username], [Password]) VALUES (32, N'Limon', N'Alam', N'01788242645', N'Male', N'Dhaka', N'limon', N'1234')
INSERT [dbo].[UserRegistration] ([UserID], [FirstName], [LastName], [Contact], [Gender], [Address], [Username], [Password]) VALUES (33, N'Suhas', N'IfteKhar', N'01788242645', N'Male', N'd', N'suhas', N'1111')
INSERT [dbo].[UserRegistration] ([UserID], [FirstName], [LastName], [Contact], [Gender], [Address], [Username], [Password]) VALUES (34, N'Suhas', N'IfteKhar', N'01788242645', N'Male', N'f', N'suhas1', N'111')
SET IDENTITY_INSERT [dbo].[UserRegistration] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__UserRegi__536C85E4B11A81C5]    Script Date: 7/22/2023 9:18:15 AM ******/
ALTER TABLE [dbo].[UserRegistration] ADD UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Catagroy] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Catagroy] ([CatagoryId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Catagroy]
GO
ALTER TABLE [dbo].[Purchase]  WITH CHECK ADD  CONSTRAINT [FK_Purchase_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[Purchase] CHECK CONSTRAINT [FK_Purchase_Product]
GO
ALTER TABLE [dbo].[Purchase]  WITH CHECK ADD  CONSTRAINT [FK_Purchase_Supplier] FOREIGN KEY([SupplierId])
REFERENCES [dbo].[Supplier] ([SupplierId])
GO
ALTER TABLE [dbo].[Purchase] CHECK CONSTRAINT [FK_Purchase_Supplier]
GO
/****** Object:  StoredProcedure [dbo].[Catagorylist]    Script Date: 7/22/2023 9:18:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Catagorylist]
as
begin
Select * from Catagroy
end
GO
/****** Object:  StoredProcedure [dbo].[Productdelete]    Script Date: 7/22/2023 9:18:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Productdelete] 
@ProductId int
as
begin
Delete Product where ProductId=@ProductId
end
GO
/****** Object:  StoredProcedure [dbo].[ProductList]    Script Date: 7/22/2023 9:18:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ProductList]
as
begin
select * from Product
end
GO
/****** Object:  StoredProcedure [dbo].[Productsp]    Script Date: 7/22/2023 9:18:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Productsp]
@ProductId int,
@ProductName nvarchar(50),
@Color nvarchar(50),
@CatagoryId int

as
if @ProductId=0
begin
Insert into Product (ProductName,Color, CatagoryId)
values(@ProductName, @Color, @CatagoryId)
end
GO
/****** Object:  StoredProcedure [dbo].[PurchaseDeleteById1]    Script Date: 7/22/2023 9:18:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[PurchaseDeleteById1]
@PurchaseID int
As
Begin
delete from Purchase
where PurchaseId=@PurchaseID
End
GO
/****** Object:  StoredProcedure [dbo].[PurchasepCreateOrUpdate]    Script Date: 7/22/2023 9:18:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[PurchasepCreateOrUpdate]
@PurchaseId int,
@ProductId int,
@SupplierId int,
@Quantity int

as
if @PurchaseId=0
begin
INSERT INTO Purchase(ProductId,SupplierId,Quantity)
VALUES(@ProductId,@SupplierId,@Quantity)
end
ELSE
BEGIN
UPDATE Purchase
SET
ProductId=@ProductId,
SupplierId=@SupplierId,
Quantity= @Quantity
WHERE PurchaseId=@PurchaseId
END
GO
/****** Object:  StoredProcedure [dbo].[PurchasepSP]    Script Date: 7/22/2023 9:18:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[PurchasepSP]
@PurchaseId int,
@ProductId int,
@SupplierId int,
@Quantity int

as
if @PurchaseId=0
begin
INSERT INTO Purchase(ProductId,SupplierId,Quantity)
VALUES(@ProductId,@SupplierId,@Quantity)
end
GO
/****** Object:  StoredProcedure [dbo].[PurchaseViewById1]    Script Date: 7/22/2023 9:18:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[PurchaseViewById1]
@PurchaseId int
AS
BEGIN
	
Select Purchase.PurchaseID,Product.ProductName,Supplier.CompanyName,Purchase.Quantity
from Purchase 
LEFT JOIN Product on Product.ProductId = Purchase.ProductId
LEFT JOIN Supplier on Supplier.SupplierId = Purchase.SupplierId
Where PurchaseId = @PurchaseId

END
GO
/****** Object:  StoredProcedure [dbo].[UserAddOrEdit]    Script Date: 7/22/2023 9:18:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[UserAddOrEdit]
@UserID int,
@FirstName varchar(50),
@LastName varchar(50),
@Contact varchar(50),
@Gender varchar(10),
@Address varchar(250),
@Username varchar(50),
@Password varchar(50)
AS
	IF @UserID = 0
	BEGIN
		INSERT INTO UserRegistration (FirstName,LastName,Contact,Gender,Address,Username,Password)
		VALUES (@FirstName,@LastName,@Contact,@Gender,@Address,@Username,@Password)
	END
	ELSE
	BEGIN
		UPDATE UserRegistration
		SET
			FirstName = @FirstName,
			LastName = @LastName,
			Contact = @Contact,
			Gender = @Gender,
			Address = @Address,
			Username=@Username,
			Password = @Password
		WHERE UserID = @UserID
	END

GO
/****** Object:  StoredProcedure [dbo].[UserAddOrEdit1]    Script Date: 7/22/2023 9:18:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROC [dbo].[UserAddOrEdit1]
@UserID int,
@FirstName varchar(50),
@LastName varchar(50),
@Contact varchar(50),
@Gender varchar(10),
@Address varchar(250),
@Username varchar(50),
@Password varchar(50)
AS
	
	BEGIN
	IF exists(select Username from UserRegistration where Username= @Username )
	
	BEGIN
	select 0
	END

	ELSE

	BEGIN
		INSERT INTO UserRegistration (FirstName,LastName,Contact,Gender,Address,Username,Password)
		VALUES (@FirstName,@LastName,@Contact,@Gender,@Address,@Username,@Password)
	END

	BEGIN
     select 1
    END

	END
GO
/****** Object:  StoredProcedure [dbo].[UserViewByID]    Script Date: 7/22/2023 9:18:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[UserViewByID]
@UserID int
AS
	SELECT *
	FROM UserRegistration
	WHERE UserID = @UserID
GO
/****** Object:  StoredProcedure [dbo].[viewproductlist1]    Script Date: 7/22/2023 9:18:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[viewproductlist1]
as
begin
SELECT *
FROM Product
JOIN Catagroy
ON Product.ProductId = Catagroy.CatagoryId
end
GO
/****** Object:  StoredProcedure [dbo].[viewproductlist44]    Script Date: 7/22/2023 9:18:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[viewproductlist44]
as
begin
SELECT Product.ProductId, Product.ProductName, Product.Color,Catagroy.CatagoryName
FROM Product,Catagroy
Where Product.ProductId = Catagroy.CatagoryId
end
GO
/****** Object:  StoredProcedure [dbo].[ViewPurchaseGrid1]    Script Date: 7/22/2023 9:18:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Proc [dbo].[ViewPurchaseGrid1]

As
Begin
Select Purchase.PurchaseID,Product.ProductName,Supplier.CompanyName,Purchase.Quantity 
from Supplier, Purchase 
LEFT JOIN Product on Product.ProductId = Purchase.ProductId
Where Supplier.SupplierId = Purchase.SupplierId

End
GO
USE [master]
GO
ALTER DATABASE [UserRegistrationDB] SET  READ_WRITE 
GO
