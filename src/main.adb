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
   Put("Enter the value for latitude (in rad pls): ");
   Get(origin(1));
   Put("Enter the value for longitude (in rad pls): ");
   Get(origin(2));
   Put("Enter the value for model: ");
   Get(model);
   if(not(origin(2)<(-Ada.Numerics.Pi)/2.0 or else origin(2)>(Ada.Numerics.Pi)/2.0 or else origin(1)<-Ada.Numerics.Pi or else origin(1)>Ada.Numerics.Pi or else teta<0.0 or else teta>360.0)) then
      case model is
         when 1=>
            ListaCoord(1):= origin;
            ListaCoord(2):= (ListaCoord(1)(1)+d*Cos(To_Radiant(teta+Angles(1)))/53.0,ListaCoord(1)(2)+d*Sin(To_Radiant(teta+Angles(1)))/53.0);
            ListaCoord(3):= (ListaCoord(2)(1)+d*Cos(To_Radiant(teta+Angles(2)))/53.0,ListaCoord(2)(2)+d*Sin(To_Radiant(teta+Angles(2)))/53.0);
            ListaCoord(4):= (ListaCoord(3)(1)+d*Cos(To_Radiant(teta+Angles(3)))/53.0,ListaCoord(3)(2)+d*Sin(To_Radiant(teta+Angles(3)))/53.0);
            ListaCoord(5):= (ListaCoord(4)(1)+sqrt(2.0)*d*Cos(To_Radiant(teta+Angles(4)))/53.0,ListaCoord(4)(2)+sqrt(2.0)*d*Sin(To_Radiant(teta+Angles(4)))/53.0);
            ListaCoord(6):= (ListaCoord(5)(1)+d*Cos(To_Radiant(teta+Angles(5)))/53.0,ListaCoord(5)(2)+d*Sin(To_Radiant(teta+Angles(5)))/53.0);
            ListaCoord(7):= (ListaCoord(6)(1)+1.5*sqrt(2.0)*d*Cos(To_Radiant(teta+Angles(6)))/53.0,ListaCoord(6)(2)+1.5*sqrt(2.0)*d*Sin(To_Radiant(teta+Angles(6)))/53.0);
            ListaCoord(8):= (ListaCoord(7)(1)+1.5*sqrt(2.0)*d*Cos(To_Radiant(teta+Angles(7)))/53.0,ListaCoord(7)(2)+1.5*sqrt(2.0)*d*Sin(To_Radiant(teta+Angles(7)))/53.0);
            ListaCoord(9):= (ListaCoord(8)(1)+d*Cos(To_Radiant(teta+Angles(8)))/53.0,ListaCoord(8)(2)+d*Sin(To_Radiant(teta+Angles(8)))/53.0);
            ListaCoord(10):= (ListaCoord(9)(1)+sqrt(2.0)*d*Cos(To_Radiant(teta+Angles(9)))/53.0,ListaCoord(9)(2)+sqrt(2.0)*d*Sin(To_Radiant(teta+Angles(9)))/53.0);
            ListaCoord(11):= (ListaCoord(10)(1)+d*Cos(To_Radiant(teta+Angles(10)))/53.0,ListaCoord(10)(2)+d*Sin(To_Radiant(teta+Angles(10)))/53.0);
            ListaCoord(12):= (ListaCoord(11)(1)+d*Cos(To_Radiant(teta+Angles(11)))/53.0,ListaCoord(11)(2)+d*Sin(To_Radiant(teta+Angles(11)))/53.0);

            HaFunz:=Make_The_File(ListaCoord);
         when 2=>
            ListaCoord(1) := origin;
            x:= To_Degree(Arcsin(Sin(To_Radiant(ListaCoord(1)(1)))*Cos(d/r)+Cos(To_Radiant(ListaCoord(1)(1)))*Sin(d/r)*Cos(To_Radiant(teta+Angles(1)))));
            y:= ListaCoord(1)(2) + To_Degree(Arctan((Sin(To_Radiant(teta+Angles(1)))*Sin(d/r)*Cos(To_Radiant(ListaCoord(1)(1))))/(Cos(d/r)-Sin(To_Radiant(ListaCoord(1)(1)))*Sin(To_Radiant(x)))));
            ListaCoord(2) :=(x,y);
            x:= To_Degree(Arcsin(Sin(To_Radiant(ListaCoord(2)(1)))*Cos(d/r)+Cos(To_Radiant(ListaCoord(2)(1)))*Sin(d/r)*Cos(To_Radiant(teta+Angles(2)))));
            y:= ListaCoord(2)(2) + To_Degree(Arctan((Sin(To_Radiant(teta+Angles(2)))*Sin(d/r)*Cos(To_Radiant(ListaCoord(2)(1))))/(Cos(d/r)-Sin(To_Radiant(ListaCoord(2)(1)))*Sin(To_Radiant(x)))));
            ListaCoord(3) :=(x,y);
            x:= To_Degree(Arcsin(Sin(To_Radiant(ListaCoord(3)(1)))*Cos(d/r)+Cos(To_Radiant(ListaCoord(3)(1)))*Sin(d/r)*Cos(To_Radiant(teta+Angles(3)))));
            y:= ListaCoord(3)(2) + To_Degree(Arctan((Sin(To_Radiant(teta+Angles(3)))*Sin(d/r)*Cos(To_Radiant(ListaCoord(3)(1))))/(Cos(d/r)-Sin(To_Radiant(ListaCoord(3)(1)))*Sin(To_Radiant(x)))));
            ListaCoord(4) :=(x,y);
            x:= To_Degree(Arcsin(Sin(To_Radiant(ListaCoord(4)(1)))*Cos(sqrt(2.0)*d/r)+Cos(To_Radiant(ListaCoord(4)(1)))*Sin(sqrt(2.0)*d/r)*Cos(To_Radiant(teta+Angles(4)))));
            y:= ListaCoord(4)(2) + To_Degree(Arctan((Sin(To_Radiant(teta+Angles(4)))*Sin(sqrt(2.0)*d/r)*Cos(To_Radiant(ListaCoord(4)(1))))/(Cos(sqrt(2.0)*d/r)-Sin(To_Radiant(ListaCoord(4)(1)))*Sin(To_Radiant(x)))));
            ListaCoord(5) :=(x,y);
            x:= To_Degree(Arcsin(Sin(To_Radiant(ListaCoord(5)(1)))*Cos(d/r)+Cos(To_Radiant(ListaCoord(5)(1)))*Sin(d/r)*Cos(To_Radiant(teta+Angles(5)))));
            y:= ListaCoord(5)(2) + To_Degree(Arctan((Sin(To_Radiant(teta+Angles(5)))*Sin(d/r)*Cos(To_Radiant(ListaCoord(5)(1))))/(Cos(d/r)-Sin(To_Radiant(ListaCoord(5)(1)))*Sin(To_Radiant(x)))));
            ListaCoord(6) :=(x,y);
            x:= To_Degree(Arcsin(Sin(To_Radiant(ListaCoord(6)(1)))*Cos(1.5*sqrt(2.0)*d/r)+Cos(To_Radiant(ListaCoord(6)(1)))*Sin(1.5*sqrt(2.0)*d/r)*Cos(To_Radiant(teta+Angles(6)))));
            y:= ListaCoord(6)(2) + To_Degree(Arctan((Sin(To_Radiant(teta+Angles(6)))*Sin(1.5*sqrt(2.0)*d/r)*Cos(To_Radiant(ListaCoord(6)(1))))/(Cos(1.5*sqrt(2.0)*d/r)-Sin(To_Radiant(ListaCoord(6)(1)))*Sin(To_Radiant(x)))));
            ListaCoord(7) :=(x,y);
            x:= To_Degree(Arcsin(Sin(To_Radiant(ListaCoord(7)(1)))*Cos(1.5*sqrt(2.0)*d/r)+Cos(To_Radiant(ListaCoord(7)(1)))*Sin(1.5*sqrt(2.0)*d/r)*Cos(To_Radiant(teta+Angles(7)))));
            y:= ListaCoord(7)(2) + To_Degree(Arctan((Sin(To_Radiant(teta+Angles(7)))*Sin(1.5*sqrt(2.0)*d/r)*Cos(To_Radiant(ListaCoord(7)(1))))/(Cos(1.5*sqrt(2.0)*d/r)-Sin(To_Radiant(ListaCoord(7)(1)))*Sin(To_Radiant(x)))));
            ListaCoord(8) :=(x,y);
            x:= To_Degree(Arcsin(Sin(To_Radiant(ListaCoord(8)(1)))*Cos(d/r)+Cos(To_Radiant(ListaCoord(8)(1)))*Sin(d/r)*Cos(To_Radiant(teta+Angles(8)))));
            y:= ListaCoord(8)(2) + To_Degree(Arctan((Sin(To_Radiant(teta+Angles(8)))*Sin(d/r)*Cos(To_Radiant(ListaCoord(8)(1))))/(Cos(d/r)-Sin(To_Radiant(ListaCoord(8)(1)))*Sin(To_Radiant(x)))));
            ListaCoord(9) :=(x,y);
            x:= To_Degree(Arcsin(Sin(To_Radiant(ListaCoord(9)(1)))*Cos(sqrt(2.0)*d/r)+Cos(To_Radiant(ListaCoord(9)(1)))*Sin(sqrt(2.0)*d/r)*Cos(To_Radiant(teta+Angles(9)))));
            y:= ListaCoord(9)(2) + To_Degree(Arctan((Sin(To_Radiant(teta+Angles(9)))*Sin(sqrt(2.0)*d/r)*Cos(To_Radiant(ListaCoord(9)(1))))/(Cos(sqrt(2.0)*d/r)-Sin(To_Radiant(ListaCoord(9)(1)))*Sin(To_Radiant(x)))));
            ListaCoord(10) :=(x,y);
            x:= To_Degree(Arcsin(Sin(To_Radiant(ListaCoord(10)(1)))*Cos(d/r)+Cos(To_Radiant(ListaCoord(10)(1)))*Sin(d/r)*Cos(To_Radiant(teta+Angles(10)))));
            y:= ListaCoord(10)(2) + To_Degree(Arctan((Sin(To_Radiant(teta+Angles(10)))*Sin(d/r)*Cos(To_Radiant(ListaCoord(10)(1))))/(Cos(d/r)-Sin(To_Radiant(ListaCoord(10)(1)))*Sin(To_Radiant(x)))));
            ListaCoord(11) :=(x,y);
            x:= To_Degree(Arcsin(Sin(To_Radiant(ListaCoord(11)(1)))*Cos(d/r)+Cos(To_Radiant(ListaCoord(11)(1)))*Sin(d/r)*Cos(To_Radiant(teta+Angles(11)))));
            y:= ListaCoord(11)(2) + To_Degree(Arctan((Sin(To_Radiant(teta+Angles(11)))*Sin(d/r)*Cos(To_Radiant(ListaCoord(11)(1))))/(Cos(d/r)-Sin(To_Radiant(ListaCoord(11)(1)))*Sin(To_Radiant(x)))));
            ListaCoord(12) :=(x,y);
            HaFunz:=Make_The_File(ListaCoord);
         when 3=>
            ListaCoord(1) :=origin;
            U1 := Arctan((1.0-f)*Tan(To_Radiant(ListaCoord(1)(1))));
            sgma1 :=Arctan(Tan(U1)/Cos(To_Radiant(teta+Angles(1))));
            k := Cos(U1)*Sin(To_Radiant(teta+Angles(1)));
            u := Cos(1.0-k*k)*((a*a-b*b)/(b*b));
            e := 1.0+u/16384.0*(4096.0+u*(-768.0+u*(320.0-175.0*u)));
            g := u/1024.0*(256.0+u*(-128.0+u*(74.0-47.0*u)));
            sgma2 := d/(0.00062137*b*e);
            sgmam := 2.0*sgma1+sgma2;
            ListaCoord(2)(1) := To_Degree(Arctan((Sin(U1)*Cos(sgma2)+Cos(U1)*Sin(sgma2)*Cos(To_Radiant(teta+Angles(1))))/(1.0-f)*sqrt(k*k+(Sin(U1)*Sin(sgma2)-Cos(U1)*Cos(sgma2)*Cos(to_Radiant(teta+Angles(1))))*(Sin(U1)*Sin(sgma2)-Cos(U1)*Cos(sgma2)*Cos(To_Radiant(teta+Angles(1)))))));
            lambda := To_Degree(Arctan((Sin(sgma2)*Sin(To_Radiant(teta+Angles(1))))/(Cos(U1)*Cos(sgma2)-Sin(U1)*Sin(sgma2)*Cos(To_Radiant(teta+Angles(1))))));
            Ci := f/16.0*(1.0-k*k)*(4.0+f*(4.0-3.0*(1.0-k*k)));
            L := lambda - To_Degree((1.0 - Ci)*f*k*(sgma2+ Ci*Sin(sgma2)*(Cos(2.0*sgmam)+Ci*Cos(sgma2)*(-1.0+2.0*Cos(2.0*sgmam)*Cos(2.0*sgmam)))));
            ListaCoord(2)(2):= L+ListaCoord(1)(2);

            U1 := Arctan((1.0-f)*Tan(To_Radiant(ListaCoord(2)(1))));
            sgma1 :=Arctan(Tan(U1)/Cos(To_Radiant(teta+Angles(2))));
            k := Cos(U1)*Sin(To_Radiant(teta+Angles(2)));
            u := Cos(1.0-k*k)*((a*a-b*b)/(b*b));
            e := 1.0+u/16384.0*(4096.0+u*(-768.0+u*(320.0-175.0*u)));
            g := u/1024.0*(256.0+u*(-128.0+u*(74.0-47.0*u)));
            sgma2 := d/(0.00062137*b*e);
            sgmam := 2.0*sgma1+sgma2;
            ListaCoord(3)(1) := To_Degree(Arctan((Sin(U1)*Cos(sgma2)+Cos(U1)*Sin(sgma2)*Cos(To_Radiant(teta+Angles(2))))/(1.0-f)*sqrt(k*k+(Sin(U1)*Sin(sgma2)-Cos(U1)*Cos(sgma2)*Cos(to_Radiant(teta+Angles(2))))*(Sin(U1)*Sin(sgma2)-Cos(U1)*Cos(sgma2)*Cos(To_Radiant(teta+Angles(2)))))));
            lambda := To_Degree(Arctan((Sin(sgma2)*Sin(To_Radiant(teta+Angles(2))))/(Cos(U1)*Cos(sgma2)-Sin(U1)*Sin(sgma2)*Cos(To_Radiant(teta+Angles(2))))));
            Ci := f/16.0*(1.0-k*k)*(4.0+f*(4.0-3.0*(1.0-k*k)));
            L := lambda - To_Degree((1.0 - Ci)*f*k*(sgma2+ Ci*Sin(sgma2)*(Cos(2.0*sgmam)+Ci*Cos(sgma2)*(-1.0+2.0*Cos(2.0*sgmam)*Cos(2.0*sgmam)))));
            ListaCoord(3)(2):= L+ListaCoord(2)(2);

            U1 := Arctan((1.0-f)*Tan(To_Radiant(ListaCoord(3)(1))));
            sgma1 :=Arctan(Tan(U1)/Cos(To_Radiant(teta+Angles(3))));
            k := Cos(U1)*Sin(To_Radiant(teta+Angles(3)));
            u := Cos(1.0-k*k)*((a*a-b*b)/(b*b));
            e := 1.0+u/16384.0*(4096.0+u*(-768.0+u*(320.0-175.0*u)));
            g := u/1024.0*(256.0+u*(-128.0+u*(74.0-47.0*u)));
            sgma2 := d/(0.00062137*b*e);
            sgmam := 2.0*sgma1+sgma2;
            ListaCoord(4)(1) := To_Degree(Arctan((Sin(U1)*Cos(sgma2)+Cos(U1)*Sin(sgma2)*Cos(To_Radiant(teta+Angles(3))))/(1.0-f)*sqrt(k*k+(Sin(U1)*Sin(sgma2)-Cos(U1)*Cos(sgma2)*Cos(to_Radiant(teta+Angles(3))))*(Sin(U1)*Sin(sgma2)-Cos(U1)*Cos(sgma2)*Cos(To_Radiant(teta+Angles(3)))))));
            lambda := To_Degree(Arctan((Sin(sgma2)*Sin(To_Radiant(teta+Angles(3))))/(Cos(U1)*Cos(sgma2)-Sin(U1)*Sin(sgma2)*Cos(To_Radiant(teta+Angles(3))))));
            Ci := f/16.0*(1.0-k*k)*(4.0+f*(4.0-3.0*(1.0-k*k)));
            L := lambda - To_Degree((1.0 - Ci)*f*k*(sgma2+ Ci*Sin(sgma2)*(Cos(2.0*sgmam)+Ci*Cos(sgma2)*(-1.0+2.0*Cos(2.0*sgmam)*Cos(2.0*sgmam)))));
            ListaCoord(4)(2):= L+ListaCoord(3)(2);

            U1 := Arctan((1.0-f)*Tan(To_Radiant(ListaCoord(4)(1))));
            sgma1 :=Arctan(Tan(U1)/Cos(To_Radiant(teta+Angles(4))));
            k := Cos(U1)*Sin(To_Radiant(teta+Angles(4)));
            u := Cos(1.0-k*k)*((a*a-b*b)/(b*b));
            e := 1.0+u/16384.0*(4096.0+u*(-768.0+u*(320.0-175.0*u)));
            g := u/1024.0*(256.0+u*(-128.0+u*(74.0-47.0*u)));
            sgma2 := d*sqrt(2.0)/(0.00062137*b*e);
            sgmam := 2.0*sgma1+sgma2;
            ListaCoord(5)(1) := To_Degree(Arctan((Sin(U1)*Cos(sgma2)+Cos(U1)*Sin(sgma2)*Cos(To_Radiant(teta+Angles(4))))/(1.0-f)*sqrt(k*k+(Sin(U1)*Sin(sgma2)-Cos(U1)*Cos(sgma2)*Cos(to_Radiant(teta+Angles(4))))*(Sin(U1)*Sin(sgma2)-Cos(U1)*Cos(sgma2)*Cos(To_Radiant(teta+Angles(4)))))));
            lambda := To_Degree(Arctan((Sin(sgma2)*Sin(To_Radiant(teta+Angles(4))))/(Cos(U1)*Cos(sgma2)-Sin(U1)*Sin(sgma2)*Cos(To_Radiant(teta+Angles(4))))));
            Ci := f/16.0*(1.0-k*k)*(4.0+f*(4.0-3.0*(1.0-k*k)));
            L := lambda - To_Degree((1.0 - Ci)*f*k*(sgma2+ Ci*Sin(sgma2)*(Cos(2.0*sgmam)+Ci*Cos(sgma2)*(-1.0+2.0*Cos(2.0*sgmam)*Cos(2.0*sgmam)))));
            ListaCoord(5)(2):= L+ListaCoord(4)(2);

            U1 := Arctan((1.0-f)*Tan(To_Radiant(ListaCoord(5)(1))));
            sgma1 :=Arctan(Tan(U1)/Cos(To_Radiant(teta+Angles(5))));
            k := Cos(U1)*Sin(To_Radiant(teta+Angles(1)));
            u := Cos(1.0-k*k)*((a*a-b*b)/(b*b));
            e := 1.0+u/16384.0*(4096.0+u*(-768.0+u*(320.0-175.0*u)));
            g := u/1024.0*(256.0+u*(-128.0+u*(74.0-47.0*u)));
            sgma2 := d/(0.00062137*b*e);
            sgmam := 2.0*sgma1+sgma2;
            ListaCoord(6)(1) := To_Degree(Arctan((Sin(U1)*Cos(sgma2)+Cos(U1)*Sin(sgma2)*Cos(To_Radiant(teta+Angles(5))))/(1.0-f)*sqrt(k*k+(Sin(U1)*Sin(sgma2)-Cos(U1)*Cos(sgma2)*Cos(to_Radiant(teta+Angles(5))))*(Sin(U1)*Sin(sgma2)-Cos(U1)*Cos(sgma2)*Cos(To_Radiant(teta+Angles(5)))))));
            lambda := To_Degree(Arctan((Sin(sgma2)*Sin(To_Radiant(teta+Angles(5))))/(Cos(U1)*Cos(sgma2)-Sin(U1)*Sin(sgma2)*Cos(To_Radiant(teta+Angles(5))))));
            Ci := f/16.0*(1.0-k*k)*(4.0+f*(4.0-3.0*(1.0-k*k)));
            L := lambda - To_Degree((1.0 - Ci)*f*k*(sgma2+ Ci*Sin(sgma2)*(Cos(2.0*sgmam)+Ci*Cos(sgma2)*(-1.0+2.0*Cos(2.0*sgmam)*Cos(2.0*sgmam)))));
            ListaCoord(6)(2):= L+ListaCoord(5)(2);

            U1 := Arctan((1.0-f)*Tan(To_Radiant(ListaCoord(6)(1))));
            sgma1 :=Arctan(Tan(U1)/Cos(To_Radiant(teta+Angles(6))));
            k := Cos(U1)*Sin(To_Radiant(teta+Angles(6)));
            u := Cos(1.0-k*k)*((a*a-b*b)/(b*b));
            e := 1.0+u/16384.0*(4096.0+u*(-768.0+u*(320.0-175.0*u)));
            g := u/1024.0*(256.0+u*(-128.0+u*(74.0-47.0*u)));
            sgma2 := 1.5*sqrt(2.0)*d/(0.00062137*b*e);
            sgmam := 2.0*sgma1+sgma2;
            ListaCoord(7)(1) := To_Degree(Arctan((Sin(U1)*Cos(sgma2)+Cos(U1)*Sin(sgma2)*Cos(To_Radiant(teta+Angles(6))))/(1.0-f)*sqrt(k*k+(Sin(U1)*Sin(sgma2)-Cos(U1)*Cos(sgma2)*Cos(to_Radiant(teta+Angles(6))))*(Sin(U1)*Sin(sgma2)-Cos(U1)*Cos(sgma2)*Cos(To_Radiant(teta+Angles(6)))))));
            lambda := To_Degree(Arctan((Sin(sgma2)*Sin(To_Radiant(teta+Angles(6))))/(Cos(U1)*Cos(sgma2)-Sin(U1)*Sin(sgma2)*Cos(To_Radiant(teta+Angles(6))))));
            Ci := f/16.0*(1.0-k*k)*(4.0+f*(4.0-3.0*(1.0-k*k)));
            L := lambda - To_Degree((1.0 - Ci)*f*k*(sgma2+ Ci*Sin(sgma2)*(Cos(2.0*sgmam)+Ci*Cos(sgma2)*(-1.0+2.0*Cos(2.0*sgmam)*Cos(2.0*sgmam)))));
            ListaCoord(7)(2):= L+ListaCoord(6)(2);

            U1 := Arctan((1.0-f)*Tan(To_Radiant(ListaCoord(7)(1))));
            sgma1 :=Arctan(Tan(U1)/Cos(To_Radiant(teta+Angles(7))));
            k := Cos(U1)*Sin(To_Radiant(teta+Angles(7)));
            u := Cos(1.0-k*k)*((a*a-b*b)/(b*b));
            e := 1.0+u/16384.0*(4096.0+u*(-768.0+u*(320.0-175.0*u)));
            g := u/1024.0*(256.0+u*(-128.0+u*(74.0-47.0*u)));
            sgma2 := 1.5*sqrt(2.0)*d/(0.00062137*b*e);
            sgmam := 2.0*sgma1+sgma2;
            ListaCoord(8)(1) := To_Degree(Arctan((Sin(U1)*Cos(sgma2)+Cos(U1)*Sin(sgma2)*Cos(To_Radiant(teta+Angles(7))))/(1.0-f)*sqrt(k*k+(Sin(U1)*Sin(sgma2)-Cos(U1)*Cos(sgma2)*Cos(to_Radiant(teta+Angles(7))))*(Sin(U1)*Sin(sgma2)-Cos(U1)*Cos(sgma2)*Cos(To_Radiant(teta+Angles(7)))))));
            lambda := To_Degree(Arctan((Sin(sgma2)*Sin(To_Radiant(teta+Angles(7))))/(Cos(U1)*Cos(sgma2)-Sin(U1)*Sin(sgma2)*Cos(To_Radiant(teta+Angles(7))))));
            Ci := f/16.0*(1.0-k*k)*(4.0+f*(4.0-3.0*(1.0-k*k)));
            L := lambda - To_Degree((1.0 - Ci)*f*k*(sgma2+ Ci*Sin(sgma2)*(Cos(2.0*sgmam)+Ci*Cos(sgma2)*(-1.0+2.0*Cos(2.0*sgmam)*Cos(2.0*sgmam)))));
            ListaCoord(8)(2):= L+ListaCoord(7)(2);

            U1 := Arctan((1.0-f)*Tan(To_Radiant(ListaCoord(8)(1))));
            sgma1 :=Arctan(Tan(U1)/Cos(To_Radiant(teta+Angles(8))));
            k := Cos(U1)*Sin(To_Radiant(teta+Angles(8)));
            u := Cos(1.0-k*k)*((a*a-b*b)/(b*b));
            e := 1.0+u/16384.0*(4096.0+u*(-768.0+u*(320.0-175.0*u)));
            g := u/1024.0*(256.0+u*(-128.0+u*(74.0-47.0*u)));
            sgma2 := d/(0.00062137*b*e);
            sgmam := 2.0*sgma1+sgma2;
            ListaCoord(9)(1) := To_Degree(Arctan((Sin(U1)*Cos(sgma2)+Cos(U1)*Sin(sgma2)*Cos(To_Radiant(teta+Angles(8))))/(1.0-f)*sqrt(k*k+(Sin(U1)*Sin(sgma2)-Cos(U1)*Cos(sgma2)*Cos(to_Radiant(teta+Angles(8))))*(Sin(U1)*Sin(sgma2)-Cos(U1)*Cos(sgma2)*Cos(To_Radiant(teta+Angles(8)))))));
            lambda := To_Degree(Arctan((Sin(sgma2)*Sin(To_Radiant(teta+Angles(8))))/(Cos(U1)*Cos(sgma2)-Sin(U1)*Sin(sgma2)*Cos(To_Radiant(teta+Angles(8))))));
            Ci := f/16.0*(1.0-k*k)*(4.0+f*(4.0-3.0*(1.0-k*k)));
            L := lambda - To_Degree((1.0 - Ci)*f*k*(sgma2+ Ci*Sin(sgma2)*(Cos(2.0*sgmam)+Ci*Cos(sgma2)*(-1.0+2.0*Cos(2.0*sgmam)*Cos(2.0*sgmam)))));
            ListaCoord(9)(2):= L+ListaCoord(8)(2);

            U1 := Arctan((1.0-f)*Tan(To_Radiant(ListaCoord(9)(1))));
            sgma1 :=Arctan(Tan(U1)/Cos(To_Radiant(teta+Angles(9))));
            k := Cos(U1)*Sin(To_Radiant(teta+Angles(9)));
            u := Cos(1.0-k*k)*((a*a-b*b)/(b*b));
            e := 1.0+u/16384.0*(4096.0+u*(-768.0+u*(320.0-175.0*u)));
            g := u/1024.0*(256.0+u*(-128.0+u*(74.0-47.0*u)));
            sgma2 := sqrt(2.0)*d/(0.00062137*b*e);
            sgmam := 2.0*sgma1+sgma2;
            ListaCoord(10)(1) := To_Degree(Arctan((Sin(U1)*Cos(sgma2)+Cos(U1)*Sin(sgma2)*Cos(To_Radiant(teta+Angles(9))))/(1.0-f)*sqrt(k*k+(Sin(U1)*Sin(sgma2)-Cos(U1)*Cos(sgma2)*Cos(to_Radiant(teta+Angles(9))))*(Sin(U1)*Sin(sgma2)-Cos(U1)*Cos(sgma2)*Cos(To_Radiant(teta+Angles(9)))))));
            lambda := To_Degree(Arctan((Sin(sgma2)*Sin(To_Radiant(teta+Angles(9))))/(Cos(U1)*Cos(sgma2)-Sin(U1)*Sin(sgma2)*Cos(To_Radiant(teta+Angles(9))))));
            Ci := f/16.0*(1.0-k*k)*(4.0+f*(4.0-3.0*(1.0-k*k)));
            L := lambda - To_Degree((1.0 - Ci)*f*k*(sgma2+ Ci*Sin(sgma2)*(Cos(2.0*sgmam)+Ci*Cos(sgma2)*(-1.0+2.0*Cos(2.0*sgmam)*Cos(2.0*sgmam)))));
            ListaCoord(10)(2):= L+ListaCoord(9)(2);

            U1 := Arctan((1.0-f)*Tan(To_Radiant(ListaCoord(10)(1))));
            sgma1 :=Arctan(Tan(U1)/Cos(To_Radiant(teta+Angles(10))));
            k := Cos(U1)*Sin(To_Radiant(teta+Angles(10)));
            u := Cos(1.0-k*k)*((a*a-b*b)/(b*b));
            e := 1.0+u/16384.0*(4096.0+u*(-768.0+u*(320.0-175.0*u)));
            g := u/1024.0*(256.0+u*(-128.0+u*(74.0-47.0*u)));
            sgma2 := d/(0.00062137*b*e);
            sgmam := 2.0*sgma1+sgma2;
            ListaCoord(11)(1) := To_Degree(Arctan((Sin(U1)*Cos(sgma2)+Cos(U1)*Sin(sgma2)*Cos(To_Radiant(teta+Angles(10))))/(1.0-f)*sqrt(k*k+(Sin(U1)*Sin(sgma2)-Cos(U1)*Cos(sgma2)*Cos(to_Radiant(teta+Angles(10))))*(Sin(U1)*Sin(sgma2)-Cos(U1)*Cos(sgma2)*Cos(To_Radiant(teta+Angles(10)))))));
            lambda := To_Degree(Arctan((Sin(sgma2)*Sin(To_Radiant(teta+Angles(10))))/(Cos(U1)*Cos(sgma2)-Sin(U1)*Sin(sgma2)*Cos(To_Radiant(teta+Angles(10))))));
            Ci := f/16.0*(1.0-k*k)*(4.0+f*(4.0-3.0*(1.0-k*k)));
            L := lambda - To_Degree((1.0 - Ci)*f*k*(sgma2+ Ci*Sin(sgma2)*(Cos(2.0*sgmam)+Ci*Cos(sgma2)*(-1.0+2.0*Cos(2.0*sgmam)*Cos(2.0*sgmam)))));
            ListaCoord(11)(2):= L+ListaCoord(10)(2);

            U1 := Arctan((1.0-f)*Tan(To_Radiant(ListaCoord(11)(1))));
            sgma1 :=Arctan(Tan(U1)/Cos(To_Radiant(teta+Angles(11))));
            k := Cos(U1)*Sin(To_Radiant(teta+Angles(11)));
            u := Cos(1.0-k*k)*((a*a-b*b)/(b*b));
            e := 1.0+u/16384.0*(4096.0+u*(-768.0+u*(320.0-175.0*u)));
            g := u/1024.0*(256.0+u*(-128.0+u*(74.0-47.0*u)));
            sgma2 := d/(0.00062137*b*e);
            sgmam := 2.0*sgma1+sgma2;
            ListaCoord(12)(1) := To_Degree(Arctan((Sin(U1)*Cos(sgma2)+Cos(U1)*Sin(sgma2)*Cos(To_Radiant(teta+Angles(11))))/(1.0-f)*sqrt(k*k+(Sin(U1)*Sin(sgma2)-Cos(U1)*Cos(sgma2)*Cos(to_Radiant(teta+Angles(11))))*(Sin(U1)*Sin(sgma2)-Cos(U1)*Cos(sgma2)*Cos(To_Radiant(teta+Angles(11)))))));
            lambda := To_Degree(Arctan((Sin(sgma2)*Sin(To_Radiant(teta+Angles(11))))/(Cos(U1)*Cos(sgma2)-Sin(U1)*Sin(sgma2)*Cos(To_Radiant(teta+Angles(11))))));
            Ci := f/16.0*(1.0-k*k)*(4.0+f*(4.0-3.0*(1.0-k*k)));
            L := lambda - To_Degree((1.0 - Ci)*f*k*(sgma2+ Ci*Sin(sgma2)*(Cos(2.0*sgmam)+Ci*Cos(sgma2)*(-1.0+2.0*Cos(2.0*sgmam)*Cos(2.0*sgmam)))));
            ListaCoord(12)(2):= L +ListaCoord(11)(2);

            HaFunz:=Make_The_File(ListaCoord);
         when others => New_Line;
      end case;

   end if;



end Main;
