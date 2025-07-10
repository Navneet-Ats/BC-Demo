table 50109 "Responsible Person"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Emp. No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Employee No.';



        }

        field(2; "First Name"; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'First Name';
        }

        field(3; "Last Name"; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Last Name';
        }

        field(4; "Address"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Address';
        }

        field(5; "Contact Number"; Text[15])
        {
            DataClassification = CustomerContent;
            Caption = 'Contact Number';
        }
    }

    keys
    {
        key(PK; "Emp. No.") { Clustered = true; }
    }

    trigger OnInsert()
    var
        NoSeriesMgt: Codeunit "No. Series";
        NextNo: Text[20];
    begin
        if "Emp. No." = '' then begin
            // Fetch the next number from the number series
            NextNo := NoSeriesMgt.GetNextNo('RESP-Person', 0D, true);
            if NextNo = '' then
                Error('No next number available for the defined series.');

            "Emp. No." := NextNo; // Assign the number to "Emp. No."
        end;
    end;
}