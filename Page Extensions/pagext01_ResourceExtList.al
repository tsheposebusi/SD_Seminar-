pageextension 50101 "CSD ResourceListExt" extends "Resource List"
//CSD1.00 - 2019-02-06 - D. E. Veloper
{
    layout
    {

        modify(Type)
        {
            Visible = Showtype;
        }

        addafter(Type)
        {
            field("CSD Resource Type"; "CSD Resource Type")
            {

            }
            field("CSD Maximum Participants"; "CSD Maximum Participants")
            {
                Visible = ShowMaxField;
            }
        }
    }

    trigger OnOpenPage()

    begin
        Showtype := (GetFilter(Type) = '');
        ShowMaxField := (GetFilter(Type) = format(Type::Machine))
    end;

    var
        [InDataSet]
        ShowMaxField: Boolean;
        [InDataSet]
        Showtype: Boolean;
}