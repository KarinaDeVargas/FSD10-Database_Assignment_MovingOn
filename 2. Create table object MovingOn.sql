/*
Purpose: xxxxxxx.
*/

/* Script Date: August 10, 2023
   Developed by: Team 3
					De Vargas Pereira, Karina
					Feng, Xiaoli
					Hsu, Sophie 
*/
   
-- switch to the MovingOnTeam3 database
use MovingOn_Team3
;
   
/* Partial Syntax to create table object
create table table_name
(
	column_name data_type constraint(s),
    column_name data_type constraint(s),
    ...
    column_name data_type constraint(s)
)

where constraint defines the business rules: null, not null, primary key (pk_),
foreign key (fk_), default (df_), check (ck_), unique (uq_)

/* character data type:
char(length) - fixed length
varchar(length) - variable length
*/

/* *****	Table No. 1 - Customers 	***** */   
create table Customers
(
	CustID int auto_increment not null,
    CompanyName varchar(50) null,
    CustFN varchar(20) not null,
    CustLN varchar(20) not null,
    Address varchar(40) not null,
    City varchar(30) not null,
    State varchar(2) not null,
    ZIP varchar(10) not null,
    Phone varchar(15) not null,
    Balance decimal(14.9) null,
	constraint pk_Customers primary key clustered (CustID asc)
)
;
 
-- return the definition of the table Customers
show columns
from Customers
;

-- or using describe command
describe Customers
;

/* *****	Table No. 2 - Employees 	***** */   
create table Employees
(
	EmpID int auto_increment not null,
    EmpFN varchar(30) not null,
    EmpMN varchar(30) null,
    EmpLN varchar(30) not null,
    WarehouseID varchar(5) not null,
    SSN varchar(9) not null,
    DOB datetime,
    StartDate datetime,
    EndDate datetime,
    Address varchar(40) not null,
    City varchar(30) not null,
    State varchar(2) not null,
    ZIP varchar(10) not null,
    PositionID smallint not null,
    Memo LONGTEXT,
    Phone varchar(15) null,
    Cell varchar(15) not null,
    Salary decimal(14,9) null,
    HourlyRate decimal(14,9) null,
    Review datetime,
	constraint pk_Employees primary key clustered (EmpID asc)
)
;

-- return the definition of the table Employees
show columns
from Employees
;

-- or using describe command
describe Employees
;

/* *****	Table No. 3 - Drivers 	***** */   
create table Drivers
(
	DriverID int auto_increment not null,
    DriverFN varchar(30) not null,
    DriverMN varchar(30) null,
    DriverLN varchar(30) not null,
    WarehouseID varchar(5) not null,
    SSN varchar(9) not null,
    DOB datetime,
    StartDate datetime,
    EndDate datetime,
    Address varchar(40) not null,
    City varchar(30) not null,
    State varchar(2) not null,
    ZIP varchar(10) not null,
    Position smallint not null, -- I think it is important to create this Attribute and have it default as the position related to "Driver", then we can use it in the queries 
    Phone varchar(15) null,
    Cell varchar(15) not null,
    MileageRate decimal(14,9) not null,
    Review datetime,
    DrivingRecord varchar(1) not null,
    constraint pk_Drivers primary key clustered (DriverID asc)
)
;
 
-- return the definition of the table Drivers
show columns
from Drivers
;

-- or using describe command
describe Drivers
;

/* *****	Table No. 4 - Lookup Table - Positions   ***** */
create table Positions
(
	PositionID smallint auto_increment not null,
    Title varchar(30) not null,
    constraint pk_Positions primary key (PositionID asc)
)
;

/* *****	Table No. 5 - Warehouses   ***** */
create table Warehouses
(
	WarehouseID varchar(5) primary key not null,
    Address varchar(40) not null,
    City varchar(30) not null,
    State varchar(2) not null,
    ZIP varchar(10) not null,
    Phone varchar(15) not null,
    ClimateControl tinyint not null,
    SecurityGate tinyint not null
)
;

show columns
from Warehouses
;

-- or using describe command
describe Warehouses
;

/* *****	Table No. 6 - Vehicles   ***** */
create table Vehicles
(
	VehicleID varchar(10) not null,
    LicensePlateNum varchar(7) not null,
    Axle int not null,
    Color varchar(10) not null,
    constraint pk_Vehicles primary key (VehicleID asc)
)
;

show columns
from Vehicles
;

-- or using describe command
describe Vehicles
;

/* *****	Table No. 7 - JobDetails   ***** */
create table JobDetails
(
	JobID tinyint auto_increment not null,
    VehicleID varchar(10) not null,
    DriverID int not null,
    MileageActual int not null,
    WeightActual int not null,
    constraint pk_JobDetails primary key (JobID asc)
)
;

show columns
from JobDetails
;

-- or using describe command
describe JobDetails
;

/* *****	Table No. 8 - JobOrders   ***** */
create table JobOrders
(
	JobOrderID tinyint auto_increment not null, -- I've changed the name, only for our understanding
    CustID int not null,
    MoveDate datetime not null,
    FromAddress varchar(40) not null,
    FromCity varchar(30) not null,
    FromState varchar(2) not null,
    FromZIP varchar(10) not null,
	ToAddress varchar(40) not null,
    ToCity varchar(30) not null,
    ToState varchar(2) not null,
    ToZIP varchar(10) not null,
	DistanceEst int not null, 
	WeightEst int not null,
	Packing tinyint,
	Havy tinyint,
	Storage tinyint,
    constraint pk_JobOrders primary key (JobOrderID asc)
)
;

show columns
from JobOrders
;

-- or using describe command
describe JobOrders
;

/* *****	Table No. 9 - StorageUnits   ***** */
create table StorageUnits
(
	UnitID int not null,
    WarehouseID varchar(5) not null,
    UnitSize varchar(10) not null,
    Rent decimal(14,9) not null,    
    constraint pk_StorageUnits primary key clustered 
		(
			-- composite primary key
            UnitID asc,
            WarehouseID asc
		)   
)
;

show columns
from StorageUnits
;

-- or using describe command
describe StorageUnits
;

/* *****	Table No. 10 - UnitRentals   ***** */
create table UnitRentals
(
	CustID int not null,
    WarehouseID varchar(5) not null,
    UnitID int not null,
    DateIn datetime,
    DateOut datetime,
    constraint pk_UnitRentals primary key clustered 
		(
			-- composite primary key
            CustID asc,
            WarehouseID asc,
            UnitID asc            
		)
)
;

show columns
from UnitRentals
;

-- or using describe command
describe UnitRentals
;

show tables
;




