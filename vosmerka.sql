USE [VosmerkaBase]
GO
/****** Object:  Table [dbo].[Agent]    Script Date: 19.02.2022 17:48:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Agent](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[IDAgentType] [int] NOT NULL,
	[Adress] [nvarchar](100) NOT NULL,
	[INN] [int] NOT NULL,
	[KPP] [int] NOT NULL,
	[IDDirectorName] [int] NOT NULL,
	[Phone] [nchar](30) NOT NULL,
	[Logotype] [nvarchar](1000) NULL,
	[Priority] [int] NOT NULL,
	[IDPointOfSale] [int] NOT NULL,
	[IDRole] [nchar](1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AgentType]    Script Date: 19.02.2022 17:48:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AgentType](
	[ID] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_AgentType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DirectorName]    Script Date: 19.02.2022 17:48:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DirectorName](
	[ID] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_DirectorName] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manager]    Script Date: 19.02.2022 17:48:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manager](
	[ID] [int] NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Phone] [nchar](30) NOT NULL,
	[Adress] [nvarchar](100) NOT NULL,
	[IDRole] [nchar](1) NOT NULL,
 CONSTRAINT [PK_Manager] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Material]    Script Date: 19.02.2022 17:48:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Material](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[IDMaterialType] [int] NOT NULL,
	[CountOfPackage] [int] NOT NULL,
	[IDUnit] [int] NOT NULL,
	[QuantityStock] [int] NOT NULL,
	[Remainder] [int] NOT NULL,
	[Cost] [money] NOT NULL,
 CONSTRAINT [PK_Material] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialType]    Script Date: 19.02.2022 17:48:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialType](
	[ID] [int] NOT NULL,
	[Title] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_MaterialType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PointOfSale]    Script Date: 19.02.2022 17:48:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PointOfSale](
	[ID] [int] NOT NULL,
	[Title] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_PointOfSale] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 19.02.2022 17:48:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Articul] [int] NOT NULL,
	[Cost] [money] NOT NULL,
	[Picture] [nvarchar](1000) NOT NULL,
	[IDProductType] [int] NOT NULL,
	[CountOfPerson] [int] NOT NULL,
	[WorkshopNumber] [int] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductMaterial]    Script Date: 19.02.2022 17:48:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductMaterial](
	[ID] [int] NOT NULL,
	[IDProduct] [int] NOT NULL,
	[IDMaterial] [int] NOT NULL,
	[MaterialQuantity] [int] NOT NULL,
 CONSTRAINT [PK_ProductMaterial] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductType]    Script Date: 19.02.2022 17:48:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductType](
	[ID] [int] NOT NULL,
	[Title] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_ProductType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 19.02.2022 17:48:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Code] [nchar](1) NOT NULL,
	[Title] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Unit]    Script Date: 19.02.2022 17:48:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Unit](
	[ID] [int] NOT NULL,
	[Title] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_Unit] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 19.02.2022 17:48:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [int] NOT NULL,
	[Username] [nvarchar](30) NOT NULL,
	[Password] [nvarchar](30) NOT NULL,
	[IDRole] [nchar](1) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Agent] ON 

INSERT [dbo].[Agent] ([ID], [Title], [IDAgentType], [Adress], [INN], [KPP], [IDDirectorName], [Phone], [Logotype], [Priority], [IDPointOfSale], [IDRole]) VALUES (1, N'ыыапывавы', 1, N'цывпып', 345345, 345345, 1, N'23432324234                   ', NULL, 32, 1, N'g')
SET IDENTITY_INSERT [dbo].[Agent] OFF
GO
INSERT [dbo].[AgentType] ([ID], [Title]) VALUES (1, N'ОАО')
INSERT [dbo].[AgentType] ([ID], [Title]) VALUES (2, N'Самозанятые')
INSERT [dbo].[AgentType] ([ID], [Title]) VALUES (3, N'ОО')
GO
INSERT [dbo].[DirectorName] ([ID], [Title]) VALUES (1, N'Анатолий Вассерман Анатльевич')
GO
INSERT [dbo].[Manager] ([ID], [FirstName], [LastName], [Phone], [Adress], [IDRole]) VALUES (0, N'sdfsdf', N'sdfsdf', N'sdfsdf                        ', N'sdfsdf', N'm')
INSERT [dbo].[Manager] ([ID], [FirstName], [LastName], [Phone], [Adress], [IDRole]) VALUES (1, N'ывафыав', N'фываыфва', N'345324                        ', N'выпраравриу', N'a')
GO
SET IDENTITY_INSERT [dbo].[Material] ON 

INSERT [dbo].[Material] ([ID], [Title], [IDMaterialType], [CountOfPackage], [IDUnit], [QuantityStock], [Remainder], [Cost]) VALUES (1, N'Шипы для льда 3x2', 1, 3, 1, 470, 26, 6511.0000)
INSERT [dbo].[Material] ([ID], [Title], [IDMaterialType], [CountOfPackage], [IDUnit], [QuantityStock], [Remainder], [Cost]) VALUES (2, N'Резина для льда 0x2', 2, 2, 2, 816, 21, 48785.0000)
INSERT [dbo].[Material] ([ID], [Title], [IDMaterialType], [CountOfPackage], [IDUnit], [QuantityStock], [Remainder], [Cost]) VALUES (3, N'Шипы для льда 2x2', 1, 1, 1, 479, 22, 13077.0000)
INSERT [dbo].[Material] ([ID], [Title], [IDMaterialType], [CountOfPackage], [IDUnit], [QuantityStock], [Remainder], [Cost]) VALUES (4, N'Шипы для льда 3x0', 1, 9, 1, 885, 5, 52272.0000)
INSERT [dbo].[Material] ([ID], [Title], [IDMaterialType], [CountOfPackage], [IDUnit], [QuantityStock], [Remainder], [Cost]) VALUES (5, N'Шипы для пустыни 3x2', 1, 2, 1, 923, 19, 28748.0000)
INSERT [dbo].[Material] ([ID], [Title], [IDMaterialType], [CountOfPackage], [IDUnit], [QuantityStock], [Remainder], [Cost]) VALUES (6, N'Шипы для лета 3x1', 1, 6, 2, 184, 40, 51974.0000)
INSERT [dbo].[Material] ([ID], [Title], [IDMaterialType], [CountOfPackage], [IDUnit], [QuantityStock], [Remainder], [Cost]) VALUES (7, N'Резина для зимы 2x3', 2, 3, 3, 344, 12, 53323.0000)
INSERT [dbo].[Material] ([ID], [Title], [IDMaterialType], [CountOfPackage], [IDUnit], [QuantityStock], [Remainder], [Cost]) VALUES (8, N'Резина для зимы 3x3', 2, 3, 2, 275, 28, 31356.0000)
INSERT [dbo].[Material] ([ID], [Title], [IDMaterialType], [CountOfPackage], [IDUnit], [QuantityStock], [Remainder], [Cost]) VALUES (9, N'Шипы для льда 1x0', 1, 10, 1, 914, 22, 25538.0000)
INSERT [dbo].[Material] ([ID], [Title], [IDMaterialType], [CountOfPackage], [IDUnit], [QuantityStock], [Remainder], [Cost]) VALUES (10, N'Резина для лета 0x1', 2, 9, 2, 127, 17, 23936.0000)
INSERT [dbo].[Material] ([ID], [Title], [IDMaterialType], [CountOfPackage], [IDUnit], [QuantityStock], [Remainder], [Cost]) VALUES (11, N'Резина для лета 2x2', 2, 2, 3, 542, 20, 54298.0000)
INSERT [dbo].[Material] ([ID], [Title], [IDMaterialType], [CountOfPackage], [IDUnit], [QuantityStock], [Remainder], [Cost]) VALUES (12, N'Резина для зимы 3x1', 2, 9, 2, 690, 24, 25844.0000)
INSERT [dbo].[Material] ([ID], [Title], [IDMaterialType], [CountOfPackage], [IDUnit], [QuantityStock], [Remainder], [Cost]) VALUES (13, N'Шипы для зимы 0x1', 1, 3, 1, 255, 25, 6484.0000)
INSERT [dbo].[Material] ([ID], [Title], [IDMaterialType], [CountOfPackage], [IDUnit], [QuantityStock], [Remainder], [Cost]) VALUES (14, N'Шипы для льда 2x0', 1, 4, 4, 214, 15, 17996.0000)
INSERT [dbo].[Material] ([ID], [Title], [IDMaterialType], [CountOfPackage], [IDUnit], [QuantityStock], [Remainder], [Cost]) VALUES (15, N'Резина для пустыни 3x2', 2, 1, 3, 931, 43, 5854.0000)
INSERT [dbo].[Material] ([ID], [Title], [IDMaterialType], [CountOfPackage], [IDUnit], [QuantityStock], [Remainder], [Cost]) VALUES (16, N'Шипы для зимы 3x0', 1, 6, 1, 192, 48, 9260.0000)
INSERT [dbo].[Material] ([ID], [Title], [IDMaterialType], [CountOfPackage], [IDUnit], [QuantityStock], [Remainder], [Cost]) VALUES (17, N'Резина для пустыни 2x0', 2, 5, 2, 769, 14, 17425.0000)
INSERT [dbo].[Material] ([ID], [Title], [IDMaterialType], [CountOfPackage], [IDUnit], [QuantityStock], [Remainder], [Cost]) VALUES (18, N'Шипы для лета 3x2', 1, 1, 1, 547, 11, 43288.0000)
INSERT [dbo].[Material] ([ID], [Title], [IDMaterialType], [CountOfPackage], [IDUnit], [QuantityStock], [Remainder], [Cost]) VALUES (19, N'Резина для зимы 0x3', 2, 4, 3, 726, 46, 37293.0000)
INSERT [dbo].[Material] ([ID], [Title], [IDMaterialType], [CountOfPackage], [IDUnit], [QuantityStock], [Remainder], [Cost]) VALUES (20, N'Шипы для льда 0x0', 1, 2, 2, 585, 37, 21188.0000)
INSERT [dbo].[Material] ([ID], [Title], [IDMaterialType], [CountOfPackage], [IDUnit], [QuantityStock], [Remainder], [Cost]) VALUES (21, N'Шипы для льда 0x1', 1, 2, 4, 147, 8, 49557.0000)
INSERT [dbo].[Material] ([ID], [Title], [IDMaterialType], [CountOfPackage], [IDUnit], [QuantityStock], [Remainder], [Cost]) VALUES (22, N'Резина для льда 1x3', 2, 2, 2, 286, 39, 23551.0000)
INSERT [dbo].[Material] ([ID], [Title], [IDMaterialType], [CountOfPackage], [IDUnit], [QuantityStock], [Remainder], [Cost]) VALUES (23, N'Резина для пустыни 1x3', 2, 5, 2, 222, 9, 21546.0000)
INSERT [dbo].[Material] ([ID], [Title], [IDMaterialType], [CountOfPackage], [IDUnit], [QuantityStock], [Remainder], [Cost]) VALUES (24, N'Шипы для зимы 3x3', 1, 4, 1, 652, 33, 15159.0000)
INSERT [dbo].[Material] ([ID], [Title], [IDMaterialType], [CountOfPackage], [IDUnit], [QuantityStock], [Remainder], [Cost]) VALUES (25, N'Шипы для пустыни 0x2', 1, 4, 1, 792, 46, 8571.0000)
INSERT [dbo].[Material] ([ID], [Title], [IDMaterialType], [CountOfPackage], [IDUnit], [QuantityStock], [Remainder], [Cost]) VALUES (26, N'Шипы для лета 2x0', 1, 1, 1, 68, 43, 8206.0000)
INSERT [dbo].[Material] ([ID], [Title], [IDMaterialType], [CountOfPackage], [IDUnit], [QuantityStock], [Remainder], [Cost]) VALUES (27, N'Резина для пустыни 3x3', 2, 9, 3, 840, 11, 5144.0000)
INSERT [dbo].[Material] ([ID], [Title], [IDMaterialType], [CountOfPackage], [IDUnit], [QuantityStock], [Remainder], [Cost]) VALUES (28, N'Резина для льда 0x1', 2, 5, 3, 964, 34, 53394.0000)
INSERT [dbo].[Material] ([ID], [Title], [IDMaterialType], [CountOfPackage], [IDUnit], [QuantityStock], [Remainder], [Cost]) VALUES (29, N'Резина для лета 0x2', 2, 4, 2, 753, 33, 9069.0000)
INSERT [dbo].[Material] ([ID], [Title], [IDMaterialType], [CountOfPackage], [IDUnit], [QuantityStock], [Remainder], [Cost]) VALUES (30, N'Резина для зимы 1x0', 2, 5, 2, 929, 48, 43046.0000)
INSERT [dbo].[Material] ([ID], [Title], [IDMaterialType], [CountOfPackage], [IDUnit], [QuantityStock], [Remainder], [Cost]) VALUES (31, N'Резина для лета 3x3', 2, 6, 3, 652, 28, 6764.0000)
INSERT [dbo].[Material] ([ID], [Title], [IDMaterialType], [CountOfPackage], [IDUnit], [QuantityStock], [Remainder], [Cost]) VALUES (32, N'Резина для пустыни 1x1', 2, 6, 2, 120, 21, 11642.0000)
INSERT [dbo].[Material] ([ID], [Title], [IDMaterialType], [CountOfPackage], [IDUnit], [QuantityStock], [Remainder], [Cost]) VALUES (33, N'Шипы для пустыни 0x1', 1, 4, 4, 612, 24, 55689.0000)
INSERT [dbo].[Material] ([ID], [Title], [IDMaterialType], [CountOfPackage], [IDUnit], [QuantityStock], [Remainder], [Cost]) VALUES (34, N'Шипы для льда 3x1', 1, 8, 1, 123, 43, 42668.0000)
INSERT [dbo].[Material] ([ID], [Title], [IDMaterialType], [CountOfPackage], [IDUnit], [QuantityStock], [Remainder], [Cost]) VALUES (35, N'Резина для льда 3x3', 2, 7, 2, 909, 35, 23174.0000)
INSERT [dbo].[Material] ([ID], [Title], [IDMaterialType], [CountOfPackage], [IDUnit], [QuantityStock], [Remainder], [Cost]) VALUES (36, N'Шипы для льда 2x3', 1, 10, 4, 237, 7, 27105.0000)
INSERT [dbo].[Material] ([ID], [Title], [IDMaterialType], [CountOfPackage], [IDUnit], [QuantityStock], [Remainder], [Cost]) VALUES (37, N'Шипы для лета 2x2', 1, 4, 1, 15, 10, 44506.0000)
INSERT [dbo].[Material] ([ID], [Title], [IDMaterialType], [CountOfPackage], [IDUnit], [QuantityStock], [Remainder], [Cost]) VALUES (38, N'Резина для пустыни 2x3', 2, 5, 3, 103, 38, 55679.0000)
INSERT [dbo].[Material] ([ID], [Title], [IDMaterialType], [CountOfPackage], [IDUnit], [QuantityStock], [Remainder], [Cost]) VALUES (39, N'Резина для зимы 1x3', 2, 9, 3, 84, 50, 27823.0000)
INSERT [dbo].[Material] ([ID], [Title], [IDMaterialType], [CountOfPackage], [IDUnit], [QuantityStock], [Remainder], [Cost]) VALUES (40, N'Резина для лета 1x0', 2, 5, 3, 234, 32, 25499.0000)
INSERT [dbo].[Material] ([ID], [Title], [IDMaterialType], [CountOfPackage], [IDUnit], [QuantityStock], [Remainder], [Cost]) VALUES (41, N'Резина для пустыни 0x3', 2, 8, 3, 761, 7, 8094.0000)
INSERT [dbo].[Material] ([ID], [Title], [IDMaterialType], [CountOfPackage], [IDUnit], [QuantityStock], [Remainder], [Cost]) VALUES (42, N'Резина для лета 2x1', 2, 2, 3, 561, 39, 47610.0000)
INSERT [dbo].[Material] ([ID], [Title], [IDMaterialType], [CountOfPackage], [IDUnit], [QuantityStock], [Remainder], [Cost]) VALUES (43, N'Резина для пустыни 2x1', 2, 10, 2, 918, 12, 34518.0000)
INSERT [dbo].[Material] ([ID], [Title], [IDMaterialType], [CountOfPackage], [IDUnit], [QuantityStock], [Remainder], [Cost]) VALUES (44, N'Шипы для пустыни 3x1', 1, 4, 1, 37, 43, 27104.0000)
INSERT [dbo].[Material] ([ID], [Title], [IDMaterialType], [CountOfPackage], [IDUnit], [QuantityStock], [Remainder], [Cost]) VALUES (45, N'Шипы для льда 1x1', 1, 7, 1, 335, 33, 48279.0000)
INSERT [dbo].[Material] ([ID], [Title], [IDMaterialType], [CountOfPackage], [IDUnit], [QuantityStock], [Remainder], [Cost]) VALUES (46, N'Шипы для зимы 2x0', 1, 3, 4, 466, 8, 34841.0000)
INSERT [dbo].[Material] ([ID], [Title], [IDMaterialType], [CountOfPackage], [IDUnit], [QuantityStock], [Remainder], [Cost]) VALUES (47, N'Резина для пустыни 1x2', 2, 9, 2, 496, 36, 24876.0000)
INSERT [dbo].[Material] ([ID], [Title], [IDMaterialType], [CountOfPackage], [IDUnit], [QuantityStock], [Remainder], [Cost]) VALUES (48, N'Резина для льда 2x0', 2, 6, 3, 86, 8, 24767.0000)
INSERT [dbo].[Material] ([ID], [Title], [IDMaterialType], [CountOfPackage], [IDUnit], [QuantityStock], [Remainder], [Cost]) VALUES (49, N'Шипы для лета 0x1', 1, 2, 2, 974, 35, 28825.0000)
INSERT [dbo].[Material] ([ID], [Title], [IDMaterialType], [CountOfPackage], [IDUnit], [QuantityStock], [Remainder], [Cost]) VALUES (50, N'Шипы для льда 2x1', 1, 10, 4, 634, 25, 23287.0000)
SET IDENTITY_INSERT [dbo].[Material] OFF
GO
INSERT [dbo].[MaterialType] ([ID], [Title]) VALUES (1, N' Шипы')
INSERT [dbo].[MaterialType] ([ID], [Title]) VALUES (2, N' Резина')
GO
INSERT [dbo].[PointOfSale] ([ID], [Title]) VALUES (1, N'розничные магазины')
INSERT [dbo].[PointOfSale] ([ID], [Title]) VALUES (2, N'интернет магазины')
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (1, N'Колесо R18 Кованый', 241659, 11509.0000, N'\products\tire_15.jpg', 1, 4, 10)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (2, N'Запаска R15 Кованый', 327657, 8667.0000, N'\products\tire_64.jpg', 2, 2, 8)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (3, N'Шина R21 Лето', 266521, 10561.0000, N'\products\tire_6.jpg', 3, 4, 1)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (4, N'Шина R21 Кованый', 329576, 7989.0000, N'\products\tire_59.jpg', 3, 2, 2)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (5, N'Диск R17 Лето', 400508, 12941.0000, N'\products\tire_24.jpg', 4, 1, 4)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (6, N'Шина R14 Липучка', 331598, 13879.0000, N'\products\tire_17.jpg', 3, 4, 1)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (7, N'Диск R16 Кованый', 440075, 9068.0000, N'\products\tire_25.jpg', 4, 3, 9)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (8, N'Запаска R14 Лето', 448396, 12878.0000, N'\products\tire_32.jpg', 2, 1, 5)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (9, N'Диск R22 Липучка', 418286, 10670.0000, N'\products\tire_4.jpg', 4, 4, 2)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (10, N'Запаска R15 Лето', 348910, 4969.0000, N'\products\tire_50.jpg', 2, 1, 9)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (11, N'Шина R15 Липучка', 349418, 6393.0000, N'\products\tire_48.jpg', 3, 1, 4)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (12, N'Колесо R15 Кованый', 376388, 9439.0000, N'\products\picture.png', 1, 3, 4)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (13, N'Колесо R20 Кованый', 445217, 9569.0000, N'\products\tire_1.jpg', 1, 3, 10)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (14, N'Диск R19 Лето', 243152, 6264.0000, N'\products\tire_0.jpg', 4, 1, 9)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (15, N'Колесо R18 Лето', 412238, 13892.0000, N'\products\tire_14.jpg', 1, 2, 7)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (16, N'Диск R20 Зима', 252453, 14526.0000, N'\products\picture.png', 4, 4, 9)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (17, N'Диск R17 Зима', 343841, 12768.0000, N'\products\picture.png', 4, 3, 9)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (18, N'Запаска R21 Липучка', 247470, 10139.0000, N'\products\tire_62.jpg', 2, 1, 2)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (19, N'Запаска R20 Липучка', 335226, 9988.0000, N'\products\picture.png', 2, 1, 2)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (20, N'Шина R17 Кованый', 299692, 11463.0000, N'\products\tire_58.jpg', 3, 3, 10)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (21, N'Диск R20 Липучка', 447543, 11661.0000, N'\products\tire_3.jpg', 4, 4, 8)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (22, N'Запаска R20 Кованый', 249737, 7509.0000, N'\products\picture.png', 2, 5, 5)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (23, N'Колесо R14 Кованый', 429265, 11838.0000, N'\products\picture.png', 1, 3, 6)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (24, N'Диск R21 Кованый', 299085, 4757.0000, N'\products\tire_61.jpg', 4, 3, 3)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (25, N'Шина R20 Кованый', 330937, 10928.0000, N'\products\tire_45.jpg', 3, 3, 1)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (26, N'Диск R16 Липучка', 435703, 9934.0000, N'\products\picture.png', 4, 5, 2)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (27, N'Запаска R18 Лето', 305509, 5192.0000, N'\products\tire_41.jpg', 2, 1, 3)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (28, N'Запаска R19 Кованый', 390434, 14258.0000, N'\products\tire_46.jpg', 2, 5, 8)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (29, N'Диск R18 Лето', 317858, 8435.0000, N'\products\tire_52.jpg', 4, 5, 3)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (30, N'Запаска R14 Кованый', 412235, 12891.0000, N'\products\tire_47.jpg', 2, 4, 6)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (31, N'Запаска R22 Липучка', 328305, 10116.0000, N'\products\tire_13.jpg', 2, 2, 1)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (32, N'Колесо R21 Липучка', 403378, 3626.0000, N'\products\tire_55.jpg', 1, 3, 10)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (33, N'Шина R18 Лето', 425463, 11625.0000, N'\products\picture.png', 3, 4, 10)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (34, N'Запаска R17 Липучка', 327883, 12332.0000, N'\products\tire_10.jpg', 2, 2, 2)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (35, N'Диск R22 Кованый', 388520, 7498.0000, N'\products\tire_19.jpg', 4, 3, 2)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (36, N'Шина R18 Липучка', 319450, 4951.0000, N'\products\picture.png', 3, 3, 6)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (37, N'Шина R16 Кованый', 421321, 14691.0000, N'\products\picture.png', 3, 1, 2)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (38, N'Диск R17 Липучка', 282569, 12356.0000, N'\products\tire_42.jpg', 4, 5, 5)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (39, N'Запаска R23 Зима', 394768, 13019.0000, N'\products\tire_8.jpg', 2, 1, 9)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (40, N'Диск R21 Зима', 250714, 8762.0000, N'\products\tire_11.jpg', 4, 5, 5)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (41, N'Диск R16 Лето', 251201, 8149.0000, N'\products\picture.png', 4, 3, 10)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (42, N'Шина R14 Кованый', 274477, 9527.0000, N'\products\tire_34.jpg', 3, 5, 5)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (43, N'Диск R19 Зима', 358851, 5695.0000, N'\products\tire_16.jpg', 4, 5, 6)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (44, N'Диск R21 Лето', 449834, 2698.0000, N'\products\tire_35.jpg', 4, 4, 8)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (45, N'Запаска R19 Липучка', 438383, 12000.0000, N'\products\picture.png', 2, 3, 1)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (46, N'Колесо R19 Лето', 298778, 7493.0000, N'\products\tire_38.jpg', 1, 1, 10)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (47, N'Колесо R16 Лето', 337577, 10161.0000, N'\products\tire_2.jpg', 1, 1, 9)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (48, N'Запаска R21 Зима', 365509, 14556.0000, N'\products\picture.png', 2, 5, 6)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (49, N'Шина R20 Липучка', 348553, 3508.0000, N'\products\picture.png', 3, 2, 2)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (50, N'Диск R20 Лето', 300047, 10323.0000, N'\products\tire_56.jpg', 4, 3, 10)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (51, N'Запаска R18 Липучка', 279256, 9759.0000, N'\products\tire_53.jpg', 2, 4, 5)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (52, N'Шина R22 Лето', 406784, 14692.0000, N'\products\tire_37.jpg', 3, 3, 5)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (53, N'Колесо R21 Лето', 276905, 10343.0000, N'\products\picture.png', 1, 1, 2)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (54, N'Диск R19 Липучка', 318661, 5544.0000, N'\products\picture.png', 4, 1, 6)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (55, N'Запаска R14 Зима', 440993, 6020.0000, N'\products\picture.png', 2, 5, 2)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (56, N'Запаска R22 Кованый', 341800, 5447.0000, N'\products\picture.png', 2, 2, 4)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (57, N'Диск R22 Зима', 453650, 11459.0000, N'\products\tire_22.jpg', 4, 5, 3)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (58, N'Запаска R17 Кованый', 372287, 5808.0000, N'\products\tire_57.jpg', 2, 5, 3)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (59, N'Диск R15 Лето', 347427, 5071.0000, N'\products\picture.png', 4, 1, 1)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (60, N'Шина R15 Кованый', 274665, 13101.0000, N'\products\tire_63.jpg', 3, 2, 10)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (61, N'Запаска R19 Лето', 283112, 3362.0000, N'\products\tire_33.jpg', 2, 3, 4)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (62, N'Колесо R20 Липучка', 363664, 12681.0000, N'\products\picture.png', 1, 1, 8)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (63, N'Шина R19 Зима', 444141, 2741.0000, N'\products\picture.png', 3, 2, 8)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (64, N'Шина R22 Кованый', 416324, 13841.0000, N'\products\tire_30.jpg', 3, 2, 8)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (65, N'Колесо R18 Зима', 387609, 3445.0000, N'\products\tire_9.jpg', 1, 1, 4)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (66, N'Запаска R16 Кованый', 432234, 13556.0000, N'\products\picture.png', 2, 3, 7)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (67, N'Колесо R17 Зима', 381949, 5902.0000, N'\products\picture.png', 1, 4, 6)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (68, N'Запаска R16 Зима', 394413, 12679.0000, N'\products\tire_49.jpg', 2, 3, 10)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (69, N'Колесо R20 Лето', 434626, 11959.0000, N'\products\tire_31.jpg', 1, 5, 8)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (70, N'Шина R17 Липучка', 280863, 11695.0000, N'\products\picture.png', 3, 4, 8)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (71, N'Шина R18 Зима', 444280, 13168.0000, N'\products\tire_44.jpg', 3, 4, 6)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (72, N'Запаска R17 Лето', 331576, 4803.0000, N'\products\tire_39.jpg', 2, 3, 8)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (73, N'Запаска R22 Зима', 268886, 13471.0000, N'\products\picture.png', 2, 3, 2)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (74, N'Колесо R20 Зима', 427198, 2397.0000, N'\products\picture.png', 1, 4, 10)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (75, N'Шина R17 Лето', 354738, 11329.0000, N'\products\tire_20.jpg', 3, 2, 10)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (76, N'Шина R14 Лето', 330951, 6786.0000, N'\products\tire_29.jpg', 3, 4, 7)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (77, N'Запаска R20 Зима', 241577, 9125.0000, N'\products\tire_51.jpg', 2, 2, 6)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (78, N'Колесо R17 Липучка', 281537, 4365.0000, N'\products\picture.png', 1, 1, 2)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (79, N'Шина R16 Зима', 300433, 2570.0000, N'\products\picture.png', 3, 4, 2)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (80, N'Запаска R19 Зима', 254860, 5568.0000, N'\products\picture.png', 2, 2, 5)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (81, N'Диск R22 Лето', 406411, 2904.0000, N'\products\tire_23.jpg', 4, 2, 4)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (82, N'Колесо R19 Липучка', 440973, 8439.0000, N'\products\tire_5.jpg', 1, 4, 4)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (83, N'Шина R21 Липучка', 308647, 12830.0000, N'\products\tire_26.jpg', 3, 4, 6)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (84, N'Шина R17 Зима', 291319, 6426.0000, N'\products\tire_54.jpg', 3, 2, 4)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (85, N'Диск R18 Зима', 255211, 13239.0000, N'\products\tire_21.jpg', 4, 1, 6)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (86, N'Шина R18 Кованый', 275809, 3258.0000, N'\products\tire_40.jpg', 3, 4, 10)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (87, N'Колесо R17 Лето', 332936, 11145.0000, N'\products\tire_28.jpg', 1, 2, 1)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (88, N'Шина R22 Зима', 382661, 10373.0000, N'\products\picture.png', 3, 1, 2)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (89, N'Шина R19 Лето', 335030, 4870.0000, N'\products\picture.png', 3, 4, 10)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (90, N'Шина R19 Кованый', 291359, 14682.0000, N'\products\tire_27.jpg', 3, 5, 10)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (91, N'Колесо R18 Липучка', 332858, 14804.0000, N'\products\tire_12.jpg', 1, 3, 7)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (92, N'Запаска R15 Липучка', 237228, 5510.0000, N'\products\tire_18.jpg', 2, 3, 8)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (93, N'Шина R15 Зима', 312952, 4039.0000, N'\products\picture.png', 3, 2, 5)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (94, N'Шина R19 Липучка', 341034, 13063.0000, N'\products\tire_36.jpg', 3, 1, 5)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (95, N'Запаска R15 Зима', 251241, 3874.0000, N'\products\picture.png', 2, 3, 10)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (96, N'Шина R16 Лето', 437927, 7181.0000, N'\products\picture.png', 3, 3, 6)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (97, N'Колесо R16 Липучка', 263261, 14521.0000, N'\products\picture.png', 1, 4, 1)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (98, N'Запаска R21 Лето', 299112, 3694.0000, N'\products\tire_43.jpg', 2, 2, 8)
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (99, N'Шина R21 Зима', 398710, 9378.0000, N'\products\tire_7.jpg', 3, 2, 2)
GO
INSERT [dbo].[Product] ([ID], [Title], [Articul], [Cost], [Picture], [IDProductType], [CountOfPerson], [WorkshopNumber]) VALUES (100, N'Шина R16 Липучка', 320970, 2264.0000, N'\products\tire_60.jpg', 3, 1, 2)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
INSERT [dbo].[ProductType] ([ID], [Title]) VALUES (1, N'Колесо')
INSERT [dbo].[ProductType] ([ID], [Title]) VALUES (2, N'Запаска')
INSERT [dbo].[ProductType] ([ID], [Title]) VALUES (3, N'Шина')
INSERT [dbo].[ProductType] ([ID], [Title]) VALUES (4, N'Диск')
GO
INSERT [dbo].[Role] ([Code], [Title]) VALUES (N'a', N'admin')
INSERT [dbo].[Role] ([Code], [Title]) VALUES (N'g', N'agent')
INSERT [dbo].[Role] ([Code], [Title]) VALUES (N'm', N'manager')
GO
INSERT [dbo].[Unit] ([ID], [Title]) VALUES (1, N' г')
INSERT [dbo].[Unit] ([ID], [Title]) VALUES (2, N' кг')
INSERT [dbo].[Unit] ([ID], [Title]) VALUES (3, N' м')
INSERT [dbo].[Unit] ([ID], [Title]) VALUES (4, N' шт')
GO
INSERT [dbo].[User] ([ID], [Username], [Password], [IDRole]) VALUES (1, N'admin', N'admin', N'a')
INSERT [dbo].[User] ([ID], [Username], [Password], [IDRole]) VALUES (2, N'manager', N'manager', N'm')
INSERT [dbo].[User] ([ID], [Username], [Password], [IDRole]) VALUES (3, N'agent', N'agent', N'g')
GO
ALTER TABLE [dbo].[Agent]  WITH CHECK ADD  CONSTRAINT [FK_Agent_AgentType] FOREIGN KEY([IDAgentType])
REFERENCES [dbo].[AgentType] ([ID])
GO
ALTER TABLE [dbo].[Agent] CHECK CONSTRAINT [FK_Agent_AgentType]
GO
ALTER TABLE [dbo].[Agent]  WITH CHECK ADD  CONSTRAINT [FK_Agent_DirectorName] FOREIGN KEY([IDDirectorName])
REFERENCES [dbo].[DirectorName] ([ID])
GO
ALTER TABLE [dbo].[Agent] CHECK CONSTRAINT [FK_Agent_DirectorName]
GO
ALTER TABLE [dbo].[Agent]  WITH CHECK ADD  CONSTRAINT [FK_Agent_PointOfSale] FOREIGN KEY([IDPointOfSale])
REFERENCES [dbo].[PointOfSale] ([ID])
GO
ALTER TABLE [dbo].[Agent] CHECK CONSTRAINT [FK_Agent_PointOfSale]
GO
ALTER TABLE [dbo].[Agent]  WITH CHECK ADD  CONSTRAINT [FK_Agent_Role] FOREIGN KEY([IDRole])
REFERENCES [dbo].[Role] ([Code])
GO
ALTER TABLE [dbo].[Agent] CHECK CONSTRAINT [FK_Agent_Role]
GO
ALTER TABLE [dbo].[Manager]  WITH CHECK ADD  CONSTRAINT [FK_Manager_Role] FOREIGN KEY([IDRole])
REFERENCES [dbo].[Role] ([Code])
GO
ALTER TABLE [dbo].[Manager] CHECK CONSTRAINT [FK_Manager_Role]
GO
ALTER TABLE [dbo].[Material]  WITH CHECK ADD  CONSTRAINT [FK_Material_MaterialType] FOREIGN KEY([IDMaterialType])
REFERENCES [dbo].[MaterialType] ([ID])
GO
ALTER TABLE [dbo].[Material] CHECK CONSTRAINT [FK_Material_MaterialType]
GO
ALTER TABLE [dbo].[Material]  WITH CHECK ADD  CONSTRAINT [FK_Material_Unit] FOREIGN KEY([IDUnit])
REFERENCES [dbo].[Unit] ([ID])
GO
ALTER TABLE [dbo].[Material] CHECK CONSTRAINT [FK_Material_Unit]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductType] FOREIGN KEY([IDProductType])
REFERENCES [dbo].[ProductType] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductType]
GO
ALTER TABLE [dbo].[ProductMaterial]  WITH CHECK ADD  CONSTRAINT [FK_ProductMaterial_Material] FOREIGN KEY([IDMaterial])
REFERENCES [dbo].[Material] ([ID])
GO
ALTER TABLE [dbo].[ProductMaterial] CHECK CONSTRAINT [FK_ProductMaterial_Material]
GO
ALTER TABLE [dbo].[ProductMaterial]  WITH CHECK ADD  CONSTRAINT [FK_ProductMaterial_Product] FOREIGN KEY([IDProduct])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductMaterial] CHECK CONSTRAINT [FK_ProductMaterial_Product]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([IDRole])
REFERENCES [dbo].[Role] ([Code])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
