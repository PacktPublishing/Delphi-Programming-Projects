unit uCustomers;

interface

Type
  TCustomer = class
  private
    Fname: string;
    Fid: integer;
    Fstatus: integer;
    procedure Setid(const Value: integer);
    procedure Setname(const Value: string);
    procedure Setstatus(const Value: integer);
  published
    property id : integer read Fid write Setid;
    property name : string read Fname write Setname;
    property status : integer read Fstatus write Setstatus;
  end;

implementation

{ TCustomer }

procedure TCustomer.Setid(const Value: integer);
begin
  Fid := Value;
end;

procedure TCustomer.Setname(const Value: string);
begin
  Fname := Value;
end;

procedure TCustomer.Setstatus(const Value: integer);
begin
  Fstatus := Value;
end;

end.
