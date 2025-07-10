page 50111 "Responsible Person List"
{
    PageType = List;
    SourceTable = "Responsible Person";
    Caption = 'Responsible Persons List';
    ApplicationArea = All;
    UsageCategory = Lists;
    CardPageId = "Responsible Person Card"; // Links to your card page
    Editable = false; // Makes the list non-editable
    DeleteAllowed = false; // Disables delete action

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Emp. No."; Rec."Emp. No.")
                {
                    ApplicationArea = All;
                    DrillDown = true; // Makes the field clickable

                    // trigger OnDrillDown()
                    // begin
                    //     Page.Run(Page::"Responsible Person Card", Rec);
                    // end;
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Contact Number"; Rec."Contact Number")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }
        }
    }


}