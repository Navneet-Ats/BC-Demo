table 50113 "Responsible Person Line"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Responsible Person No."; Code[20])
        {
            Caption = 'Responsible Person No.';
            TableRelation = "Responsible Person"."Emp. No.";
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(3; "Document Type"; Enum "Document Type")
        {
            Caption = 'Document Type';
        }
        field(4; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(5; Quantity; Decimal)
        {
            Caption = 'Quantity';
            DecimalPlaces = 0 : 5;
        }
        field(6; Amount; Decimal)
        {
            Caption = 'Amount';
            DecimalPlaces = 2 : 2;
        }
        field(7; Description; Text[100])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;

        }
    }

    keys
    {
        key(Key1; "Responsible Person No.", "Line No.")
        {
            Clustered = true;
        }
    }
}