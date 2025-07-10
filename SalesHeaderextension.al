tableextension 50104 "Sales Header Ext" extends "Sales Header"
{
    fields
    {
        field(50100; "Select Location"; Text[250])
        {
            Caption = 'Select Location';
            DataClassification = CustomerContent;
        }

        field(50101; "Resp-Person No."; Code[20])
        {
            Caption = 'Resp-Person No.';
            TableRelation = "Responsible Person"."Emp. No.";
            DataClassification = CustomerContent;
        }

        field(50102; "Resp-Person First Name"; Text[50])
        {
            Caption = 'Resp-Person First Name';
            DataClassification = CustomerContent;
            Editable = false;
        }

        field(50103; "Resp-Person Last Name"; Text[50])
        {
            Caption = 'Resp-Person Last Name';
            DataClassification = CustomerContent;
            Editable = false;
        }

        field(50104; "Resp-Person Address"; Text[100])
        {
            Caption = 'Resp-Person Address';
            DataClassification = CustomerContent;
            Editable = false;
        }

        field(50105; "Resp-Person Contact"; Text[30])
        {
            Caption = 'Resp-Person Contact';
            DataClassification = CustomerContent;
            Editable = false;
        }
    }
}