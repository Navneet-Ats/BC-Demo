page 50200 "External Employee Card"
{
    PageType = Card;
    SourceTable = "External Employee";
    ApplicationArea = All;
    Caption = 'External Employee';

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    Caption = 'No.';
                    ToolTip = 'Specifies the external employee number.';
                    ApplicationArea = All;
                }

                field("First Name"; Rec."First Name")
                {
                    Caption = 'First Name';
                    ToolTip = 'Specifies the first name of the employee.';
                    ApplicationArea = All;
                }

                field("Middle Name"; Rec."Middle Name")
                {
                    Caption = 'Middle Name';
                    ToolTip = 'Specifies the middle name of the employee.';
                    ApplicationArea = All;
                }

                field("Last Name"; Rec."Last Name")
                {
                    Caption = 'Last Name';
                    ToolTip = 'Specifies the last name of the employee.';
                    ApplicationArea = All;
                }

                field("Job Title"; Rec."Job Title")
                {
                    Caption = 'Job Title';
                    ToolTip = 'Specifies the job title of the employee.';
                    ApplicationArea = All;
                }

                field("Search Name"; Rec."Search Name")
                {
                    Caption = 'Search Name';
                    ToolTip = 'Specifies an alternate name used for searching.';
                    ApplicationArea = All;
                }

                field("Gender"; Rec."Gender")
                {
                    Caption = 'Gender';
                    ToolTip = 'Specifies the gender of the employee.';
                    ApplicationArea = All;
                }

                field("Birth Date"; Rec."Birth Date")
                {
                    Caption = 'Birth Date';
                    ToolTip = 'Specifies the date of birth of the employee.';
                    ApplicationArea = All;
                }

                field("Status"; Rec."Status")
                {
                    Caption = 'Status';
                    ToolTip = 'Specifies the current status of the employee.';
                    ApplicationArea = All;
                }
            }

            group("Contact Info")
            {
                field("Phone No."; Rec."Phone No.")
                {
                    Caption = 'Phone No.';
                    ToolTip = 'Specifies the phone number.';
                    ApplicationArea = All;
                }

                field("Mobile No."; Rec."Mobile No.")
                {
                    Caption = 'Mobile No.';
                    ToolTip = 'Specifies the mobile phone number.';
                    ApplicationArea = All;
                }

                field("E-Mail"; Rec."E-Mail")
                {
                    Caption = 'E-Mail';
                    ToolTip = 'Specifies the email address.';
                    ApplicationArea = All;
                }

                field("Fax No."; Rec."Fax No.")
                {
                    Caption = 'Fax No.';
                    ToolTip = 'Specifies the fax number.';
                    ApplicationArea = All;
                }

                field("Address"; Rec."Address")
                {
                    Caption = 'Address';
                    ToolTip = 'Specifies the primary street address.';
                    ApplicationArea = All;
                }

                field("Address 2"; Rec."Address 2")
                {
                    Caption = 'Address 2';
                    ToolTip = 'Specifies additional address information.';
                    ApplicationArea = All;
                }

                field("City"; Rec."City")
                {
                    Caption = 'City';
                    ToolTip = 'Specifies the city of the employee.';
                    ApplicationArea = All;
                }

                field("Post Code"; Rec."Post Code")
                {
                    Caption = 'Post Code';
                    ToolTip = 'Specifies the postal code.';
                    ApplicationArea = All;
                }

                field("Country"; Rec."Country")
                {
                    Caption = 'Country';
                    ToolTip = 'Specifies the country name.';
                    ApplicationArea = All;
                }

                field("Country_Region Code"; Rec."Country_Region Code")
                {
                    Caption = 'Country/Region Code';
                    ToolTip = 'Specifies the country or region code.';
                    ApplicationArea = All;
                }
            }

            group(Other)
            {
                field("Manager No."; Rec."Manager No.")
                {
                    Caption = 'Manager No.';
                    ToolTip = 'Specifies the employee number of the manager.';
                    ApplicationArea = All;
                }

                field("Image"; Rec."Image")
                {
                    Caption = 'Image';
                    ToolTip = 'Specifies the image code or reference for the employee.';
                    ApplicationArea = All;
                }
            }
        }
        area(factboxes)
        {
            part(Control501; "Employee Statistics")
            {
                ApplicationArea = All;
                SubPageLink = "No." = field("No.");
            }

        }

    }

    actions
    {
        area(processing)
        {
            action(Edit)
            {
                ApplicationArea = All;
                Caption = 'Edit';
                Image = EditLines;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
            }
        }
    }


}