unit uProducts;

interface

Type
  TProducts = class
  private
    Fcode: string;
    Fid: integer;
    Fdescr: string;
    Fquantity: double;
    Ftax: double;
    Flist_price: double;
    procedure Setcode(const Value: string);
    procedure Setdescr(const Value: string);
    procedure Setid(const Value: integer);
    procedure Setlist_price(const Value: double);
    procedure Setquantity(const Value: double);
    procedure Settax(const Value: double);
  published
    property id : integer read Fid write Setid;
    property code : string read Fcode write Setcode;
    property descr : string read Fdescr write Setdescr;
    property list_price : double read Flist_price write Setlist_price;
    property tax : double read Ftax write Settax;
    property quantity : double read Fquantity write Setquantity;
  end;

implementation

{ TProducts }

procedure TProducts.Setcode(const Value: string);
begin
  Fcode := Value;
end;

procedure TProducts.Setdescr(const Value: string);
begin
  Fdescr := Value;
end;

procedure TProducts.Setid(const Value: integer);
begin
  Fid := Value;
end;

procedure TProducts.Setlist_price(const Value: double);
begin
  Flist_price := Value;
end;

procedure TProducts.Setquantity(const Value: double);
begin
  Fquantity := Value;
end;

procedure TProducts.Settax(const Value: double);
begin
  Ftax := Value;
end;

end.
