page 50142 "CSD Seminar Manager RoleCenter"

{

    PageType = RoleCenter;
    Caption = 'Seminar Manager RoleCenter';
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "CSD Seminar Cue";

    layout
    {
        area(RoleCenter)
        {
            group(Column1)
            {
                part(Activities; "CSD Seminar Manager Activities")
                {

                }
                part(MySeminars; "CSD My Seminar")
                {

                }
            }
            group(Column2)
            {
                part(MyCustomers; "My Customers")
                {

                }
                systempart(MyNotifications; MyNotes)
                {

                }
                part(ReportInbox; "Report Inbox Part")
                {

                }
            }
        }
    }

    actions
    {
        area(Embedding)
        {
            action(SeminarRegistrations)
            {
                Caption = 'Seminar Registrations';
                Image = List;
                RunObject = page "CSD Posted Seminar Reg. List";
                ToolTip = 'Create seminar registrations';

            }
            action(Seminars)
            {
                Caption = 'Seminars';
                image = List;
                RunObject = page "CSD Seminar List";
                ToolTip = 'View all seminars';
            }
            action(Instructors)
            {
                Caption = 'Instructors';
                RunObject = page "Resource List";
                RunPageView = where (Type = const (Person));
                ToolTip = 'View all resources registered as persons';
            }
            action(Rooms)
            {
                Caption = 'Rooms';
                RunObject = page "Resource List";
                RunPageView = where (Type = const (Machine));
                ToolTip = 'View all resources regisitered as machines';
            }
            action("Sales Invoices")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Sales Invoices';
                image = Invoice;
                RunObject = page "Sales Invoice List";
                ToolTip = 'Register your sales to customers';
            }
            action("Sales Credit Memos")
            {

                Caption = 'Sales Credit Memos';
                RunObject = page "Sales Credit Memos";
                ToolTip = 'Revert the financial transactions involved when your customers want to cancel a purchase';
            }
            action(Customers)
            {
                Caption = 'Customer';
                Image = Customer;
                RunObject = page "Customer List";
                ToolTip = 'View or edit detailed information for the customer that you trade with.';
            }

        }
        area(Sections)
        {
            group("Posted Documents")
            {
                Caption = 'Posted Documents';
                Image = FiledPosted;
                ToolTip = 'Viw history for sales, shipments, and inventory';

                action("Posted Seminar Registrations")
                {
                    Caption = 'Posted Seminar Registrations';
                    Image = Timesheet;
                    RunObject = page "CSD Posted Seminar Reg. List";
                    ToolTip = 'Open the list of posted Registrations.';
                }
                action("Posted Sales Invoices")
                {
                    caption = 'Posted Sales Invoices';
                    Image = PostedOrder;
                    RunObject = page "Posted Sales Invoices";
                    ToolTip = 'Open the list of posted sales invoices.';

                }
                action("Posted Sales Credit Memos")
                {
                    caption = 'Posted Sales Credit Memos';
                    Image = PostedOrder;
                    RunObject = page "Posted Sales Credit Memos";
                    ToolTip = 'Open the list of posted sales credit memos.';

                }
                action("Registers")
                {
                    Caption = 'Seminar Registers';
                    Image = PostedShipment;
                    RunObject = page "CSD Seminar Registers";
                    ToolTip = 'Open list of Seminar Registers.';
                }
            }
        }
        area(Creation)
        {
            action(NewSeminarRegistration)
            {
                Caption = 'Seminar Registration';
                Image = NewTimesheet;
                RunObject = page "CSD Seminar Registration";
                RunPageMode = Create;
            }
            action(NewSalesInvoice)
            {
                Caption = 'Sales Invoice';
                Image = SalesInvoice;
                RunObject = page "Sales Invoice";
                RunPageMode = create;
            }
        }
        area(Processing)
        {
            action(CreateInvoice)
            {
                Caption = 'Create Invoice';
                Image = CreateJobSalesInvoice;
                RunObject = report "CSD Create Seminar Invoices";
            }
            action(Navigate)
            {
                Caption = 'Navigate';
                Image = Navigate;
                RunObject = page Navigate;
                RunPageMode = Edit;
            }
        }

    }


    var
        myInt: Integer;
}