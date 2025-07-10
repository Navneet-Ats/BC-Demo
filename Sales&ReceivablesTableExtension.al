tableextension 50111 "Sales & Receivables Setup Ext" extends "Sales & Receivables Setup"
{
    fields
    {
        field(50100; "Resp.PersonNos."; Code[20])
        {
            Caption = 'Resp.PersonNos.';
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
    }
}