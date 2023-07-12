with Ada.Numerics.Elementary_Functions;
with Ada.Float_Text_IO;
with Ada.Text_IO;
with Utility;
with Ada.Strings;
with Ada.Integer_Text_IO;
with Lista;
with Ada.Numerics;
use Ada.Text_IO;
use Ada.Float_Text_IO;
use Utility;
use Lista;
use Ada.Strings;
use Ada.Integer_Text_IO;
use Ada.Numerics.Elementary_Functions;
procedure Main is
   type AnglesTosum is array (1..11) of Float;
   Angles:AnglesTosum:= (180.0,90.0,180.0,45.0,180.0,45.0,-45.0,180.0,-45.0,180.0,270.0);
   d: Float;
   teta: Float;
   origin:Coord;
   model:Integer;
   ListaCoord: Float_Matrix;
   HaFunz:Boolean;
   y: Float;
   x: Float;
   r: Float:= 3963.1906;
   f: Float:= 0.00335281066474748071984552861852;
   U1: Float;
   sgma1: Float;
   k: Float;
   u: Float;
   a: Float:=6378137.0;
   b: Float:=6356752.314245;
   e: Float;
   g: Float;
   sgma2: Float;
   lambda: Float;
   Ci: Float;
   sgmam:Float;
   L: Float;
begin

   Put("Enter the value for d: ");
   Get(d);
   Put("Enter the value for teta: ");
   Get(teta);
   Put("Enter the value for latitude (in deg pls): ");
   Get(origin(1));
   Put("Enter the value for longitude (in deg pls): ");
   Get(origin(2));
   Put("Enter the value for model: ");
   Get(model);
   if(not(To_Radiant(origin(2))<(-Ada.Numerics.Pi)/2.0 or else To_Radiant(origin(2))>(Ada.Numerics.Pi)/2.0 or else To_Radiant(origin(1))<-Ada.Numerics.Pi or else To_Radiant(origin(1))>Ada.Numerics.Pi or else teta<0.0 or else teta>360.0)) then
      case model is
         when 1=>
            ListaCoord(1):= origin;
            for i in Integer range 1..11 loop
               case i is
                  when 4|9=>
                     ListaCoord(i+1):=(ListaCoord(i)(1)+sqrt(2.0)*d*Cos(To_Radiant(teta+Angles(i)))/53.0,ListaCoord(i)(2)+sqrt(2.0)*d*Sin(To_Radiant(teta+Angles(i)))/53.0);
                  when 6|7=>
                     ListaCoord(i+1):=(ListaCoord(i)(1)+1.5*sqrt(2.0)*d*Cos(To_Radiant(teta+Angles(i)))/53.0,ListaCoord(i)(2)+1.5*sqrt(2.0)*d*Sin(To_Radiant(teta+Angles(i)))/53.0);
                  when others=>
                     ListaCoord(i+1):=(ListaCoord(i)(1)+d*Cos(To_Radiant(teta+Angles(i)))/53.0,ListaCoord(i)(2)+d*Sin(To_Radiant(teta+Angles(i)))/53.0);
               end case;
            end loop;
            HaFunz:=Make_The_File(ListaCoord);
         when 2=>
            ListaCoord(1) := origin;
            for i in Integer range 1..11 loop
               case i is
                  when 4|9=>
                     x:= To_Degree(Arcsin(Sin(To_Radiant(ListaCoord(i)(1)))*Cos(sqrt(2.0)*d/r)+Cos(To_Radiant(ListaCoord(i)(1)))*Sin(sqrt(2.0)*d/r)*Cos(To_Radiant(teta+Angles(i)))));
                     y:= ListaCoord(i)(2) + To_Degree(Arctan((Sin(To_Radiant(teta+Angles(i)))*Sin(sqrt(2.0)*d/r)*Cos(To_Radiant(ListaCoord(i)(1))))/(Cos(sqrt(2.0)*d/r)-Sin(To_Radiant(ListaCoord(i)(1)))*Sin(To_Radiant(x)))));
                     ListaCoord(i+1) :=(x,y);
                  when 6|7=>
                     x:= To_Degree(Arcsin(Sin(To_Radiant(ListaCoord(i)(1)))*Cos(1.5*sqrt(2.0)*d/r)+Cos(To_Radiant(ListaCoord(i)(1)))*Sin(1.5*sqrt(2.0)*d/r)*Cos(To_Radiant(teta+Angles(i)))));
                     y:= ListaCoord(i)(2) + To_Degree(Arctan((Sin(To_Radiant(teta+Angles(i)))*Sin(1.5*sqrt(2.0)*d/r)*Cos(To_Radiant(ListaCoord(i)(1))))/(Cos(1.5*sqrt(2.0)*d/r)-Sin(To_Radiant(ListaCoord(i)(1)))*Sin(To_Radiant(x)))));
                     ListaCoord(i+1) :=(x,y);
                  when others=>
                     x:= To_Degree(Arcsin(Sin(To_Radiant(ListaCoord(i)(1)))*Cos(d/r)+Cos(To_Radiant(ListaCoord(i)(1)))*Sin(d/r)*Cos(To_Radiant(teta+Angles(i)))));
                     y:= ListaCoord(i)(2) + To_Degree(Arctan((Sin(To_Radiant(teta+Angles(i)))*Sin(d/r)*Cos(To_Radiant(ListaCoord(i)(1))))/(Cos(d/r)-Sin(To_Radiant(ListaCoord(i)(1)))*Sin(To_Radiant(x)))));
                     ListaCoord(i+1) :=(x,y);
               end case;
            end loop;
            HaFunz:=Make_The_File(ListaCoord);
         when 3=>
            ListaCoord(1) :=origin;
            for i in Integer range 1..11 loop
               case i is
                  when 4|9=>
                     U1 := Arctan((1.0-f)*Tan(To_Radiant(ListaCoord(i)(1))));
                     sgma1 :=Arctan(Tan(U1)/Cos(To_Radiant(teta+Angles(i))));
                     k := Cos(U1)*Sin(To_Radiant(teta+Angles(i)));
                     u := Cos(1.0-k*k)*((a*a-b*b)/(b*b));
                     e := 1.0+u/16384.0*(4096.0+u*(-768.0+u*(320.0-175.0*u)));
                     g := u/1024.0*(256.0+u*(-128.0+u*(74.0-47.0*u)));
                     sgma2 := d*sqrt(2.0)/(0.00062137*b*e);
                     sgmam := 2.0*sgma1+sgma2;
                     ListaCoord(i+1)(1) := To_Degree(Arctan((Sin(U1)*Cos(sgma2)+Cos(U1)*Sin(sgma2)*Cos(To_Radiant(teta+Angles(i))))/(1.0-f)*sqrt(k*k+(Sin(U1)*Sin(sgma2)-Cos(U1)*Cos(sgma2)*Cos(to_Radiant(teta+Angles(i))))*(Sin(U1)*Sin(sgma2)-Cos(U1)*Cos(sgma2)*Cos(To_Radiant(teta+Angles(i)))))));
                     lambda := To_Degree(Arctan((Sin(sgma2)*Sin(To_Radiant(teta+Angles(i))))/(Cos(U1)*Cos(sgma2)-Sin(U1)*Sin(sgma2)*Cos(To_Radiant(teta+Angles(i))))));
                     Ci := f/16.0*(1.0-k*k)*(4.0+f*(4.0-3.0*(1.0-k*k)));
                     L := lambda - To_Degree((1.0 - Ci)*f*k*(sgma2+ Ci*Sin(sgma2)*(Cos(2.0*sgmam)+Ci*Cos(sgma2)*(-1.0+2.0*Cos(2.0*sgmam)*Cos(2.0*sgmam)))));
                     ListaCoord(i+1)(2):= L+ListaCoord(i)(2);
                  when 6|7=>
                     U1 := Arctan((1.0-f)*Tan(To_Radiant(ListaCoord(i)(1))));
                     sgma1 :=Arctan(Tan(U1)/Cos(To_Radiant(teta+Angles(i))));
                     k := Cos(U1)*Sin(To_Radiant(teta+Angles(i)));
                     u := Cos(1.0-k*k)*((a*a-b*b)/(b*b));
                     e := 1.0+u/16384.0*(4096.0+u*(-768.0+u*(320.0-175.0*u)));
                     g := u/1024.0*(256.0+u*(-128.0+u*(74.0-47.0*u)));
                     sgma2 := 1.5*d*sqrt(2.0)/(0.00062137*b*e);
                     sgmam := 2.0*sgma1+sgma2;
                     ListaCoord(i+1)(1) := To_Degree(Arctan((Sin(U1)*Cos(sgma2)+Cos(U1)*Sin(sgma2)*Cos(To_Radiant(teta+Angles(i))))/(1.0-f)*sqrt(k*k+(Sin(U1)*Sin(sgma2)-Cos(U1)*Cos(sgma2)*Cos(to_Radiant(teta+Angles(i))))*(Sin(U1)*Sin(sgma2)-Cos(U1)*Cos(sgma2)*Cos(To_Radiant(teta+Angles(i)))))));
                     lambda := To_Degree(Arctan((Sin(sgma2)*Sin(To_Radiant(teta+Angles(i))))/(Cos(U1)*Cos(sgma2)-Sin(U1)*Sin(sgma2)*Cos(To_Radiant(teta+Angles(i))))));
                     Ci := f/16.0*(1.0-k*k)*(4.0+f*(4.0-3.0*(1.0-k*k)));
                     L := lambda - To_Degree((1.0 - Ci)*f*k*(sgma2+ Ci*Sin(sgma2)*(Cos(2.0*sgmam)+Ci*Cos(sgma2)*(-1.0+2.0*Cos(2.0*sgmam)*Cos(2.0*sgmam)))));
                     ListaCoord(i+1)(2):= L+ListaCoord(i)(2);
                  when others=>
                     U1 := Arctan((1.0-f)*Tan(To_Radiant(ListaCoord(i)(1))));
                     sgma1 :=Arctan(Tan(U1)/Cos(To_Radiant(teta+Angles(i))));
                     k := Cos(U1)*Sin(To_Radiant(teta+Angles(i)));
                     u := Cos(1.0-k*k)*((a*a-b*b)/(b*b));
                     e := 1.0+u/16384.0*(4096.0+u*(-768.0+u*(320.0-175.0*u)));
                     g := u/1024.0*(256.0+u*(-128.0+u*(74.0-47.0*u)));
                     sgma2 := d/(0.00062137*b*e);
                     sgmam := 2.0*sgma1+sgma2;
                     ListaCoord(i+1)(1) := To_Degree(Arctan((Sin(U1)*Cos(sgma2)+Cos(U1)*Sin(sgma2)*Cos(To_Radiant(teta+Angles(i))))/(1.0-f)*sqrt(k*k+(Sin(U1)*Sin(sgma2)-Cos(U1)*Cos(sgma2)*Cos(to_Radiant(teta+Angles(i))))*(Sin(U1)*Sin(sgma2)-Cos(U1)*Cos(sgma2)*Cos(To_Radiant(teta+Angles(i)))))));
                     lambda := To_Degree(Arctan((Sin(sgma2)*Sin(To_Radiant(teta+Angles(i))))/(Cos(U1)*Cos(sgma2)-Sin(U1)*Sin(sgma2)*Cos(To_Radiant(teta+Angles(i))))));
                     Ci := f/16.0*(1.0-k*k)*(4.0+f*(4.0-3.0*(1.0-k*k)));
                     L := lambda - To_Degree((1.0 - Ci)*f*k*(sgma2+ Ci*Sin(sgma2)*(Cos(2.0*sgmam)+Ci*Cos(sgma2)*(-1.0+2.0*Cos(2.0*sgmam)*Cos(2.0*sgmam)))));
                     ListaCoord(i+1)(2):= L+ListaCoord(i)(2);
               end case;
            end loop;
            HaFunz:=Make_The_File(ListaCoord);
         when others => Ada.Text_IO.Put("il modello inserito non è coperto");
      end case;
   else
      Ada.Text_IO.Put("Quelquechose cloche dans l'input");
   end if;



end Main;
