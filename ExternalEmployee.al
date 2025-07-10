table 50200 "External Employee"
{
    Caption = 'External Employee';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "No."; Code[10])
        {
            Caption = 'No.';

        }

        field(2; "First Name"; Text[30])
        {
            Caption = 'First Name';
            ToolTip = 'Specifies the first name of the employee.';


        }

        field(3; "Middle Name"; Text[30])
        {
            Caption = 'Middle Name';
            ToolTip = 'Specifies the middle name of the employee.';

        }

        field(4; "Last Name"; Text[30])
        {
            Caption = 'Last Name';
            ToolTip = 'Specifies the last name of the employee.';

        }

        field(5; "Job Title"; Text[30])
        {
            Caption = 'Job Title';
            ToolTip = 'Specifies the job title of the employee.';

        }

        field(6; "Search Name"; Text[250])
        {
            Caption = 'Search Name';
            ToolTip = 'Specifies an alternate name used for searching.';

        }

        field(7; "Address"; Text[100])
        {
            Caption = 'Address';
            ToolTip = 'Specifies the address of the employee.';

        }

        field(8; "Address 2"; Text[50])
        {
            Caption = 'Address 2';
            ToolTip = 'Specifies the second line of the address of the employee.';

        }

        field(9; "City"; Text[30])
        {
            Caption = 'City';
            ToolTip = 'Specifies the city of the employee.';

        }

        field(10; "Post Code"; Text[20])
        {
            Caption = 'Post Code';
            ToolTip = 'Specifies the postal code of the employee.';

        }

        field(11; "Country"; Text[30])
        {
            Caption = 'Country';
            ToolTip = 'Specifies the country of the employee.';

        }

        field(12; "Phone No."; Text[30])
        {
            Caption = 'Phone No.';
            ToolTip = 'Specifies the phone number of the employee.';

        }

        field(13; "Mobile No."; Text[30])
        {
            Caption = 'Mobile No.';
            ToolTip = 'Specifies the mobile phone number of the employee.';

        }

        field(14; "E-Mail"; Text[80])
        {
            Caption = 'E-Mail';
            ToolTip = 'Specifies the email address of the employee.';

        }

        field(15; "Birth Date"; DateTime)
        {
            Caption = 'Birth Date';
            ToolTip = 'Specifies the birth date of the employee.';

        }

        field(16; "Gender"; Enum "Employee Gender")
        {
            Caption = 'Gender';
            ToolTip = 'Specifies the Gender of the employee';

        }

        field(17; "Country_Region Code"; Code[10])
        {
            Caption = 'Country/Region Code';
            ToolTip = 'Specifies the country or region code of the employee.';

        }

        field(18; "Manager No."; Code[20])
        {
            Caption = 'Manager No.';
            ToolTip = 'Specifies the employee number of the manager of this employee.';

        }

        field(19; "Status"; Enum "Employee Status")
        {
            Caption = 'Status';
            ToolTip = 'Specifies the status of the employee.';

        }

        field(20; "Fax No."; Code[30])
        {
            Caption = 'Fax No.';
            ToolTip = 'Specifies the fax number of the employee.';

        }

        field(21; "Image"; Media)
        {
            Caption = 'Image';
            ToolTip = 'Specifies the image of the employee.';

        }
    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
}
