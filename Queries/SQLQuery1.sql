USE [master]
GO
/****** Object:  Database [chamber]    Script Date: 4/7/2017 8:52:08 AM ******/
CREATE DATABASE [chamber]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'chamber', FILENAME = N'F:\Data\chamber.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'chamber_log', FILENAME = N'F:\Log\chamber_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [chamber] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [chamber].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [chamber] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [chamber] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [chamber] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [chamber] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [chamber] SET ARITHABORT OFF 
GO
ALTER DATABASE [chamber] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [chamber] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [chamber] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [chamber] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [chamber] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [chamber] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [chamber] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [chamber] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [chamber] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [chamber] SET  DISABLE_BROKER 
GO
ALTER DATABASE [chamber] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [chamber] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [chamber] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [chamber] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [chamber] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [chamber] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [chamber] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [chamber] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [chamber] SET  MULTI_USER 
GO
ALTER DATABASE [chamber] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [chamber] SET DB_CHAINING OFF 
GO
ALTER DATABASE [chamber] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [chamber] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [chamber] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [chamber] SET QUERY_STORE = OFF
GO
USE [chamber]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [chamber]
GO
/****** Object:  Table [dbo].[Advertisement]    Script Date: 4/7/2017 8:52:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Advertisement](
	[Advertisement_ID] [int] IDENTITY(1,1) NOT NULL,
	[Ad_URL] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Advertisement_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Assigned_Position]    Script Date: 4/7/2017 8:52:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Assigned_Position](
	[Assigned_Position_ID] [int] IDENTITY(1,1) NOT NULL,
	[Committee_ID] [int] NULL,
	[Contact_ID] [int] NULL,
	[Type] [nvarchar](30) NULL,
 CONSTRAINT [PK_Assigned_Position] PRIMARY KEY CLUSTERED 
(
	[Assigned_Position_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Business]    Script Date: 4/7/2017 8:52:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Business](
	[Business_ID] [int] IDENTITY(1,1) NOT NULL,
	[Company_Name] [nvarchar](50) NULL,
	[Address_1] [nvarchar](50) NULL,
	[Address_2] [nvarchar](50) NULL,
	[City] [nvarchar](30) NULL,
	[State] [nvarchar](20) NULL,
	[Zip] [nvarchar](20) NULL,
	[Primary_Phone] [nvarchar](30) NULL,
	[Secondary_Phone] [nvarchar](30) NULL,
	[Category_1] [nvarchar](50) NULL,
	[Subcategory_1] [nvarchar](50) NULL,
	[Category_2] [nvarchar](50) NULL,
	[Subcategory_2] [nvarchar](50) NULL,
	[Additional_Offices] [nvarchar](50) NULL,
	[Potential_Member] [bit] NULL,
	[MMCC_Member_Date_From] [date] NULL,
	[MMCC_Member_Date_To] [date] NULL,
	[Comment] [nvarchar](max) NULL,
	[Advantage_Card] [nvarchar](max) NULL,
	[Created_By] [nvarchar](30) NULL,
	[Created_Date] [datetime] NULL,
	[Last_Modified_By] [nvarchar](30) NULL,
	[Last_Modified_Date] [datetime] NULL,
	[Images] [nvarchar](max) NULL,
	[Accepts_Chamber_Gift_Cards] [bit] NULL,
	[Number_Of_Full_Time_Employees] [nvarchar](30) NULL,
	[Number_Of_Part_Time_Employees] [nvarchar](30) NULL,
	[URL_Link] [nvarchar](max) NULL,
	[Show_On_Member_Website] [bit] NULL,
	[Membership_Pricing_ID] [int] NULL,
	[Towns_ID] [int] NULL,
 CONSTRAINT [PK_Business] PRIMARY KEY CLUSTERED 
(
	[Business_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Business_Contact_Pivot]    Script Date: 4/7/2017 8:52:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Business_Contact_Pivot](
	[Business_Contact_Pivot_ID] [int] IDENTITY(1,1) NOT NULL,
	[Business_ID] [int] NULL,
	[Contact_ID] [int] NULL,
 CONSTRAINT [PK_Business_Contact_Pivot] PRIMARY KEY CLUSTERED 
(
	[Business_Contact_Pivot_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Chamber_Info]    Script Date: 4/7/2017 8:52:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Chamber_Info](
	[Chamber_Info_ID] [int] IDENTITY(1,1) NOT NULL,
	[Table_Rotator_ID] [int] NULL,
	[Advertisement_ID] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[City] [nvarchar](20) NULL,
	[State] [nvarchar](20) NULL,
	[Logo] [nvarchar](max) NULL,
	[Facebook_URL] [nvarchar](max) NULL,
	[Twitter_URL] [nvarchar](max) NULL,
	[Linkedin_URL] [nvarchar](max) NULL,
	[Home_Page_Image_URL] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Chamber_Info_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Chamber_Staff]    Script Date: 4/7/2017 8:52:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Chamber_Staff](
	[Chamber_Staff_ID] [int] IDENTITY(1,1) NOT NULL,
	[Chamber_Info_ID] [int] NULL,
	[First_Name] [nvarchar](30) NULL,
	[Last_Name] [nvarchar](30) NULL,
	[Position] [nvarchar](30) NULL,
	[Linkedin_URL] [nvarchar](max) NULL,
	[Comment] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Chamber_Staff_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Committee]    Script Date: 4/7/2017 8:52:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Committee](
	[Committee_ID] [int] IDENTITY(1,1) NOT NULL,
	[Sub_Committee_ID] [int] NULL,
	[Committee_Name] [nvarchar](50) NULL,
	[Meeting_Dates] [nvarchar](50) NULL,
	[Notes] [nvarchar](max) NULL,
	[Created_By] [nvarchar](20) NULL,
	[Created_Date] [datetime] NULL,
	[Last_Modified_By] [nvarchar](20) NULL,
	[Last_Modified_Date] [datetime] NULL,
 CONSTRAINT [PK_Committee] PRIMARY KEY CLUSTERED 
(
	[Committee_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Contact]    Script Date: 4/7/2017 8:52:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[Contact_ID] [int] IDENTITY(1,1) NOT NULL,
	[First_Name] [nvarchar](20) NULL,
	[Middle_Name] [nvarchar](20) NULL,
	[Last_Name] [nvarchar](20) NULL,
	[Title] [nvarchar](20) NULL,
	[Suffix] [nvarchar](20) NULL,
	[Address_1] [nvarchar](50) NULL,
	[Address_2] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[State] [nvarchar](20) NULL,
	[Zip] [nvarchar](20) NULL,
	[Work_Email] [nvarchar](50) NULL,
	[Personal_Email] [nvarchar](50) NULL,
	[Work_Phone] [nvarchar](20) NULL,
	[Cell_Phone] [nvarchar](20) NULL,
	[Volunteer] [bit] NULL,
	[Last_Volunteer_Date] [date] NULL,
	[Primary_Contact] [bit] NULL,
	[RSVP] [bit] NULL,
	[Newsletter] [bit] NULL,
	[Who_Are_They] [nvarchar](20) NULL,
	[District] [nvarchar](20) NULL,
	[Party] [nvarchar](20) NULL,
	[Who_Are_They_Date_From] [date] NULL,
	[Who_Are_They_Date_To] [date] NULL,
	[Created_By] [nvarchar](20) NULL,
	[Created_Date] [datetime] NULL,
	[Last_Modified_By] [nvarchar](20) NULL,
	[Last_Modified_Date] [datetime] NULL,
	[Username] [nvarchar](max) NULL,
	[Passwords] [nvarchar](max) NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[Contact_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Event_Contact]    Script Date: 4/7/2017 8:52:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Event_Contact](
	[Event_Contact_ID] [int] IDENTITY(1,1) NOT NULL,
	[Events_ID] [int] NULL,
	[How_Paid] [nvarchar](20) NULL,
	[Price] [nvarchar](20) NULL,
	[Prepaid] [nvarchar](20) NULL,
	[Volunteer] [bit] NULL,
	[Comment] [nvarchar](max) NULL,
	[Created_By] [nvarchar](20) NULL,
	[Created_Date] [datetime] NULL,
	[Last_Modified_By] [nvarchar](20) NULL,
	[Last_Modified_Date] [datetime] NULL,
 CONSTRAINT [PK_Event_Contact] PRIMARY KEY CLUSTERED 
(
	[Event_Contact_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Events]    Script Date: 4/7/2017 8:52:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Events](
	[Events_ID] [int] IDENTITY(1,1) NOT NULL,
	[Contact_ID] [int] NULL,
	[Event_Name] [nvarchar](50) NULL,
	[Event_Date] [nvarchar](50) NULL,
	[Event_Location] [nvarchar](50) NULL,
	[Event_Address] [nvarchar](50) NULL,
	[Event_City] [nvarchar](50) NULL,
	[Event_State] [nvarchar](20) NULL,
	[Event_Zip] [nvarchar](20) NULL,
	[Summary] [nvarchar](max) NULL,
	[Created_By] [nvarchar](20) NULL,
	[Created_Date] [datetime] NULL,
	[Last_Modified_By] [nvarchar](20) NULL,
	[Last_Modified_Date] [datetime] NULL,
	[Allow_Register] [bit] NULL,
 CONSTRAINT [PK_Events] PRIMARY KEY CLUSTERED 
(
	[Events_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Gift_Certs]    Script Date: 4/7/2017 8:52:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gift_Certs](
	[Gift_Certs_ID] [int] IDENTITY(1,1) NOT NULL,
	[Transaction_Date] [datetime] NULL,
	[Denomination] [nvarchar](20) NULL,
	[Cert_Number] [nvarchar](20) NULL,
	[Total_Number] [nvarchar](20) NULL,
	[Business_ID] [int] NULL,
	[Contact_ID] [int] NULL,
	[Cash_Amount] [nvarchar](20) NULL,
	[Check_Amount] [nvarchar](20) NULL,
	[Check_Number] [nvarchar](50) NULL,
	[Credit_Card] [nvarchar](50) NULL,
	[Staff] [nvarchar](20) NULL,
	[Comments] [nvarchar](max) NULL,
	[Created_By] [nvarchar](20) NULL,
	[Created_Date] [datetime] NULL,
	[Last_Modified_By] [nvarchar](20) NULL,
	[Last_Modified_Date] [datetime] NULL,
 CONSTRAINT [PK_Gift_Certs] PRIMARY KEY CLUSTERED 
(
	[Gift_Certs_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Marketing]    Script Date: 4/7/2017 8:52:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Marketing](
	[Marketing_ID] [int] IDENTITY(1,1) NOT NULL,
	[Contact_ID] [int] NULL,
	[Contact_Date] [datetime] NULL,
	[Memo] [nvarchar](max) NULL,
	[Follow_Up_Date] [datetime] NULL,
	[TOS_Description] [nvarchar](50) NULL,
	[Date_TOS_ID_Sent] [datetime] NULL,
	[How_TOS_ID_Sent] [nvarchar](50) NULL,
	[Processed_Date] [datetime] NULL,
	[Created_By] [nvarchar](20) NULL,
	[Created_Date] [datetime] NULL,
	[Last_Modified_By] [nvarchar](20) NULL,
	[Last_Modified_Date] [datetime] NULL,
 CONSTRAINT [PK_Marketing] PRIMARY KEY CLUSTERED 
(
	[Marketing_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Membership_Pricing]    Script Date: 4/7/2017 8:52:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Membership_Pricing](
	[Membership_Pricing_ID] [int] IDENTITY(1,1) NOT NULL,
	[Class_Of_Membership] [nvarchar](30) NULL,
	[Prices] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Membership_Pricing_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Roles]    Script Date: 4/7/2017 8:52:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Role_ID] [int] IDENTITY(1,1) NOT NULL,
	[Contact_ID] [int] NULL,
	[Business_Admin] [bit] NULL,
	[Business_User_Event_Posting] [bit] NULL,
	[Business_User_Job_Posting] [bit] NULL,
	[Business_User_Update_Website] [bit] NULL,
	[Business_User_Member_News] [bit] NULL,
	[Chamber_Staff] [bit] NULL,
	[Contact] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Role_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Table_Rotator]    Script Date: 4/7/2017 8:52:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table_Rotator](
	[Table_Rotator_ID] [int] IDENTITY(1,1) NOT NULL,
	[Business_ID] [int] NULL,
	[Comment] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Table_Rotator_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TOS]    Script Date: 4/7/2017 8:52:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TOS](
	[TOS_Description] [nvarchar](50) NOT NULL,
	[Memo] [nvarchar](max) NULL,
	[Created_By] [nvarchar](20) NULL,
	[Created_Date] [datetime] NULL,
	[Last_Modified_By] [nvarchar](20) NULL,
	[Last_Modified_Date] [datetime] NULL,
 CONSTRAINT [PK_TOS] PRIMARY KEY CLUSTERED 
(
	[TOS_Description] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Towns]    Script Date: 4/7/2017 8:52:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Towns](
	[Towns_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NULL,
	[Comment] [nvarchar](max) NULL,
	[Map] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Towns_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Who_Are_They]    Script Date: 4/7/2017 8:52:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Who_Are_They](
	[Who_Are_they] [nvarchar](20) NOT NULL,
	[Created_By] [nvarchar](20) NULL,
	[Created_Date] [datetime] NULL,
	[Last_Modified_By] [nvarchar](20) NULL,
	[Last_Modified_Date] [datetime] NULL,
 CONSTRAINT [PK_Who_Are_They] PRIMARY KEY CLUSTERED 
(
	[Who_Are_they] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [All Names]    Script Date: 4/7/2017 8:52:09 AM ******/
CREATE NONCLUSTERED INDEX [All Names] ON [dbo].[Contact]
(
	[First_Name] ASC,
	[Middle_Name] ASC,
	[Last_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Assigned_Position]  WITH CHECK ADD  CONSTRAINT [FK_Assigned_Position_Committee] FOREIGN KEY([Committee_ID])
REFERENCES [dbo].[Committee] ([Committee_ID])
GO
ALTER TABLE [dbo].[Assigned_Position] CHECK CONSTRAINT [FK_Assigned_Position_Committee]
GO
ALTER TABLE [dbo].[Assigned_Position]  WITH CHECK ADD  CONSTRAINT [FK_Assigned_Position_Contact] FOREIGN KEY([Contact_ID])
REFERENCES [dbo].[Contact] ([Contact_ID])
GO
ALTER TABLE [dbo].[Assigned_Position] CHECK CONSTRAINT [FK_Assigned_Position_Contact]
GO
ALTER TABLE [dbo].[Business]  WITH CHECK ADD FOREIGN KEY([Membership_Pricing_ID])
REFERENCES [dbo].[Membership_Pricing] ([Membership_Pricing_ID])
GO
ALTER TABLE [dbo].[Business]  WITH CHECK ADD FOREIGN KEY([Towns_ID])
REFERENCES [dbo].[Towns] ([Towns_ID])
GO
ALTER TABLE [dbo].[Business_Contact_Pivot]  WITH CHECK ADD FOREIGN KEY([Business_ID])
REFERENCES [dbo].[Business] ([Business_ID])
GO
ALTER TABLE [dbo].[Business_Contact_Pivot]  WITH CHECK ADD  CONSTRAINT [FK_Business_Contact_Pivot_Contact] FOREIGN KEY([Contact_ID])
REFERENCES [dbo].[Contact] ([Contact_ID])
GO
ALTER TABLE [dbo].[Business_Contact_Pivot] CHECK CONSTRAINT [FK_Business_Contact_Pivot_Contact]
GO
ALTER TABLE [dbo].[Chamber_Info]  WITH CHECK ADD FOREIGN KEY([Advertisement_ID])
REFERENCES [dbo].[Advertisement] ([Advertisement_ID])
GO
ALTER TABLE [dbo].[Chamber_Info]  WITH CHECK ADD FOREIGN KEY([Table_Rotator_ID])
REFERENCES [dbo].[Table_Rotator] ([Table_Rotator_ID])
GO
ALTER TABLE [dbo].[Chamber_Staff]  WITH CHECK ADD FOREIGN KEY([Chamber_Info_ID])
REFERENCES [dbo].[Chamber_Info] ([Chamber_Info_ID])
GO
ALTER TABLE [dbo].[Committee]  WITH CHECK ADD  CONSTRAINT [FK_Committee_Committee] FOREIGN KEY([Sub_Committee_ID])
REFERENCES [dbo].[Committee] ([Committee_ID])
GO
ALTER TABLE [dbo].[Committee] CHECK CONSTRAINT [FK_Committee_Committee]
GO
ALTER TABLE [dbo].[Contact]  WITH CHECK ADD  CONSTRAINT [FK_Contact_Who_Are_They] FOREIGN KEY([Who_Are_They])
REFERENCES [dbo].[Who_Are_They] ([Who_Are_they])
GO
ALTER TABLE [dbo].[Contact] CHECK CONSTRAINT [FK_Contact_Who_Are_They]
GO
ALTER TABLE [dbo].[Event_Contact]  WITH CHECK ADD  CONSTRAINT [FK_Event_Contact_Events] FOREIGN KEY([Events_ID])
REFERENCES [dbo].[Events] ([Events_ID])
GO
ALTER TABLE [dbo].[Event_Contact] CHECK CONSTRAINT [FK_Event_Contact_Events]
GO
ALTER TABLE [dbo].[Events]  WITH CHECK ADD  CONSTRAINT [FK_Events_Contact] FOREIGN KEY([Contact_ID])
REFERENCES [dbo].[Contact] ([Contact_ID])
GO
ALTER TABLE [dbo].[Events] CHECK CONSTRAINT [FK_Events_Contact]
GO
ALTER TABLE [dbo].[Gift_Certs]  WITH CHECK ADD FOREIGN KEY([Business_ID])
REFERENCES [dbo].[Business] ([Business_ID])
GO
ALTER TABLE [dbo].[Gift_Certs]  WITH CHECK ADD  CONSTRAINT [FK_Gift_Certs_Contact] FOREIGN KEY([Contact_ID])
REFERENCES [dbo].[Contact] ([Contact_ID])
GO
ALTER TABLE [dbo].[Gift_Certs] CHECK CONSTRAINT [FK_Gift_Certs_Contact]
GO
ALTER TABLE [dbo].[Marketing]  WITH CHECK ADD  CONSTRAINT [FK_Marketing_Contact] FOREIGN KEY([Contact_ID])
REFERENCES [dbo].[Contact] ([Contact_ID])
GO
ALTER TABLE [dbo].[Marketing] CHECK CONSTRAINT [FK_Marketing_Contact]
GO
ALTER TABLE [dbo].[Marketing]  WITH CHECK ADD  CONSTRAINT [FK_Marketing_TOS] FOREIGN KEY([TOS_Description])
REFERENCES [dbo].[TOS] ([TOS_Description])
GO
ALTER TABLE [dbo].[Marketing] CHECK CONSTRAINT [FK_Marketing_TOS]
GO
ALTER TABLE [dbo].[Roles]  WITH CHECK ADD FOREIGN KEY([Contact_ID])
REFERENCES [dbo].[Contact] ([Contact_ID])
GO
ALTER TABLE [dbo].[Table_Rotator]  WITH CHECK ADD FOREIGN KEY([Business_ID])
REFERENCES [dbo].[Business] ([Business_ID])
GO
USE [master]
GO
ALTER DATABASE [chamber] SET  READ_WRITE 
GO
