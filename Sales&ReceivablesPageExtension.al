pageextension 50112 "Sales & Receivables Setup Ext" extends "Sales & Receivables Setup"
{
    layout
    {
        addlast("Number Series")
        {
            field("Resp.PersonNos."; Rec."Resp.PersonNos.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the code for the number series that will be used to assign numbers to responsible persons.';
            }
        }
    }
}