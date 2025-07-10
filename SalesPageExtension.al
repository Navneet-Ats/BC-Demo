pageextension 50104 SalesOrderExt extends "Sales Order"
{
    layout
    {
        addafter("Campaign No.")
        {
            field("Select Location"; Rec."Select Location")
            {
                ApplicationArea = All;
                ToolTip = 'Select the location for the sales order.';

                trigger OnAssistEdit()
                var
                    LocationList: Page "Location List";
                    LocationRec: Record "Location";
                    LocationArray: List of [Text];
                    LocationCount: Integer;
                begin
                    LocationList.LookupMode := true;
                    LocationList.SetTableView(LocationRec);

                    if LocationList.RunModal() = Action::LookupOK then begin
                        LocationList.GetRecord(LocationRec);
                        Rec.Validate("Select Location", LocationList.GetSelectionFilter());
                    end;

                    if (Rec."Select Location" <> '') then begin
                        LocationArray := Rec."Select Location".Split('|'); // Splitting selected values
                        LocationCount := LocationArray.Count;

                        if (LocationCount < 2) or (LocationCount > 5) then
                            Error('You must select between 2 and 5 locations.');
                    end;
                end;

                trigger OnValidate()
                var
                    LocationArray: List of [Text];
                    LocationCount: Integer;
                begin
                    if (xRec."Select Location" <> '') and (Rec."Select Location" <> '') then begin
                        LocationArray := Rec."Select Location".Split('|'); // Splitting selected values
                        LocationCount := LocationArray.Count;

                        if (LocationCount < 2) or (LocationCount > 5) then
                            Error('You must select between 2 and 5 locations.');
                    end;
                end;
            }

            field("Resp-Person No."; Rec."Resp-Person No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the responsible person for this sales order';
                TableRelation = "Responsible Person"."Emp. No.";

                trigger OnValidate()
                var
                    ResponsiblePerson: Record "Responsible Person";
                begin
                    if ResponsiblePerson.Get(Rec."Resp-Person No.") then begin
                        Rec."Resp-Person First Name" := ResponsiblePerson."First Name";
                        Rec."Resp-Person Last Name" := ResponsiblePerson."Last Name";
                        Rec."Resp-Person Address" := ResponsiblePerson."Address";
                        Rec."Resp-Person Contact" := ResponsiblePerson."Contact Number";
                    end else begin
                        Rec."Resp-Person First Name" := '';
                        Rec."Resp-Person Last Name" := '';
                        Rec."Resp-Person Address" := '';
                        Rec."Resp-Person Contact" := '';
                    end;
                end;
            }

            field("Resp-Person First Name"; Rec."Resp-Person First Name")
            {
                ApplicationArea = All;
                ToolTip = 'Displays the first name of the responsible person';
                Editable = false;
            }

            field("Resp-Person Last Name"; Rec."Resp-Person Last Name")
            {
                ApplicationArea = All;
                ToolTip = 'Displays the last name of the responsible person';
                Editable = false;
            }

            field("Resp-Person Address"; Rec."Resp-Person Address")
            {
                ApplicationArea = All;
                ToolTip = 'Displays the address of the responsible person';
                Editable = false;
            }

            field("Resp-Person Contact"; Rec."Resp-Person Contact")
            {
                ApplicationArea = All;
                ToolTip = 'Displays the contact number of the responsible person';
                Editable = false;
            }
        }
    }
}