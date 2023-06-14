with Ada.Numerics;
with Ada.Text_IO;
with Ada.Float_Text_IO;
with Lista;
use Lista;
use Ada.Text_IO;
use Ada.Float_Text_IO;
package body Utility is

   function To_Radiant (x: Float) return Float is
     
     y:Float;
   
   begin
      y:=x/360.0 *2.0*Ada.Numerics.Pi;
      return y;
   end To_Radiant;
   
   
   function Make_The_File(Coords: Lista.Float_Matrix) return Boolean is
      File_Name: String:= "coordinate.kml";
      str1: constant String:= "<?xml version=""1.0"" encoding=""UTF-8""?>";
      str2: constant String:= "<kml xmlns=""http://www.opengis.net/kml/2.2"">";
      KML_File : Ada.Text_IO.File_Type;
   begin
      Ada.Text_IO.Create (File => KML_File, Mode => Ada.Text_IO.Out_File, Name => File_Name);
      Ada.Text_IO.Put_Line (KML_File, str1);
      Ada.Text_IO.Put_Line (KML_File, str2);
      Ada.Text_IO.Put_Line (KML_File, "<Document>");

      for I in Coords'Range loop
         Ada.Text_IO.Put_Line (KML_File, "      <Placemark>");
         Ada.Text_IO.Put_Line (KML_File, "         <name>" & Integer'Image(I) & "</name>");
         Ada.Text_IO.Put_Line (KML_File, "            <Point>");
         Ada.Text_IO.Put_Line (KML_File, "               <coordinates> " & Float'Image(Coords(I)(2)) &"," & Float'Image(Coords(I)(1)) &","& "5000" & " </coordinates>");
         Ada.Text_IO.Put_Line (KML_File, "            </Point>");
         Ada.Text_IO.Put_Line (KML_File, "      </Placemark>");
      end loop;
      Ada.Text_IO.Put_Line (KML_File, "      <Placemark>");
      Ada.Text_IO.Put_Line (KML_File, "         <name>" & "Path" & "</name>");
      Ada.Text_IO.Put_Line (KML_File, "            <LineString>");
      Ada.Text_IO.Put_Line (KML_File, "               <coordinates>");
      Put(KML_File, "               ");
      for I in Coords'Range loop
         Ada.Float_Text_IO.Put(KML_File, Coords(I)(2), Aft=>6,Fore=>0);
         Put(KML_File,",");
         Ada.Float_Text_IO.Put (KML_File,Coords(I)(1), Aft=>6,Fore=>0);
         Put(KML_File,",5000 ");
      end loop;
      Ada.Text_IO.Put_Line (KML_File, "               </coordinates>");
      Ada.Text_IO.Put_Line (KML_File, "            </LineString>");
      Ada.Text_IO.Put_Line (KML_File, "      </Placemark>");
      Ada.Text_IO.Put_Line (KML_File, "</Document>");
      Ada.Text_IO.Put_Line (KML_File, "</kml>");

      Ada.Text_IO.Close (KML_File);
      return True;
   end Make_The_File;
   
   function To_Degree(x:Float) return Float is
      y: Float;
   begin
      y:=x*360.0 /(2.0*Ada.Numerics.Pi);
      return y;
   end To_Degree;
   
   
   
end Utility;
