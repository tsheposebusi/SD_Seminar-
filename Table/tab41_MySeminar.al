table 50141 "CSD My Seminar"
{
    Caption = 'My Seminar';


    fields
    {
        field(10; "User ID "; Code[50])
        {
            Caption = 'User ID';
            TableRelation = User;

        }
        field(20; "Seminar No."; Code[20])
        {
            Caption = 'Seminor No.';
            TableRelation = "CSD Seminar";
        }
    }

    keys
    {
        key(PK; "User ID ", "Seminar No.")
        {
            Clustered = true;

        }
    }



}