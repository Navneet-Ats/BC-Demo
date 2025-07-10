page 50201 "External Employee List"
{
    PageType = List;
    SourceTable = "External Employee";
    ApplicationArea = All;
    UsageCategory = Lists;
    Caption = 'External Employee List';
    CardPageId = "External Employee Card";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    Caption = 'No.';
                    ToolTip = 'Specifies the external employee number.';
                }
                field("First Name"; Rec."First Name")
                {
                    Caption = 'First Name';
                    ToolTip = 'Specifies the first name of the employee.';
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    Caption = 'Middle Name';
                    ToolTip = 'Specifies the middle name of the employee.';
                }
                field("Last Name"; Rec."Last Name")
                {
                    Caption = 'Last Name';
                    ToolTip = 'Specifies the last name of the employee.';
                }
                field("Job Title"; Rec."Job Title")
                {
                    Caption = 'Job Title';
                    ToolTip = 'Specifies the job title of the employee.';
                }
            }
        }
    }
}
