table 50117 "Responsible Person Setup"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Resp. Person Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; "Resp. Person Nos.")
        {
            Clustered = true;
        }
    }
}