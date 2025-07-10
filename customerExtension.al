tableextension 50100 CustomerExt extends Customer
{
    fields
    {
        field(50100; "Facebook Handle"; Text[100])
        {
            Caption = 'Facebook Handle';
            DataClassification = CustomerContent;
        }

        field(50101; "Customer Type (Timeline)"; Option)
        {
            Caption = 'Customer Type (Timeline)';
            OptionMembers = "Retail","Wholesale","Other";
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                case Rec."Customer Type (Timeline)" of
                    Rec."Customer Type (Timeline)"::Wholesale:
                        Rec."Customer Posting Group" := 'WHOLESALE';
                    Rec."Customer Type (Timeline)"::Retail:
                        Rec."Customer Posting Group" := 'RETAIL';
                    Rec."Customer Type (Timeline)"::Other:
                        Rec."Customer Posting Group" := 'GENERAL';
                end;
            end;
        }

        field(50102; "EDI Partner 1"; Code[20])
        {
            Caption = 'zvg_ede1'; // This is the UI label
            DataClassification = CustomerContent;
        }
        field(50110; "Marital Status"; Option)
        {
            OptionMembers = Single,Married,Divorced,Widowed;
            DataClassification = CustomerContent;
        }
    }
}
