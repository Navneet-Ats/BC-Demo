page 50202 "Employee Statistics"
{
    PageType = CardPart;
    SourceTable = "External Employee";
    ApplicationArea = All;
    Caption = 'Employee Statistics';

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Open Sales Quotes"; 'OpenSalesQuotes')
                {
                    ApplicationArea = All;
                    Caption = 'Open Sales Quotes';
                }
            }

            field("Open Sales Orders"; 'Open Sales Orders')
            {
                ApplicationArea = All;
                Caption = 'Open Sales Orders';
            }

            field("Open Sales Invoices"; 'Open Sales Invoices')
            {
                ApplicationArea = All;
                Caption = 'Open Sales Invoices';
            }

            field("Total Sales Amount"; 'Total Sales Amount')
            {
                ApplicationArea = All;
                Caption = 'Total Sales Amount';
            }
        }
    }
    var
        OpenSalesQuotes: Integer;
        OpenSalesOrders: Integer;
        OpenSalesInvoices: Integer;
        TotalSalesAmount: Decimal;
}