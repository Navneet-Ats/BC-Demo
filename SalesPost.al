codeunit 50100 "Resp. Person Event Subscriber"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnBeforePostSalesDoc', '', false, false)]
    local procedure OnBeforePostSalesDoc(var SalesHeader: Record "Sales Header"; CommitIsSuppressed: Boolean; PreviewMode: Boolean; var HideProgressWindow: Boolean)
    var
        SalesLine: Record "Sales Line";
        RespPersonDocLine: Record "Responsible Person Line";
        LineNo: Integer;
        TotalQuantity: Decimal;
        TotalAmount: Decimal;
    begin
        // Skip if in preview mode or no responsible person assigned
        if PreviewMode or (SalesHeader."Resp-Person No." = '') then
            exit;
        // Get the sales lines and calculate totals
        TotalQuantity := 0;
        TotalAmount := 0;

        SalesLine.Reset();
        SalesLine.SetRange("Document Type", SalesHeader."Document Type");
        SalesLine.SetRange("Document No.", SalesHeader."No.");

        if SalesLine.FindSet() then begin
            repeat
                if (SalesLine.Type <> SalesLine.Type::" ") and (SalesLine."Qty. to Ship" <> 0) then begin
                    // Changed from SalesLine.Quantity to SalesLine."Qty. to Ship"
                    TotalQuantity += SalesLine."Qty. to Ship";
                    TotalAmount += SalesLine."Unit Price" * SalesLine."Qty. to Ship";
                end;
            until SalesLine.Next() = 0;

            // Only create a document line if there are items to ship
            if TotalQuantity > 0 then begin
                // Find the next line number for this responsible person
                RespPersonDocLine.Reset();
                RespPersonDocLine.SetRange("Responsible Person No.", SalesHeader."Resp-Person No.");
                if RespPersonDocLine.FindLast() then
                    LineNo := RespPersonDocLine."Line No." + 10000
                else
                    LineNo := 10000;

                // Create a single document line with the totals
                RespPersonDocLine.Init();
                RespPersonDocLine."Responsible Person No." := SalesHeader."Resp-Person No.";
                RespPersonDocLine."Line No." := LineNo;
                RespPersonDocLine."Document Type" := ConvertToDocType(SalesHeader."Document Type");
                RespPersonDocLine."Document No." := SalesHeader."No.";
                RespPersonDocLine.Quantity := TotalQuantity;
                RespPersonDocLine.Amount := TotalAmount;
                RespPersonDocLine.Insert();
            end;
        end;
    end;

    local procedure ConvertToDocType(SalesDocType: Enum "Sales Document Type"): Enum "Document Type"
    begin
        case SalesDocType of
            SalesDocType::Order:
                exit("Document Type"::"Sales Order");
            SalesDocType::Invoice:
                exit("Document Type"::Invoice);
            SalesDocType::Quote:
                exit("Document Type"::"Sales Quote");
            SalesDocType::"Credit Memo":
                exit("Document Type"::"Credit Memo");
            SalesDocType::"Return Order":
                exit("Document Type"::"Return Order");
            else
                exit("Document Type"::" ");
        end;
    end;
}