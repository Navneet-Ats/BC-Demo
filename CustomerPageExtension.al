pageextension 50101 CustomerCardExt extends "Customer Card"
{
    layout
    {
        addlast(General)
        {
            field("Facebook Handle"; Rec."Facebook Handle")
            {
                ApplicationArea = All;
                ToolTip = 'Enter the customer’s Facebook profile handle.';
            }

            field("Customer Type (Timeline)"; Rec."Customer Type (Timeline)")
            {
                ApplicationArea = All;
                ToolTip = 'Select the customer type migrated from Timeline ERP.';
            }
            field("EDIPartner1"; Rec."EDI Partner 1")
            {
                ApplicationArea = All;
            }
            field("Marital Status"; Rec."Marital Status")
            {
                ApplicationArea = All;
                CaptionClass = '3, My awesome caption'; // Will return string at runtime
            }
        }
    }
}
