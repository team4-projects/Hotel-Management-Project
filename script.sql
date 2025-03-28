USE [master]
GO
/****** Object:  Database [testht]    Script Date: 15/03/2025 9:50:35 CH ******/
CREATE DATABASE [testht]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'testht', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\testht.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'testht_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\testht_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [testht] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [testht].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [testht] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [testht] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [testht] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [testht] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [testht] SET ARITHABORT OFF 
GO
ALTER DATABASE [testht] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [testht] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [testht] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [testht] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [testht] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [testht] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [testht] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [testht] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [testht] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [testht] SET  ENABLE_BROKER 
GO
ALTER DATABASE [testht] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [testht] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [testht] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [testht] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [testht] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [testht] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [testht] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [testht] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [testht] SET  MULTI_USER 
GO
ALTER DATABASE [testht] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [testht] SET DB_CHAINING OFF 
GO
ALTER DATABASE [testht] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [testht] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [testht] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [testht] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [testht] SET QUERY_STORE = ON
GO
ALTER DATABASE [testht] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [testht]
GO
/****** Object:  Table [dbo].[Booking]    Script Date: 15/03/2025 9:50:36 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Booking](
	[idBooking] [int] IDENTITY(1,1) NOT NULL,
	[idUser] [int] NOT NULL,
	[idRoom] [int] NOT NULL,
	[checkInDate] [date] NOT NULL,
	[checkOutDate] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idBooking] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer_Food]    Script Date: 15/03/2025 9:50:36 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer_Food](
	[idUser_Food] [int] IDENTITY(1,1) NOT NULL,
	[idUser] [int] NOT NULL,
	[idFood] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[sumPrice] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idUser_Food] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Food]    Script Date: 15/03/2025 9:50:36 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Food](
	[idFood] [int] IDENTITY(1,1) NOT NULL,
	[nameFood] [nvarchar](100) NOT NULL,
	[price] [float] NOT NULL,
	[description] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[idFood] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 15/03/2025 9:50:36 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[idRole] [int] NOT NULL,
	[nameRole] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idRole] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 15/03/2025 9:50:36 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[idRoom] [int] NOT NULL,
	[nameRoom] [nvarchar](100) NOT NULL,
	[price] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idRoom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 15/03/2025 9:50:36 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[idUser] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[password] [nvarchar](255) NOT NULL,
	[email] [nvarchar](100) NOT NULL,
	[phone] [nvarchar](15) NOT NULL,
	[idRole] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Booking] ON 

INSERT [dbo].[Booking] ([idBooking], [idUser], [idRoom], [checkInDate], [checkOutDate]) VALUES (2, 8, 404, CAST(N'2025-03-15' AS Date), CAST(N'2025-03-29' AS Date))
INSERT [dbo].[Booking] ([idBooking], [idUser], [idRoom], [checkInDate], [checkOutDate]) VALUES (7, 8, 401, CAST(N'2025-03-30' AS Date), CAST(N'2025-03-31' AS Date))
INSERT [dbo].[Booking] ([idBooking], [idUser], [idRoom], [checkInDate], [checkOutDate]) VALUES (13, 8, 503, CAST(N'2025-03-29' AS Date), CAST(N'2025-03-31' AS Date))
SET IDENTITY_INSERT [dbo].[Booking] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer_Food] ON 

INSERT [dbo].[Customer_Food] ([idUser_Food], [idUser], [idFood], [quantity], [sumPrice]) VALUES (8, 8, 1, 1, 50000)
INSERT [dbo].[Customer_Food] ([idUser_Food], [idUser], [idFood], [quantity], [sumPrice]) VALUES (9, 8, 3, 1, 50000)
INSERT [dbo].[Customer_Food] ([idUser_Food], [idUser], [idFood], [quantity], [sumPrice]) VALUES (12, 8, 5, 12, 24000000)
SET IDENTITY_INSERT [dbo].[Customer_Food] OFF
GO
SET IDENTITY_INSERT [dbo].[Food] ON 

INSERT [dbo].[Food] ([idFood], [nameFood], [price], [description]) VALUES (1, N'Fish Sandwich', 50000, NULL)
INSERT [dbo].[Food] ([idFood], [nameFood], [price], [description]) VALUES (2, N'Bò Nướng', 4000000, NULL)
INSERT [dbo].[Food] ([idFood], [nameFood], [price], [description]) VALUES (3, N'Kem Flan', 50000, NULL)
INSERT [dbo].[Food] ([idFood], [nameFood], [price], [description]) VALUES (4, N'Sushi', 3000000, NULL)
INSERT [dbo].[Food] ([idFood], [nameFood], [price], [description]) VALUES (5, N'Tôm Hùm', 2000000, NULL)
INSERT [dbo].[Food] ([idFood], [nameFood], [price], [description]) VALUES (6, N'Steak Wagyu', 1500000, NULL)
INSERT [dbo].[Food] ([idFood], [nameFood], [price], [description]) VALUES (7, N'Truffle Pasta', 900000, NULL)
INSERT [dbo].[Food] ([idFood], [nameFood], [price], [description]) VALUES (8, N'Hàu Tươi', 500000, NULL)
SET IDENTITY_INSERT [dbo].[Food] OFF
GO
INSERT [dbo].[Role] ([idRole], [nameRole]) VALUES (1, N'USER')
INSERT [dbo].[Role] ([idRole], [nameRole]) VALUES (2, N'ADMIN')
GO
INSERT [dbo].[Room] ([idRoom], [nameRoom], [price]) VALUES (401, N'Single Room 401', 1200000)
INSERT [dbo].[Room] ([idRoom], [nameRoom], [price]) VALUES (402, N'Single Room 402', 1500000)
INSERT [dbo].[Room] ([idRoom], [nameRoom], [price]) VALUES (403, N'Single Room 403', 1200000)
INSERT [dbo].[Room] ([idRoom], [nameRoom], [price]) VALUES (404, N'Single Room 404', 1500000)
INSERT [dbo].[Room] ([idRoom], [nameRoom], [price]) VALUES (501, N'Double Room 501', 2000000)
INSERT [dbo].[Room] ([idRoom], [nameRoom], [price]) VALUES (502, N'Double Room 502', 2500000)
INSERT [dbo].[Room] ([idRoom], [nameRoom], [price]) VALUES (503, N'Double Room 503
', 2000000)
INSERT [dbo].[Room] ([idRoom], [nameRoom], [price]) VALUES (504, N'Double Room 504
', 2500000)
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([idUser], [name], [password], [email], [phone], [idRole]) VALUES (8, N'huy', N'1', N'huy@gmail.com', N'1', 1)
INSERT [dbo].[Users] ([idUser], [name], [password], [email], [phone], [idRole]) VALUES (9, N'minh', N'1', N'minh@gmail.com', N'123', 2)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__AB6E61643E5CE70E]    Script Date: 15/03/2025 9:50:36 CH ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__B43B145F3A0C66DD]    Script Date: 15/03/2025 9:50:36 CH ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD FOREIGN KEY([idRoom])
REFERENCES [dbo].[Room] ([idRoom])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD FOREIGN KEY([idUser])
REFERENCES [dbo].[Users] ([idUser])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Customer_Food]  WITH CHECK ADD FOREIGN KEY([idFood])
REFERENCES [dbo].[Food] ([idFood])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Customer_Food]  WITH CHECK ADD FOREIGN KEY([idUser])
REFERENCES [dbo].[Users] ([idUser])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([idRole])
REFERENCES [dbo].[Role] ([idRole])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [CHK_CheckInDate] CHECK  (([checkInDate]>=CONVERT([date],getdate())))
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [CHK_CheckInDate]
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [CHK_DateRange] CHECK  (([checkInDate]<[checkOutDate]))
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [CHK_DateRange]
GO
ALTER TABLE [dbo].[Customer_Food]  WITH CHECK ADD CHECK  (([quantity]>(0)))
GO
ALTER TABLE [dbo].[Customer_Food]  WITH CHECK ADD CHECK  (([sumPrice]>(0)))
GO
ALTER TABLE [dbo].[Food]  WITH CHECK ADD CHECK  (([price]>(0)))
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD CHECK  (([price]>(0)))
GO
USE [master]
GO
ALTER DATABASE [testht] SET  READ_WRITE 
GO
