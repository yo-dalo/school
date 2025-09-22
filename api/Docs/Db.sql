-- 1. School_Info
CREATE TABLE School_Info (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Experience VARCHAR(255),
    Students INT,
    Teachers INT,
    Awards VARCHAR(255),
    School_Name VARCHAR(255),
    Short_Name VARCHAR(255),
    Logo_Url VARCHAR(500),
    Favicon_Url VARCHAR(500),
    Motto TEXT,
    Established_Year YEAR,
    Address TEXT,
    City VARCHAR(100),
    State VARCHAR(100),
    Pin_Code VARCHAR(20),
    Alternate_Phone VARCHAR(20),
    Email VARCHAR(255),
    Website VARCHAR(255),
    Academic_Year_Start YEAR,
    Academic_Year_End YEAR,
    Youtube_Url VARCHAR(500),
    Linkedin_Url VARCHAR(500),
    Instagram_Url VARCHAR(500),
    Twitter_Url VARCHAR(500),
    Board_Affiliation VARCHAR(255),
    Board_Affiliation_Number VARCHAR(255),
    Latitude VARCHAR(50),
    Longitude VARCHAR(50),
    Contact_Person_Name VARCHAR(255),
    Contact_Person_Position VARCHAR(255),
    Contact_Person_Phone VARCHAR(20),
    Medium_Of_Instruction VARCHAR(255),
    Display_Order INT,
    Is_Active ENUM('active', 'inactive') DEFAULT 'active',
    Created_At DATETIME DEFAULT CURRENT_TIMESTAMP,
    Updated_At DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- 2. Poster
CREATE TABLE Poster (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Index_No INT,
    Url VARCHAR(500),
    Image VARCHAR(500),
    Name VARCHAR(255),
    Is_Active ENUM('active', 'inactive') DEFAULT 'active',
    Created_At DATETIME DEFAULT CURRENT_TIMESTAMP,
    Updated_At DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- 3. School_Welcome_Message
CREATE TABLE School_Welcome_Message (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(255),
    Message TEXT,
    Read_More_Url VARCHAR(500),
    Is_Active ENUM('active', 'inactive') DEFAULT 'active',
    Created_At DATETIME DEFAULT CURRENT_TIMESTAMP,
    Updated_At DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- 4. Result_10th
CREATE TABLE Result_10th (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Student_Name VARCHAR(255),
    Index_No INT,
    Image VARCHAR(500),
    Marks_Percentage VARCHAR(10),
    Description TEXT,
    Is_Active ENUM('active', 'inactive') DEFAULT 'active',
    Created_At DATETIME DEFAULT CURRENT_TIMESTAMP,
    Updated_At DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- 5. Result_12
CREATE TABLE Result_12 (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Student_Name VARCHAR(255),
    Index_No INT,
    Image VARCHAR(500),
    Marks_Percentage VARCHAR(10),
    Description TEXT,
    Is_Active ENUM('active', 'inactive') DEFAULT 'active',
    Created_At DATETIME DEFAULT CURRENT_TIMESTAMP,
    Updated_At DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- 6. Facility
CREATE TABLE Facility (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Index_No INT,
    Name VARCHAR(255),
    Title VARCHAR(255),
    Description TEXT,
    Image VARCHAR(500),
    Is_Active ENUM('active', 'inactive') DEFAULT 'active',
    Created_At DATETIME DEFAULT CURRENT_TIMESTAMP,
    Updated_At DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- 7. Admission_Open_Message
CREATE TABLE Admission_Open_Message (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(255),
    Index_No INT,
    Message TEXT,
    Image VARCHAR(500),
    Read_More_Url VARCHAR(500),
    Is_Active ENUM('active', 'inactive') DEFAULT 'active',
    Created_At DATETIME DEFAULT CURRENT_TIMESTAMP,
    Updated_At DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- 9. Notification
CREATE TABLE Notification (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Index_No INT,
    Is_Important BOOLEAN DEFAULT FALSE,
    Title VARCHAR(255),
    Description TEXT,
    Date DATE,
    Name VARCHAR(255),
    Is_Active ENUM('active', 'inactive') DEFAULT 'active',
    Created_At DATETIME DEFAULT CURRENT_TIMESTAMP,
    Updated_At DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- 10. Achievements
CREATE TABLE Achievements (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Image VARCHAR(500),
    Name VARCHAR(255),
    Title VARCHAR(255),
    Description TEXT,
    Index_No INT,
    Is_Active ENUM('active', 'inactive') DEFAULT 'active',
    Created_At DATETIME DEFAULT CURRENT_TIMESTAMP,
    Updated_At DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- 11. Quick_Link
CREATE TABLE Quick_Link (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Index_No INT,
    Url VARCHAR(500),
    Name VARCHAR(255),
    Is_Active ENUM('active', 'inactive') DEFAULT 'active',
    Created_At DATETIME DEFAULT CURRENT_TIMESTAMP,
    Updated_At DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- 12. Useful_Link
CREATE TABLE Useful_Link (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Index_No INT,
    Url VARCHAR(500),
    Name VARCHAR(255),
    Is_Active ENUM('active', 'inactive') DEFAULT 'active',
    Created_At DATETIME DEFAULT CURRENT_TIMESTAMP,
    Updated_At DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- 13. Messages
CREATE TABLE Messages (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Image VARCHAR(500),
    Name VARCHAR(255),
    Roll VARCHAR(100),
    Description TEXT,
    Read_More_Url VARCHAR(500),
    Index_No INT,
    Is_Active ENUM('active', 'inactive') DEFAULT 'active',
    Created_At DATETIME DEFAULT CURRENT_TIMESTAMP,
    Updated_At DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- 14. Admission
CREATE TABLE Admission (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255),
    Father_Name VARCHAR(255),
    Mother_Name VARCHAR(255),
    Email VARCHAR(255),
    Phone VARCHAR(20),
    Class VARCHAR(100),
    DOB DATE,
    City VARCHAR(100),
    State VARCHAR(100),
    Gender VARCHAR(20),
    Admission_Date DATE,
    More_Info TEXT,
    Is_Active ENUM('active', 'inactive') DEFAULT 'active',
    Created_At DATETIME DEFAULT CURRENT_TIMESTAMP,
    Updated_At DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- 15. Gallery_Category
CREATE TABLE Gallery_Category (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255),
    Title VARCHAR(255),
    Index_No INT,
    Date DATE,
    Is_Active ENUM('active', 'inactive') DEFAULT 'active',
    Created_At DATETIME DEFAULT CURRENT_TIMESTAMP,
    Updated_At DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- 16. Gallery
CREATE TABLE Gallery (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Gallery_Category_Id INT,
    Image VARCHAR(500),
    Description TEXT,
    Is_Active ENUM('active', 'inactive') DEFAULT 'active',
    Created_At DATETIME DEFAULT CURRENT_TIMESTAMP,
    Updated_At DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (Gallery_Category_Id) REFERENCES Gallery_Category(Id) ON DELETE CASCADE
);

-- 17. Pages_Category
CREATE TABLE Pages_Category (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Index_No INT,
    Name VARCHAR(255),
    Url VARCHAR(500),
    Is_Active ENUM('active', 'inactive') DEFAULT 'active',
    Created_At DATETIME DEFAULT CURRENT_TIMESTAMP,
    Updated_At DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- 18. Pages
CREATE TABLE Pages (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Pages_Category_Id INT,
    Page_Data TEXT,
    Is_Active ENUM('active', 'inactive') DEFAULT 'active',
    Created_At DATETIME DEFAULT CURRENT_TIMESTAMP,
    Updated_At DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (Pages_Category_Id) REFERENCES Pages_Category(Id) ON DELETE CASCADE
);