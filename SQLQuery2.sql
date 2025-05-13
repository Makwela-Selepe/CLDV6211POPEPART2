-- Drop tables if they already exist (optional safety step)
DROP TABLE IF EXISTS Booking;
DROP TABLE IF EXISTS Event;
DROP TABLE IF EXISTS Venue;

-- Venue Table
CREATE TABLE Venue (
    VenueId INT IDENTITY(1,1) PRIMARY KEY,
    VenueName NVARCHAR(100) NOT NULL,
    VenueLocation NVARCHAR(100) NOT NULL,
    Capacity INT,
    ImageUrl NVARCHAR(MAX)
);

-- Event Table
CREATE TABLE Event (
    EventId INT IDENTITY(1,1) PRIMARY KEY,
    EventName NVARCHAR(100) NOT NULL,
    EventDescription NVARCHAR(MAX),
    EventLocation NVARCHAR(100),
    VenueId INT NOT NULL,
    EventDate DATETIME NOT NULL,
    FOREIGN KEY (VenueId) REFERENCES Venue(VenueId)
        ON DELETE CASCADE
);

-- Booking Table
CREATE TABLE Booking (
    BookingId INT IDENTITY(1,1) PRIMARY KEY,
    EventId INT NOT NULL,
    VenueId INT NOT NULL,
    BookingDate DATE NOT NULL,
    FOREIGN KEY (EventId) REFERENCES Event(EventId)
        ON DELETE CASCADE,
    FOREIGN KEY (VenueId) REFERENCES Venue(VenueId)
        ON DELETE CASCADE
);
