USE [J5Shop]
GO
/****** Object:  Table [dbo].[accounts]    Script Date: 7/11/2023 12:01:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[accounts](
	[username] [varchar](255) NOT NULL,
	[activated] [bit] NULL,
	[admin] [bit] NULL,
	[email] [varchar](255) NULL,
	[fullname] [nvarchar](100) NULL,
	[password] [varchar](255) NULL,
	[photo] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categories]    Script Date: 7/11/2023 12:01:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories](
	[id] [varchar](255) NOT NULL,
	[name] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_details]    Script Date: 7/11/2023 12:01:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_details](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
	[order_id] [bigint] NULL,
	[product_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 7/11/2023 12:01:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[adress] [varchar](255) NULL,
	[createdate] [date] NULL,
	[username] [varchar](255) NULL,
	[address] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 7/11/2023 12:01:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[available] [bit] NULL,
	[createdate] [date] NULL,
	[image] [varchar](255) NULL,
	[name] [nvarchar](255) NULL,
	[price] [float] NULL,
	[category_id] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[report]    Script Date: 7/11/2023 12:01:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[report](
	[group_name] [varbinary](255) NOT NULL,
	[count] [bigint] NULL,
	[sum] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[group_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[order_details]  WITH CHECK ADD  CONSTRAINT [FK4q98utpd73imf4yhttm3w0eax] FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([id])
GO
ALTER TABLE [dbo].[order_details] CHECK CONSTRAINT [FK4q98utpd73imf4yhttm3w0eax]
GO
ALTER TABLE [dbo].[order_details]  WITH CHECK ADD  CONSTRAINT [FKjyu2qbqt8gnvno9oe9j2s2ldk] FOREIGN KEY([order_id])
REFERENCES [dbo].[orders] ([id])
GO
ALTER TABLE [dbo].[order_details] CHECK CONSTRAINT [FKjyu2qbqt8gnvno9oe9j2s2ldk]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FKk3cjfcgb621qhahps1tre43e4] FOREIGN KEY([username])
REFERENCES [dbo].[accounts] ([username])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FKk3cjfcgb621qhahps1tre43e4]
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD  CONSTRAINT [FKog2rp4qthbtt2lfyhfo32lsw9] FOREIGN KEY([category_id])
REFERENCES [dbo].[categories] ([id])
GO
ALTER TABLE [dbo].[products] CHECK CONSTRAINT [FKog2rp4qthbtt2lfyhfo32lsw9]
GO
