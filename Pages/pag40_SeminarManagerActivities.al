page 50140 "CSD Seminar Manager Activities"

{
    PageType = CardPart;
    Caption = 'Seminar Manager Activities';
    Editable = false;
    SourceTable = "CSD Seminar Cue";

    layout
    {
        area(Content)
        {
            cuegroup(Registrations)
            {
                group(Numbering)
                {
                    Caption = 'Numbering';
                    field(Planned; Planned)
                    {

                    }
                    field(Registered; Registered)
                    {

                    }
                }
                actions
                {

                    action(New)
                    {
                        Caption = 'New';
                        RunObject = page "CSD Seminar Registration";

                        RunPageMode = Create;
                    }
                }
            }
            cuegroup("For Posting")
            {
                field(Closed; Closed)
                {

                }
            }

        }
    }
    trigger OnOpenPage();

    begin
        if not get then begin
            Init;
            Insert;
        end;
    end;
}



