unit uUsers;

interface

Type
  TUser = class
  private
    Fid: integer;
    Fpassword: string;
    Flogin: string;
    procedure Setid(const Value: integer);
    procedure Setlogin(const Value: string);
    procedure Setpassword(const Value: string);
  published
    property id : integer read Fid write Setid;
    property login : string read Flogin write Setlogin;
    property password : string read Fpassword write Setpassword;
  end;

implementation

{ TUser }

procedure TUser.Setid(const Value: integer);
begin
  Fid := Value;
end;

procedure TUser.Setlogin(const Value: string);
begin
  Flogin := Value;
end;

procedure TUser.Setpassword(const Value: string);
begin
  Fpassword := Value;
end;

end.
