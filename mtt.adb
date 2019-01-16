with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings; use Ada.Strings;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;

procedure Mtt is
x : Long_Integer := 0;
flag : Integer :=0;
startInt : constant Long_Integer := 1;
endInt : constant Long_Integer := 350000001;

begin

	for i in startInt..endInt loop
		flag := 0;
		if ((i mod 3) = 0) then
			flag := 1;
		end if;
		if ((i mod 2) = 0) then
			flag := 1;
		end if;

		if(flag = 0) then
			x := i + x;
		end if;
	end loop;

	Put_Line(Trim(Long_Integer'Image(x), Both));
end Mtt;

