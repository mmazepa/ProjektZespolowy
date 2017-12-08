CREATE TABLE Role (
        id          SERIAL PRIMARY KEY,
        RoleName    VARCHAR(30) UNIQUE NOT NULL
);
CREATE TABLE Account (
        id                  SERIAL PRIMARY KEY,
        AccountRole         INTEGER NOT NULL
                            REFERENCES Role(id)
                            ON DELETE CASCADE
                            ON UPDATE CASCADE,
        NickName            VARCHAR(40) UNIQUE NOT NULL,
        Email               VARCHAR(60) UNIQUE NOT NULL,
        UserPass            VARCHAR(40) NOT NULL,
        RegistrationDate    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        Description         TEXT,
        FirstName           VARCHAR(40) NOT NULL,
        LastName            VARCHAR(40) NOT NULL,
        DateOfBirth         TIMESTAMP
);
CREATE TABLE Workgroup (
        id                  SERIAL PRIMARY KEY,
        GroupName           VARCHAR(40) NOT NULL,
        GroupCreationDate   TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        Description         TEXT,
        IsPrivate           INTEGER DEFAULT (0)
                            CHECK ((IsPrivate >= 0) AND (IsPrivate <= 1))
);
CREATE TABLE Attendance (
        id              SERIAL PRIMARY KEY,
        AttendingGroup  INTEGER NOT NULL
                        REFERENCES Workgroup(id)
                        ON DELETE CASCADE
                        ON UPDATE CASCADE,
        AttendingUser   INTEGER NOT NULL
                        REFERENCES Account(id)
                        ON DELETE CASCADE
                        ON UPDATE CASCADE,
        IsGroupAdmin    INTEGER DEFAULT (0)
                        CHECK ((IsGroupAdmin >= 0) AND (IsGroupAdmin <= 1)),
        JoinDate        TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE TextFile (
        id                  SERIAL PRIMARY KEY,
        AttendingAuthor     INTEGER NOT NULL
                            DEFAULT (0)
                            REFERENCES Account(id)
                            ON DELETE SET DEFAULT
                            ON UPDATE CASCADE,
        AttendingGroup      INTEGER NOT NULL
                            REFERENCES Workgroup(id)
                            ON DELETE CASCADE
                            ON UPDATE CASCADE,
        FileName            VARCHAR(100) NOT NULL,
        FileCreationDate    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        Description         TEXT,
        IsPrivate           INTEGER DEFAULT (0)
                            CHECK ((IsPrivate >= 0) AND (IsPrivate <= 1))
);

CREATE TABLE Snapshot (
        id              SERIAL PRIMARY KEY,
        SnapshotAuthor  INTEGER NOT NULL
                        DEFAULT (0)
                        REFERENCES Account(id)
                        ON DELETE SET DEFAULT
                        ON UPDATE CASCADE,
        AttendingFile   INTEGER NOT NULL
                        REFERENCES TextFile(id)
                        ON DELETE CASCADE
                        ON UPDATE CASCADE,
        SnapshotName    VARCHAR(40),
        SnapshotDate    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        Content         TEXT
);

CREATE TABLE Message (
        id              SERIAL PRIMARY KEY,
        MessageAuthor   INTEGER NOT NULL
                        DEFAULT (0)
                        REFERENCES Account(id)
                        ON DELETE SET DEFAULT
                        ON UPDATE CASCADE,
        AttendingGroup  INTEGER NOT NULL
                        REFERENCES Workgroup(id)
                        ON DELETE CASCADE
                        ON UPDATE CASCADE,
        SnapshotDate    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        Content         TEXT
);
