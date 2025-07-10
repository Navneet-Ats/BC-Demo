page 50110 "Responsible Person Card"
{
    PageType = Card;
    SourceTable = "Responsible Person";
    Caption = 'Responsible Person';
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(Group)
            {
                field("Emp. No."; Rec."Emp. No.")
                {
                    ApplicationArea = All;

                    trigger OnAssistEdit()
                    var
                        NoSeriesRec: Record "No. Series";
                        NoSeriesMgt: Codeunit "No. Series";
                        NextNo: Text[20];
                        IsSelected: Boolean;
                    begin
                        // Filter the number series to only show a specific one and related series
                        NoSeriesRec.Reset();
                        NoSeriesRec.SetFilter(Code, 'RESP-PERSON*');  // Replace with your actual series prefix

                        // Allow user to select from the filtered number series
                        IsSelected := Page.RunModal(Page::"No. Series", NoSeriesRec) = Action::LookupOK;

                        if IsSelected then begin
                            // Generate the next number from the selected number series
                            NextNo := NoSeriesMgt.GetNextNo(NoSeriesRec."Code", 0D, true);

                            if NextNo = '' then
                                Error('No next number available for the selected series.');

                            // Assign the next number from the series
                            Rec."Emp. No." := NextNo;
                        end;
                    end;

                    trigger OnValidate()
                    var
                        NoSeriesLine: Record "No. Series Line";
                        ManualNumStr: Text;
                        LastUsedNumStr: Text;
                        ManualNum: Integer;
                        LastUsedNum: Integer;
                        EmployeeNoPrefix: Text;
                    begin
                        // Skip processing if empty
                        if Rec."Emp. No." = '' then
                            exit;

                        // Define your number series code
                        EmployeeNoPrefix := 'EMP';  // Replace with your actual series prefix

                        // Only process if the manually entered value follows the expected format
                        if StrPos(Rec."Emp. No.", EmployeeNoPrefix) = 1 then begin
                            // Find the relevant number series line
                            NoSeriesLine.Reset();
                            NoSeriesLine.SetRange("Series Code", EmployeeNoPrefix);
                            if NoSeriesLine.FindFirst() then begin
                                // Extract numeric parts for comparison
                                ManualNumStr := CopyStr(Rec."Emp. No.", StrPos(Rec."Emp. No.", '-') + 1);
                                if Evaluate(ManualNum, ManualNumStr) then begin
                                    LastUsedNumStr := CopyStr(NoSeriesLine."Last No. Used", StrPos(NoSeriesLine."Last No. Used", '-') + 1);
                                    if Evaluate(LastUsedNum, LastUsedNumStr) then begin
                                        // If manually entered number is higher, update the series
                                        if ManualNum > LastUsedNum then begin
                                            NoSeriesLine."Last No. Used" := Rec."Emp. No.";
                                            NoSeriesLine.Modify();
                                        end;
                                    end;
                                end;
                            end;
                        end;
                    end;
                }

                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = All;
                }

                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = All;
                }

                field("Address"; Rec."Address")
                {
                    ApplicationArea = All;
                }

                field("Contact Number"; Rec."Contact Number")
                {
                    ApplicationArea = All;
                }
            }

            part(DocumentLines; "Responsible Person Doc Subpage")
            {
                ApplicationArea = All;
                SubPageLink = "Responsible Person No." = FIELD("Emp. No.");
                Caption = 'Lines';
                UpdatePropagation = Both;
            }
        }
    }
}