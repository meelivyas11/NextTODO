ALTER SESSION SET CURRENT_SCHEMA = master;
 
/****** Object:  Database [chamber]    Script Date: 4/7/2017 8:52:08 AM ******/
CREATE DATABASE chamber
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'chamber', FILENAME = N'F:Datachamber.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'chamber_log', FILENAME = N'F:Logchamber_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE chamber COMPATIBILITY_LEVEL := 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
then
EXECUTE IMMEDIATE  chamber.dbo.sp_fulltext_database; @action = 'enable'
end if;
GO
ALTER DATABASE chamber SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE chamber /* SET ANSI_NULLS OFF */ 
 
ALTER DATABASE chamber /* SET ANSI_PADDING OFF */ 
 
ALTER DATABASE chamber SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE chamber SET ARITHABORT OFF 
GO
ALTER DATABASE chamber SET AUTO_CLOSE OFF 
GO
ALTER DATABASE chamber SET AUTO_SHRINK OFF 
GO
ALTER DATABASE chamber SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE chamber SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE chamber SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE chamber SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE chamber SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE chamber /* SET QUOTED_IDENTIFIER OFF */ 
 
ALTER DATABASE chamber SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE chamber SET  DISABLE_BROKER 
GO
ALTER DATABASE chamber SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE chamber SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE chamber SET TRUSTWORTHY OFF 
GO
ALTER DATABASE chamber SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE chamber SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE chamber SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE chamber SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE chamber SET RECOVERY SIMPLE 
GO
ALTER DATABASE chamber SET  MULTI_USER 
GO
ALTER DATABASE chamber SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE chamber SET DB_CHAINING OFF 
GO
ALTER DATABASE chamber SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE chamber TARGET_RECOVERY_TIME := 60; SECONDS 
GO
ALTER DATABASE chamber DELAYED_DURABILITY := DISABLED; 
GO
ALTER DATABASE chamber QUERY_STORE := OFF;
GO
ALTER SESSION SET CURRENT_SCHEMA = chamber;
 
ALTER DATABASE SCOPED CONFIGURATION MAXDOP := 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY MAXDOP := PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION LEGACY_CARDINALITY_ESTIMATION := OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY LEGACY_CARDINALITY_ESTIMATION := PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION PARAMETER_SNIFFING := ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY PARAMETER_SNIFFING := PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION QUERY_OPTIMIZER_HOTFIXES := OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY QUERY_OPTIMIZER_HOTFIXES := PRIMARY;
GO
ALTER SESSION SET CURRENT_SCHEMA = chamber;
 
/****** Object:  Table [dbo].[Advertisement]    Script Date: 4/7/2017 8:52:09 AM ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE Advertisement(
	Advertisement_ID Number(10)  NOT NULL,
	Ad_URL blob NULL,
PRIMARY KEY 
(
	Advertisement_ID 
) 
);

-- Generate ID using sequence and trigger
CREATE SEQUENCE Advertisement_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER Advertisement_seq_tr
 BEFORE INSERT ON Advertisement FOR EACH ROW
 WHEN (NEW.Advertisement_ID IS NULL)
BEGIN
 SELECT Advertisement_seq.NEXTVAL INTO :NEW.Advertisement_ID FROM DUAL;
END;
/ TEXTIMAGE_ON PRIMARY

GO
/****** Object:  Table [dbo].[Assigned_Position]    Script Date: 4/7/2017 8:52:09 AM ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE Assigned_Position(
	Assigned_Position_ID Number(10)  NOT NULL,
	Committee_ID Number(10) NULL,
	Contact_ID Number(10) NULL,
	Type varchar2(30) NULL,
 CONSTRAINT PK_Assigned_Position PRIMARY KEY 
(
	Assigned_Position_ID 
) 
);


-- Generate ID using sequence and trigger
CREATE SEQUENCE Assigned_Position_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER Assigned_Position_seq_tr
 BEFORE INSERT ON Assigned_Position FOR EACH ROW
 WHEN (NEW.Assigned_Position_ID IS NULL)
BEGIN
 SELECT Assigned_Position_seq.NEXTVAL INTO :NEW.Assigned_Position_ID FROM DUAL;
END;
/
/****** Object:  Table [dbo].[Business]    Script Date: 4/7/2017 8:52:09 AM ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE Business(
	Business_ID Number(10)  NOT NULL,
	Company_Name varchar2(50) NULL,
	Address_1 varchar2(50) NULL,
	Address_2 varchar2(50) NULL,
	City varchar2(30) NULL,
	State varchar2(20) NULL,
	Zip varchar2(20) NULL,
	Primary_Phone varchar2(30) NULL,
	Secondary_Phone varchar2(30) NULL,
	Category_1 varchar2(50) NULL,
	Subcategory_1 varchar2(50) NULL,
	Category_2 varchar2(50) NULL,
	Subcategory_2 varchar2(50) NULL,
	Additional_Offices varchar2(50) NULL,
	Potential_Member Number(1) NULL,
	MMCC_Member_Date_From date NULL,
	MMCC_Member_Date_To date NULL,
	Comment blob NULL,
	Advantage_Card blob NULL,
	Created_By varchar2(30) NULL,
	Created_Date Timestamp(3) NULL,
	Last_Modified_By varchar2(30) NULL,
	Last_Modified_Date Timestamp(3) NULL,
	Images blob NULL,
	Accepts_Chamber_Gift_Cards Number(1) NULL,
	Number_Of_Full_Time_Employees varchar2(30) NULL,
	Number_Of_Part_Time_Employees varchar2(30) NULL,
	URL_Link blob NULL,
	Show_On_Member_Website Number(1) NULL,
	Membership_Pricing_ID Number(10) NULL,
	Towns_ID Number(10) NULL,
 CONSTRAINT PK_Business PRIMARY KEY 
(
	Business_ID 
) 
);

-- Generate ID using sequence and trigger
CREATE SEQUENCE Business_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER Business_seq_tr
 BEFORE INSERT ON Business FOR EACH ROW
 WHEN (NEW.Business_ID IS NULL)
BEGIN
 SELECT Business_seq.NEXTVAL INTO :NEW.Business_ID FROM DUAL;
END;
/ TEXTIMAGE_ON PRIMARY

GO
/****** Object:  Table [dbo].[Business_Contact_Pivot]    Script Date: 4/7/2017 8:52:09 AM ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE Business_Contact_Pivot(
	Business_Contact_Pivot_ID Number(10)  NOT NULL,
	Business_ID Number(10) NULL,
	Contact_ID Number(10) NULL,
 CONSTRAINT PK_Business_Contact_Pivot PRIMARY KEY 
(
	Business_Contact_Pivot_ID 
) 
);


-- Generate ID using sequence and trigger
CREATE SEQUENCE Business_Contact_Pivot_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER Business_Contact_Pivot_seq_tr
 BEFORE INSERT ON Business_Contact_Pivot FOR EACH ROW
 WHEN (NEW.Business_Contact_Pivot_ID IS NULL)
BEGIN
 SELECT Business_Contact_Pivot_seq.NEXTVAL INTO :NEW.Business_Contact_Pivot_ID FROM DUAL;
END;
/
/****** Object:  Table [dbo].[Chamber_Info]    Script Date: 4/7/2017 8:52:09 AM ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE Chamber_Info(
	Chamber_Info_ID Number(10)  NOT NULL,
	Table_Rotator_ID Number(10) NULL,
	Advertisement_ID Number(10) NULL,
	Name varchar2(50) NULL,
	Address varchar2(50) NULL,
	City varchar2(20) NULL,
	State varchar2(20) NULL,
	Logo blob NULL,
	Facebook_URL blob NULL,
	Twitter_URL blob NULL,
	Linkedin_URL blob NULL,
	Home_Page_Image_URL blob NULL,
PRIMARY KEY 
(
	Chamber_Info_ID 
) 
);

-- Generate ID using sequence and trigger
CREATE SEQUENCE Chamber_Info_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER Chamber_Info_seq_tr
 BEFORE INSERT ON Chamber_Info FOR EACH ROW
 WHEN (NEW.Chamber_Info_ID IS NULL)
BEGIN
 SELECT Chamber_Info_seq.NEXTVAL INTO :NEW.Chamber_Info_ID FROM DUAL;
END;
/ TEXTIMAGE_ON PRIMARY

GO
/****** Object:  Table [dbo].[Chamber_Staff]    Script Date: 4/7/2017 8:52:09 AM ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE Chamber_Staff(
	Chamber_Staff_ID Number(10)  NOT NULL,
	Chamber_Info_ID Number(10) NULL,
	First_Name varchar2(30) NULL,
	Last_Name varchar2(30) NULL,
	Position varchar2(30) NULL,
	Linkedin_URL blob NULL,
	Comment blob NULL,
PRIMARY KEY 
(
	Chamber_Staff_ID 
) 
);

-- Generate ID using sequence and trigger
CREATE SEQUENCE Chamber_Staff_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER Chamber_Staff_seq_tr
 BEFORE INSERT ON Chamber_Staff FOR EACH ROW
 WHEN (NEW.Chamber_Staff_ID IS NULL)
BEGIN
 SELECT Chamber_Staff_seq.NEXTVAL INTO :NEW.Chamber_Staff_ID FROM DUAL;
END;
/ TEXTIMAGE_ON PRIMARY

GO
/****** Object:  Table [dbo].[Committee]    Script Date: 4/7/2017 8:52:09 AM ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE Committee(
	Committee_ID Number(10)  NOT NULL,
	Sub_Committee_ID Number(10) NULL,
	Committee_Name varchar2(50) NULL,
	Meeting_Dates varchar2(50) NULL,
	Notes blob NULL,
	Created_By varchar2(20) NULL,
	Created_Date Timestamp(3) NULL,
	Last_Modified_By varchar2(20) NULL,
	Last_Modified_Date Timestamp(3) NULL,
 CONSTRAINT PK_Committee PRIMARY KEY 
(
	Committee_ID 
) 
);

-- Generate ID using sequence and trigger
CREATE SEQUENCE Committee_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER Committee_seq_tr
 BEFORE INSERT ON Committee FOR EACH ROW
 WHEN (NEW.Committee_ID IS NULL)
BEGIN
 SELECT Committee_seq.NEXTVAL INTO :NEW.Committee_ID FROM DUAL;
END;
/ TEXTIMAGE_ON PRIMARY

GO
/****** Object:  Table [dbo].[Contact]    Script Date: 4/7/2017 8:52:09 AM ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE Contact(
	Contact_ID Number(10)  NOT NULL,
	First_Name varchar2(20) NULL,
	Middle_Name varchar2(20) NULL,
	Last_Name varchar2(20) NULL,
	Title varchar2(20) NULL,
	Suffix varchar2(20) NULL,
	Address_1 varchar2(50) NULL,
	Address_2 varchar2(50) NULL,
	City varchar2(50) NULL,
	State varchar2(20) NULL,
	Zip varchar2(20) NULL,
	Work_Email varchar2(50) NULL,
	Personal_Email varchar2(50) NULL,
	Work_Phone varchar2(20) NULL,
	Cell_Phone varchar2(20) NULL,
	Volunteer Number(1) NULL,
	Last_Volunteer_Date date NULL,
	Primary_Contact Number(1) NULL,
	RSVP Number(1) NULL,
	Newsletter Number(1) NULL,
	Who_Are_They varchar2(20) NULL,
	District varchar2(20) NULL,
	Party varchar2(20) NULL,
	Who_Are_They_Date_From date NULL,
	Who_Are_They_Date_To date NULL,
	Created_By varchar2(20) NULL,
	Created_Date Timestamp(3) NULL,
	Last_Modified_By varchar2(20) NULL,
	Last_Modified_Date Timestamp(3) NULL,
	Username blob NULL,
	Passwords blob NULL,
 CONSTRAINT PK_Contact PRIMARY KEY 
(
	Contact_ID 
) 
);

-- Generate ID using sequence and trigger
CREATE SEQUENCE Contact_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER Contact_seq_tr
 BEFORE INSERT ON Contact FOR EACH ROW
 WHEN (NEW.Contact_ID IS NULL)
BEGIN
 SELECT Contact_seq.NEXTVAL INTO :NEW.Contact_ID FROM DUAL;
END;
/ TEXTIMAGE_ON PRIMARY

GO
/****** Object:  Table [dbo].[Event_Contact]    Script Date: 4/7/2017 8:52:09 AM ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE Event_Contact(
	Event_Contact_ID Number(10)  NOT NULL,
	Events_ID Number(10) NULL,
	How_Paid varchar2(20) NULL,
	Price varchar2(20) NULL,
	Prepaid varchar2(20) NULL,
	Volunteer Number(1) NULL,
	Comment blob NULL,
	Created_By varchar2(20) NULL,
	Created_Date Timestamp(3) NULL,
	Last_Modified_By varchar2(20) NULL,
	Last_Modified_Date Timestamp(3) NULL,
 CONSTRAINT PK_Event_Contact PRIMARY KEY 
(
	Event_Contact_ID 
) 
);

-- Generate ID using sequence and trigger
CREATE SEQUENCE Event_Contact_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER Event_Contact_seq_tr
 BEFORE INSERT ON Event_Contact FOR EACH ROW
 WHEN (NEW.Event_Contact_ID IS NULL)
BEGIN
 SELECT Event_Contact_seq.NEXTVAL INTO :NEW.Event_Contact_ID FROM DUAL;
END;
/ TEXTIMAGE_ON PRIMARY

GO
/****** Object:  Table [dbo].[Events]    Script Date: 4/7/2017 8:52:09 AM ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE Events(
	Events_ID Number(10)  NOT NULL,
	Contact_ID Number(10) NULL,
	Event_Name varchar2(50) NULL,
	Event_Date varchar2(50) NULL,
	Event_Location varchar2(50) NULL,
	Event_Address varchar2(50) NULL,
	Event_City varchar2(50) NULL,
	Event_State varchar2(20) NULL,
	Event_Zip varchar2(20) NULL,
	Summary blob NULL,
	Created_By varchar2(20) NULL,
	Created_Date Timestamp(3) NULL,
	Last_Modified_By varchar2(20) NULL,
	Last_Modified_Date Timestamp(3) NULL,
	Allow_Register Number(1) NULL,
 CONSTRAINT PK_Events PRIMARY KEY 
(
	Events_ID 
) 
);

-- Generate ID using sequence and trigger
CREATE SEQUENCE Events_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER Events_seq_tr
 BEFORE INSERT ON Events FOR EACH ROW
 WHEN (NEW.Events_ID IS NULL)
BEGIN
 SELECT Events_seq.NEXTVAL INTO :NEW.Events_ID FROM DUAL;
END;
/ TEXTIMAGE_ON PRIMARY

GO
/****** Object:  Table [dbo].[Gift_Certs]    Script Date: 4/7/2017 8:52:09 AM ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE Gift_Certs(
	Gift_Certs_ID Number(10)  NOT NULL,
	Transaction_Date Timestamp(3) NULL,
	Denomination varchar2(20) NULL,
	Cert_Number varchar2(20) NULL,
	Total_Number varchar2(20) NULL,
	Business_ID Number(10) NULL,
	Contact_ID Number(10) NULL,
	Cash_Amount varchar2(20) NULL,
	Check_Amount varchar2(20) NULL,
	Check_Number varchar2(50) NULL,
	Credit_Card varchar2(50) NULL,
	Staff varchar2(20) NULL,
	Comments blob NULL,
	Created_By varchar2(20) NULL,
	Created_Date Timestamp(3) NULL,
	Last_Modified_By varchar2(20) NULL,
	Last_Modified_Date Timestamp(3) NULL,
 CONSTRAINT PK_Gift_Certs PRIMARY KEY 
(
	Gift_Certs_ID 
) 
);

-- Generate ID using sequence and trigger
CREATE SEQUENCE Gift_Certs_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER Gift_Certs_seq_tr
 BEFORE INSERT ON Gift_Certs FOR EACH ROW
 WHEN (NEW.Gift_Certs_ID IS NULL)
BEGIN
 SELECT Gift_Certs_seq.NEXTVAL INTO :NEW.Gift_Certs_ID FROM DUAL;
END;
/ TEXTIMAGE_ON PRIMARY

GO
/****** Object:  Table [dbo].[Marketing]    Script Date: 4/7/2017 8:52:09 AM ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE Marketing(
	Marketing_ID Number(10)  NOT NULL,
	Contact_ID Number(10) NULL,
	Contact_Date Timestamp(3) NULL,
	Memo blob NULL,
	Follow_Up_Date Timestamp(3) NULL,
	TOS_Description varchar2(50) NULL,
	Date_TOS_ID_Sent Timestamp(3) NULL,
	How_TOS_ID_Sent varchar2(50) NULL,
	Processed_Date Timestamp(3) NULL,
	Created_By varchar2(20) NULL,
	Created_Date Timestamp(3) NULL,
	Last_Modified_By varchar2(20) NULL,
	Last_Modified_Date Timestamp(3) NULL,
 CONSTRAINT PK_Marketing PRIMARY KEY 
(
	Marketing_ID 
) 
);

-- Generate ID using sequence and trigger
CREATE SEQUENCE Marketing_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER Marketing_seq_tr
 BEFORE INSERT ON Marketing FOR EACH ROW
 WHEN (NEW.Marketing_ID IS NULL)
BEGIN
 SELECT Marketing_seq.NEXTVAL INTO :NEW.Marketing_ID FROM DUAL;
END;
/ TEXTIMAGE_ON PRIMARY

GO
/****** Object:  Table [dbo].[Membership_Pricing]    Script Date: 4/7/2017 8:52:09 AM ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE Membership_Pricing(
	Membership_Pricing_ID Number(10)  NOT NULL,
	Class_Of_Membership varchar2(30) NULL,
	Prices varchar2(50) NULL,
PRIMARY KEY 
(
	Membership_Pricing_ID 
) 
);


-- Generate ID using sequence and trigger
CREATE SEQUENCE Membership_Pricing_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER Membership_Pricing_seq_tr
 BEFORE INSERT ON Membership_Pricing FOR EACH ROW
 WHEN (NEW.Membership_Pricing_ID IS NULL)
BEGIN
 SELECT Membership_Pricing_seq.NEXTVAL INTO :NEW.Membership_Pricing_ID FROM DUAL;
END;
/
/****** Object:  Table [dbo].[Roles]    Script Date: 4/7/2017 8:52:09 AM ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE Roles(
	Role_ID Number(10)  NOT NULL,
	Contact_ID Number(10) NULL,
	Business_Admin Number(1) NULL,
	Business_User_Event_Posting Number(1) NULL,
	Business_User_Job_Posting Number(1) NULL,
	Business_User_Update_Website Number(1) NULL,
	Business_User_Member_News Number(1) NULL,
	Chamber_Staff Number(1) NULL,
	Contact Number(1) NULL,
PRIMARY KEY 
(
	Role_ID 
) 
);


-- Generate ID using sequence and trigger
CREATE SEQUENCE Roles_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER Roles_seq_tr
 BEFORE INSERT ON Roles FOR EACH ROW
 WHEN (NEW.Role_ID IS NULL)
BEGIN
 SELECT Roles_seq.NEXTVAL INTO :NEW.Role_ID FROM DUAL;
END;
/
/****** Object:  Table [dbo].[Table_Rotator]    Script Date: 4/7/2017 8:52:09 AM ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE Table_Rotator(
	Table_Rotator_ID Number(10)  NOT NULL,
	Business_ID Number(10) NULL,
	Comment blob NULL,
PRIMARY KEY 
(
	Table_Rotator_ID 
) 
);

-- Generate ID using sequence and trigger
CREATE SEQUENCE Table_Rotator_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER Table_Rotator_seq_tr
 BEFORE INSERT ON Table_Rotator FOR EACH ROW
 WHEN (NEW.Table_Rotator_ID IS NULL)
BEGIN
 SELECT Table_Rotator_seq.NEXTVAL INTO :NEW.Table_Rotator_ID FROM DUAL;
END;
/ TEXTIMAGE_ON PRIMARY

GO
/****** Object:  Table [dbo].[TOS]    Script Date: 4/7/2017 8:52:09 AM ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE TOS(
	TOS_Description varchar2(50) NOT NULL,
	Memo blob NULL,
	Created_By varchar2(20) NULL,
	Created_Date Timestamp(3) NULL,
	Last_Modified_By varchar2(20) NULL,
	Last_Modified_Date Timestamp(3) NULL,
 CONSTRAINT PK_TOS PRIMARY KEY 
(
	TOS_Description 
) 
); TEXTIMAGE_ON PRIMARY

GO
/****** Object:  Table [dbo].[Towns]    Script Date: 4/7/2017 8:52:09 AM ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE Towns(
	Towns_ID Number(10)  NOT NULL,
	Name varchar2(30) NULL,
	Comment blob NULL,
	Map blob NULL,
PRIMARY KEY 
(
	Towns_ID 
) 
);

-- Generate ID using sequence and trigger
CREATE SEQUENCE Towns_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER Towns_seq_tr
 BEFORE INSERT ON Towns FOR EACH ROW
 WHEN (NEW.Towns_ID IS NULL)
BEGIN
 SELECT Towns_seq.NEXTVAL INTO :NEW.Towns_ID FROM DUAL;
END;
/ TEXTIMAGE_ON PRIMARY

GO
/****** Object:  Table [dbo].[Who_Are_They]    Script Date: 4/7/2017 8:52:09 AM ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE Who_Are_They(
	Who_Are_they varchar2(20) NOT NULL,
	Created_By varchar2(20) NULL,
	Created_Date Timestamp(3) NULL,
	Last_Modified_By varchar2(20) NULL,
	Last_Modified_Date Timestamp(3) NULL,
 CONSTRAINT PK_Who_Are_They PRIMARY KEY 
(
	Who_Are_they 
) 
);

/* SET ANSI_PADDING ON */

 
/****** Object:  Index [All Names]    Script Date: 4/7/2017 8:52:09 AM ******/
CREATE NONCLUSTERED INDEX All Names ON [dbo].[Contact]
(
	First_Name ASC,
	Middle_Name ASC,
	Last_Name ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE dbo.Assigned_Position  WITH CHECK ADD  CONSTRAINT FK_Assigned_Position_Committee FOREIGN KEY(Committee_ID)
REFERENCES [dbo].[Committee] (Committee_ID)
GO
ALTER TABLE dbo.Assigned_Position CHECK CONSTRAINT FK_Assigned_Position_Committee
GO
ALTER TABLE dbo.Assigned_Position  WITH CHECK ADD  CONSTRAINT FK_Assigned_Position_Contact FOREIGN KEY(Contact_ID)
REFERENCES [dbo].[Contact] (Contact_ID)
GO
ALTER TABLE dbo.Assigned_Position CHECK CONSTRAINT FK_Assigned_Position_Contact
GO
ALTER TABLE dbo.Business  WITH CHECK ADD FOREIGN KEY(Membership_Pricing_ID)
REFERENCES [dbo].[Membership_Pricing] (Membership_Pricing_ID)
GO
ALTER TABLE dbo.Business  WITH CHECK ADD FOREIGN KEY(Towns_ID)
REFERENCES [dbo].[Towns] (Towns_ID)
GO
ALTER TABLE dbo.Business_Contact_Pivot  WITH CHECK ADD FOREIGN KEY(Business_ID)
REFERENCES [dbo].[Business] (Business_ID)
GO
ALTER TABLE dbo.Business_Contact_Pivot  WITH CHECK ADD  CONSTRAINT FK_Business_Contact_Pivot_Contact FOREIGN KEY(Contact_ID)
REFERENCES [dbo].[Contact] (Contact_ID)
GO
ALTER TABLE dbo.Business_Contact_Pivot CHECK CONSTRAINT FK_Business_Contact_Pivot_Contact
GO
ALTER TABLE dbo.Chamber_Info  WITH CHECK ADD FOREIGN KEY(Advertisement_ID)
REFERENCES [dbo].[Advertisement] (Advertisement_ID)
GO
ALTER TABLE dbo.Chamber_Info  WITH CHECK ADD FOREIGN KEY(Table_Rotator_ID)
REFERENCES [dbo].[Table_Rotator] (Table_Rotator_ID)
GO
ALTER TABLE dbo.Chamber_Staff  WITH CHECK ADD FOREIGN KEY(Chamber_Info_ID)
REFERENCES [dbo].[Chamber_Info] (Chamber_Info_ID)
GO
ALTER TABLE dbo.Committee  WITH CHECK ADD  CONSTRAINT FK_Committee_Committee FOREIGN KEY(Sub_Committee_ID)
REFERENCES [dbo].[Committee] (Committee_ID)
GO
ALTER TABLE dbo.Committee CHECK CONSTRAINT FK_Committee_Committee
GO
ALTER TABLE dbo.Contact  WITH CHECK ADD  CONSTRAINT FK_Contact_Who_Are_They FOREIGN KEY(Who_Are_They)
REFERENCES [dbo].[Who_Are_They] (Who_Are_they)
GO
ALTER TABLE dbo.Contact CHECK CONSTRAINT FK_Contact_Who_Are_They
GO
ALTER TABLE dbo.Event_Contact  WITH CHECK ADD  CONSTRAINT FK_Event_Contact_Events FOREIGN KEY(Events_ID)
REFERENCES [dbo].[Events] (Events_ID)
GO
ALTER TABLE dbo.Event_Contact CHECK CONSTRAINT FK_Event_Contact_Events
GO
ALTER TABLE dbo.Events  WITH CHECK ADD  CONSTRAINT FK_Events_Contact FOREIGN KEY(Contact_ID)
REFERENCES [dbo].[Contact] (Contact_ID)
GO
ALTER TABLE dbo.Events CHECK CONSTRAINT FK_Events_Contact
GO
ALTER TABLE dbo.Gift_Certs  WITH CHECK ADD FOREIGN KEY(Business_ID)
REFERENCES [dbo].[Business] (Business_ID)
GO
ALTER TABLE dbo.Gift_Certs  WITH CHECK ADD  CONSTRAINT FK_Gift_Certs_Contact FOREIGN KEY(Contact_ID)
REFERENCES [dbo].[Contact] (Contact_ID)
GO
ALTER TABLE dbo.Gift_Certs CHECK CONSTRAINT FK_Gift_Certs_Contact
GO
ALTER TABLE dbo.Marketing  WITH CHECK ADD  CONSTRAINT FK_Marketing_Contact FOREIGN KEY(Contact_ID)
REFERENCES [dbo].[Contact] (Contact_ID)
GO
ALTER TABLE dbo.Marketing CHECK CONSTRAINT FK_Marketing_Contact
GO
ALTER TABLE dbo.Marketing  WITH CHECK ADD  CONSTRAINT FK_Marketing_TOS FOREIGN KEY(TOS_Description)
REFERENCES [dbo].[TOS] (TOS_Description)
GO
ALTER TABLE dbo.Marketing CHECK CONSTRAINT FK_Marketing_TOS
GO
ALTER TABLE dbo.Roles  WITH CHECK ADD FOREIGN KEY(Contact_ID)
REFERENCES [dbo].[Contact] (Contact_ID)
GO
ALTER TABLE dbo.Table_Rotator  WITH CHECK ADD FOREIGN KEY(Business_ID)
REFERENCES [dbo].[Business] (Business_ID)
GO
ALTER SESSION SET CURRENT_SCHEMA = master;
 
ALTER DATABASE chamber SET  READ_WRITE 
GO
