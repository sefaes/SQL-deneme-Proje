#include <iostream>
#include <stdio.h>
#include <string>
#include <windows.h>
#include "include/mysql.h"
#include <sstream>
#include <string>
using namespace std;



int main()
{
    MYSQL* conn;
    MYSQL_ROW row;
    MYSQL_RES *res;
    int qstate;
    int status = 0;

    conn = mysql_init(0);
    /*if (con == NULL)
    {
      fprintf(stderr, "%s\n", mysql_error(con));
      exit(1);
    }

    if (mysql_real_connect(con, "localhost", "root", "",NULL, 0, NULL, 0) == NULL)
     {
      fprintf(stderr, "%s\n", mysql_error(conn));
      mysql_close(conn);
      exit(1);
     }

     if (mysql_query(conn, "CREATE DATABASE prolab"))
     {
      fprintf(stderr, "%s\n", mysql_error(conn));
      mysql_close(conn);
      exit(1);
     }*/

    if(conn)
        cout<<"Baglanti tamamlandi, conn="<<conn<<endl;
    else
        cout<<"Baglanti Hatasi: "<<mysql_error(conn);

    conn = mysql_real_connect(conn,"localhost","root","","prolab",0,NULL,0);

    if(conn)
    {

       cout<<"Baglanilan database=Prolab"<<endl;
       /*mysql_query(conn, "DROP TABLE IF EXISTS Ilan");
       mysql_query(conn, "DROP TABLE IF EXISTS Araba");
       mysql_query(conn, "DROP TABLE IF EXISTS YakitTuru");
       mysql_query(conn, "DROP TABLE IF EXISTS VitesTuru");
       mysql_query(conn, "DROP TABLE IF EXISTS Renk");
       mysql_query(conn, "DROP TABLE IF EXISTS Sehir");*/
       mysql_query(conn, "CREATE TABLE Ilan(IlanID MEDIUMINT NOT NULL AUTO_INCREMENT PRIMARY KEY , Adi  TEXT, Fiyat INT NOT NULL, Km INT,Tarih INT,ArabaID INT  ,SehirID INT) ");
       mysql_query(conn, "CREATE TABLE Araba(ArabaID MEDIUMINT NOT NULL AUTO_INCREMENT PRIMARY KEY   , Marka TEXT, Model TEXT, VitesTuruID INT ,YakitTuruID INT ,RenkID INT  )");
       mysql_query(conn, "CREATE TABLE YakitTuru(YakitTuruID MEDIUMINT NOT NULL AUTO_INCREMENT PRIMARY KEY  ,Yakit_Turu TEXT)");
       mysql_query(conn, "CREATE TABLE VitesTuru(VitesTuruID MEDIUMINT NOT NULL AUTO_INCREMENT PRIMARY KEY  ,Vites_Turu TEXT)");
       mysql_query(conn, "CREATE TABLE Renk(RenkID MEDIUMINT NOT NULL AUTO_INCREMENT PRIMARY KEY  ,Renk TEXT)");
       mysql_query(conn, "CREATE TABLE Sehir(SehirID MEDIUMINT NOT NULL AUTO_INCREMENT PRIMARY KEY ,Sehir TEXT)");

int y;
cout<<"\n1-Kayit ekleme,silme,guncelleme"<<endl;
cout<<"2-Filtreleme"<<endl;

cin>>y;

if(y==1){
  int i=1;
   while(i!=0){

      cout<<"\n1-Yeni ilan Tanimlama"<<endl;
      cout<<"2-Ilan Silme"<<endl;
      cout<<"3-Ilan Guncelleme"<<endl;
      cout<<"\nSecim Yapiniz(Cikis=0): ";

       cin>>i;
       printf("\n");


 if(i==1){
     string Adi,Fiyat,Km,Tarih,Marka,Model,Yakit_Turu,Vites_Turu,Renk,Sehir;

         cout<<"Adi: "; cin>>Adi;
         cout<<"Fiyati: "; cin>>Fiyat;
         cout<<"KMsi: "; cin>>Km;
         cout<<"Tarih(11052018): "; cin>>Tarih;
         cout<<"Markasi: "; cin>>Marka;
         cout<<"Modeli: "; cin>>Model;
         cout<<"yakit turu: "; cin>>Yakit_Turu;
         cout<<"vites turu: "; cin>>Vites_Turu;
         cout<<"Rengi: "; cin>>Renk;
         cout<<"Sehiri: "; cin>>Sehir;
int g=0;
char d[50];
itoa(g,d,10);
string query="insert into Ilan(Adi,Fiyat,Km,Tarih,ArabaID,SehirID) values('"+Adi+"','"+Fiyat+"','"+Km+"','"+Tarih+"','"+d+"','"+d+"')";

const char* q = query.c_str();
            qstate = mysql_query(conn,q);
            if(!qstate)
                cout<<"Tanimlama Basarili..."<<endl;
            else
                cout<<"Basarisiz islem: "<<mysql_error(conn)<<endl;



string query1="insert into Araba(Marka,Model,VitesTuruID,YakitTuruID,RenkID) values('"+Marka+"','"+Model+"','"+d+"','"+d+"','"+d+"')";


const char* q1 = query1.c_str();
            qstate = mysql_query(conn,q1);
            if(!qstate)
                cout<<"Tanimlama Basarili..."<<endl;
            else
                cout<<"Basarisiz islem: "<<mysql_error(conn)<<endl;

string query2="insert into YakitTuru(Yakit_Turu) values('"+Yakit_Turu+"')";

 const char* q2 = query2.c_str();
            qstate = mysql_query(conn,q2);
            if(!qstate)
                cout<<"Tanimlama Basarili..."<<endl;
            else
                cout<<"Basarisiz islem: "<<mysql_error(conn)<<endl;


 string query3="insert into VitesTuru(Vites_Turu) values('"+Vites_Turu+"')";

 const char* q3 = query3.c_str();
            qstate = mysql_query(conn,q3);
            if(!qstate)
                cout<<"Tanimlama Basarili..."<<endl;
            else
                cout<<"Basarisiz islem: "<<mysql_error(conn)<<endl;


string query4="insert into Renk(Renk) values('"+Renk+"')";

const char* q4 = query4.c_str();
            qstate = mysql_query(conn,q4);
            if(!qstate)
                cout<<"Tanimlama Basarili..."<<endl;
            else
                cout<<"Basarisiz islem: "<<mysql_error(conn)<<endl;

string query5="insert into Sehir(Sehir) values('"+Sehir+"')";

const char* q5 = query5.c_str();
            qstate = mysql_query(conn,q5);
            if(!qstate)
                cout<<"Tanimlama Basarili..."<<endl;
            else
                cout<<"Basarisiz islem: "<<mysql_error(conn)<<endl;


 string query6="UPDATE Ilan SET ArabaID=IlanID WHERE ArabaID=0 ";
 const char* q6 = query6.c_str();
           qstate = mysql_query(conn,q6);
string query7="UPDATE Ilan SET SehirID=IlanID WHERE SehirID=0 ";
 const char* q7 = query7.c_str();
           qstate = mysql_query(conn,q7);

string query8="UPDATE Araba SET VitesTuruID=ArabaID WHERE VitesTuruID=0 ";
 const char* q8 = query8.c_str();
           qstate = mysql_query(conn,q8);
string query9="UPDATE Araba SET YakitTuruID=ArabaID WHERE YakitTuruID=0 ";
 const char* q9 = query9.c_str();
           qstate = mysql_query(conn,q9);

string query10="UPDATE Araba SET RenkID=ArabaID WHERE RenkID=0 ";
 const char* q10 = query10.c_str();
           qstate = mysql_query(conn,q10);

 }

else if(i==2){

      string id;
     cout<<"Ilanid Giriniz: "; cin>>id;
     string query="DELETE FROM Ilan WHERE IlanID='"+id+"'";
const char* q = query.c_str();
           qstate = mysql_query(conn,q);
string query5="DELETE FROM Araba WHERE ArabaID='"+id+"'";
const char* q5 = query5.c_str();
           qstate = mysql_query(conn,q5);
string query10="DELETE FROM YakitTuru WHERE YakitTuruID='"+id+"'";
const char* q10 = query10.c_str();
           qstate = mysql_query(conn,q10);
string query12="DELETE FROM VitesTuru WHERE VitesTuruID='"+id+"'";
const char* q12 = query12.c_str();
           qstate = mysql_query(conn,q12);
string query14="DELETE FROM Renk WHERE RenkID='"+id+"'";
const char* q14 = query14.c_str();
           qstate = mysql_query(conn,q14);
string query15="DELETE FROM Sehir WHERE SehirID='"+id+"'";
const char* q15 = query15.c_str();
           qstate = mysql_query(conn,q15);
string query16="UPDATE Renk SET RenkID=RenkID-1 WHERE RenkID>'"+id+"' ";
 const char* q16 = query16.c_str();
           qstate = mysql_query(conn,q16);
string query17="UPDATE Sehir SET SehirID=SehirID-1 WHERE SehirID>'"+id+"' ";
 const char* q17 = query17.c_str();
           qstate = mysql_query(conn,q17);
string query13="UPDATE VitesTuru SET VitesTuruID=VitesTuruID-1 WHERE VitesTuruID>'"+id+"' ";
 const char* q13 = query13.c_str();
           qstate = mysql_query(conn,q13);
string query11="UPDATE YakitTuru SET YakitTuruID=YakitTuruID-1 WHERE YakitTuruID>'"+id+"' ";
 const char* q11 = query11.c_str();
           qstate = mysql_query(conn,q11);
string query2="UPDATE Ilan SET IlanID=IlanID-1 WHERE IlanID>'"+id+"' ";
 const char* q2 = query2.c_str();
           qstate = mysql_query(conn,q2);
string query3="UPDATE Ilan SET ArabaID=ArabaID-1 WHERE ArabaID>'"+id+"' ";
 const char* q3 = query3.c_str();
           qstate = mysql_query(conn,q3);
string query4="UPDATE Ilan SET SehirID=SehirID-1 WHERE SehirID>'"+id+"' ";
 const char* q4 = query4.c_str();
           qstate = mysql_query(conn,q4);
string query6="UPDATE Araba SET ArabaID=ArabaID-1 WHERE ArabaID>'"+id+"' ";
 const char* q6 = query6.c_str();
           qstate = mysql_query(conn,q6);
string query7="UPDATE Araba SET VitesTuruID=VitesTuruID-1 WHERE VitesTuruID>'"+id+"' ";
 const char* q7 = query7.c_str();
           qstate = mysql_query(conn,q7);
string query8="UPDATE Araba SET YakitTuruID=YakitTuruID-1 WHERE YakitTuruID>'"+id+"' ";
 const char* q8 = query8.c_str();
           qstate = mysql_query(conn,q8);
string query9="UPDATE Araba SET RenkID=RenkID-1 WHERE RenkID>'"+id+"' ";
 const char* q9 = query9.c_str();
           qstate = mysql_query(conn,q9);


}

if(i==3){

     int v;
     string m;
    printf("1-adi\n");
    printf("2-Fiyat\n");
    printf("3-KM\n");
    printf("4-Tarih\n");
    printf("5-Marka\n");
    printf("6-Model\n");
    printf("7-vites turu\n");
    printf("8-yakit turu\n");
    printf("9-renk\n");
    printf("10-sehir\n");

     cout<<"Guncellemek istediginiz yeri seciniz: "; cin>>v;
    cout<<"Guncellemek istediginiz Ilanidyi seciniz: "; cin>>m;


    if(v==1){
      string yenad;
       cout<<"yeni adi giriniz: "; cin>>yenad;
     string query1="UPDATE Ilan SET Adi='"+yenad+"'  WHERE IlanID='"+m+"' ";
 const char* q1 = query1.c_str();
           qstate = mysql_query(conn,q1);
}
if(v==2){
     string yenfy;
       cout<<"yeni fiyati giriniz: "; cin>>yenfy;
     string query1="UPDATE Ilan SET Fiyat='"+yenfy+"'  WHERE IlanID='"+m+"' ";
 const char* q1 = query1.c_str();
           qstate = mysql_query(conn,q1);

}
    if(v==3){
string yenkm;
       cout<<"yeni KM giriniz: "; cin>>yenkm;
     string query1="UPDATE Ilan SET Km='"+yenkm+"'  WHERE IlanID='"+m+"' ";
 const char* q1 = query1.c_str();
           qstate = mysql_query(conn,q1);
}
if(v==4){
    string yentrh;
       cout<<"yeni Tarih giriniz: "; cin>>yentrh;
     string query1="UPDATE Ilan SET Tarih='"+yentrh+"'  WHERE IlanID='"+m+"' ";
 const char* q1 = query1.c_str();
           qstate = mysql_query(conn,q1);
}
if(v==5){
string yenmrk;
       cout<<"yeni Marka giriniz: "; cin>>yenmrk;
     string query1="UPDATE Araba SET Marka='"+yenmrk+"'  WHERE ArabaID='"+m+"' ";
 const char* q1 = query1.c_str();
           qstate = mysql_query(conn,q1);
}
if(v==6){
string yenmdl;
       cout<<"yeni Model giriniz: "; cin>>yenmdl;
     string query1="UPDATE Araba SET Model='"+yenmdl+"'  WHERE ArabaID='"+m+"' ";
 const char* q1 = query1.c_str();
           qstate = mysql_query(conn,q1);
}
if(v==7){
string yenvts;
       cout<<"yeni Vitesturu giriniz: "; cin>>yenvts;
     string query1="UPDATE VitesTuru SET Vites_Turu='"+yenvts+"'  WHERE VitesTuruID='"+m+"' ";
 const char* q1 = query1.c_str();
           qstate = mysql_query(conn,q1);
}
if(v==8){
string yenykt;
       cout<<"yeni yakitturu giriniz: "; cin>>yenykt;
     string query1="UPDATE YakitTuru SET Yakit_Turu='"+yenykt+"'  WHERE YakitTuruID='"+m+"' ";
 const char* q1 = query1.c_str();
           qstate = mysql_query(conn,q1);
}
if(v==9){
string yenrenk;
       cout<<"yeni renk giriniz: "; cin>>yenrenk;
     string query1="UPDATE Renk SET Renk='"+yenrenk+"'  WHERE RenkID='"+m+"' ";
 const char* q1 = query1.c_str();
           qstate = mysql_query(conn,q1);
}
if(v==10){
string yenshr;
       cout<<"yeni sehir giriniz: "; cin>>yenshr;
     string query1="UPDATE Sehir SET Sehir='"+yenshr+"'  WHERE SehirID='"+m+"' ";
 const char* q1 = query1.c_str();
           qstate = mysql_query(conn,q1);



}


}





   }

}

    if(y==2){ //filtreleme

     int t;
    cout<<"\n1-Siralama (artan,azalan)"<<endl;
    cout<<"2-Filtreleme"<<endl;
    cin>>t;

    if(t==1){

    printf("1-Fiyat\n");
    printf("2-KM\n");
    printf("3-Tarih\n");
    printf("4-vites turu\n");
    printf("5-yakit turu\n");
    printf("6-renk\n");
    printf("7-sehir\n");

 int r;
    cout<<"\n1-Siralama seciniz"<<endl;
   cin>>r;

if(r==1){
int q;
cout<<"\n1-artan"<<endl;
cout<<"2-azalan"<<endl;
   cin>>q;

if(q==1){
string query="SELECT * FROM Ilan ORDER BY Fiyat";
            const char* q = query.c_str();
            qstate = mysql_query(conn,q);
            MYSQL_RES *result = mysql_store_result(conn);
            int num_fields = mysql_num_fields(result);
            while ((row = mysql_fetch_row(result)))
{
   unsigned long *lengths;
   lengths = mysql_fetch_lengths(result);
   for(int i = 0; i < num_fields; i++)
   {
       printf("[%.*s] ", (int) lengths[i],
              row[i] ? row[i] : "NULL");
   }
   printf("\n");
}
}

if(q==2){
string query="SELECT * FROM Ilan ORDER BY Fiyat DESC";
            const char* q = query.c_str();
            qstate = mysql_query(conn,q);
            MYSQL_RES *result = mysql_store_result(conn);
            int num_fields = mysql_num_fields(result);
            while ((row = mysql_fetch_row(result)))
{
   unsigned long *lengths;
   lengths = mysql_fetch_lengths(result);
   for(int i = 0; i < num_fields; i++)
   {
       printf("[%.*s] ", (int) lengths[i],
              row[i] ? row[i] : "NULL");
   }
   printf("\n");
}
}



}


if(r==2){
int q;
cout<<"\n1-artan"<<endl;
cout<<"2-azalan"<<endl;
   cin>>q;

if(q==1){
string query="SELECT * FROM Ilan ORDER BY Km";
            const char* q = query.c_str();
            qstate = mysql_query(conn,q);
            MYSQL_RES *result = mysql_store_result(conn);
            int num_fields = mysql_num_fields(result);
            while ((row = mysql_fetch_row(result)))
{
   unsigned long *lengths;
   lengths = mysql_fetch_lengths(result);
   for(int i = 0; i < num_fields; i++)
   {
       printf("[%.*s] ", (int) lengths[i],
              row[i] ? row[i] : "NULL");
   }
   printf("\n");
}
}


if(q==2){
string query="SELECT * FROM Ilan ORDER BY Km DESC";
            const char* q = query.c_str();
            qstate = mysql_query(conn,q);
            MYSQL_RES *result = mysql_store_result(conn);
            int num_fields = mysql_num_fields(result);
            while ((row = mysql_fetch_row(result)))
{
   unsigned long *lengths;
   lengths = mysql_fetch_lengths(result);
   for(int i = 0; i < num_fields; i++)
   {
       printf("[%.*s] ", (int) lengths[i],
              row[i] ? row[i] : "NULL");
   }
   printf("\n");
}
}





}

if(r==3){
   int q;
cout<<"\n1-artan"<<endl;
cout<<"2-azalan"<<endl;
   cin>>q;

if(q==1){
string query="SELECT * FROM Ilan ORDER BY Tarih";
            const char* q = query.c_str();
            qstate = mysql_query(conn,q);
            MYSQL_RES *result = mysql_store_result(conn);
            int num_fields = mysql_num_fields(result);
            while ((row = mysql_fetch_row(result)))
{
   unsigned long *lengths;
   lengths = mysql_fetch_lengths(result);
   for(int i = 0; i < num_fields; i++)
   {
       printf("[%.*s] ", (int) lengths[i],
              row[i] ? row[i] : "NULL");
   }
   printf("\n");
}
}


if(q==2){
string query="SELECT * FROM Ilan ORDER BY Tarih DESC";
            const char* q = query.c_str();
            qstate = mysql_query(conn,q);
            MYSQL_RES *result = mysql_store_result(conn);
            int num_fields = mysql_num_fields(result);
            while ((row = mysql_fetch_row(result)))
{
   unsigned long *lengths;
   lengths = mysql_fetch_lengths(result);
   for(int i = 0; i < num_fields; i++)
   {
       printf("[%.*s] ", (int) lengths[i],
              row[i] ? row[i] : "NULL");
   }
   printf("\n");
}
}


}

if(r==4){

    int q;
cout<<"\n1-adan zye"<<endl;
cout<<"2-zden aya"<<endl;
   cin>>q;

if(q==1){
string query="SELECT * FROM VitesTuru ORDER BY Vites_Turu";
            const char* q = query.c_str();
            qstate = mysql_query(conn,q);
            MYSQL_RES *result = mysql_store_result(conn);
            int num_fields = mysql_num_fields(result);
            while ((row = mysql_fetch_row(result)))
{
   unsigned long *lengths;
   lengths = mysql_fetch_lengths(result);
   for(int i = 0; i < num_fields; i++)
   {
       printf("[%.*s] ", (int) lengths[i],
              row[i] ? row[i] : "NULL");
   }
   printf("\n");
}
}


if(q==2){
string query="SELECT * FROM VitesTuru ORDER BY Vites_Turu DESC";
            const char* q = query.c_str();
            qstate = mysql_query(conn,q);
            MYSQL_RES *result = mysql_store_result(conn);
            int num_fields = mysql_num_fields(result);
            while ((row = mysql_fetch_row(result)))
{
   unsigned long *lengths;
   lengths = mysql_fetch_lengths(result);
   for(int i = 0; i < num_fields; i++)
   {
       printf("[%.*s] ", (int) lengths[i],
              row[i] ? row[i] : "NULL");
   }
   printf("\n");
}
}





}


if(r==5){

     int q;
cout<<"\n1-adan zye"<<endl;
cout<<"2-zden aya"<<endl;
   cin>>q;

if(q==1){
string query="SELECT * FROM YakitTuru ORDER BY Yakit_Turu";
            const char* q = query.c_str();
            qstate = mysql_query(conn,q);
            MYSQL_RES *result = mysql_store_result(conn);
            int num_fields = mysql_num_fields(result);
            while ((row = mysql_fetch_row(result)))
{
   unsigned long *lengths;
   lengths = mysql_fetch_lengths(result);
   for(int i = 0; i < num_fields; i++)
   {
       printf("[%.*s] ", (int) lengths[i],
              row[i] ? row[i] : "NULL");
   }
   printf("\n");
}
}


if(q==2){
string query="SELECT * FROM YakitTuru ORDER BY Yakit_Turu DESC";
            const char* q = query.c_str();
            qstate = mysql_query(conn,q);
            MYSQL_RES *result = mysql_store_result(conn);
            int num_fields = mysql_num_fields(result);
            while ((row = mysql_fetch_row(result)))
{
   unsigned long *lengths;
   lengths = mysql_fetch_lengths(result);
   for(int i = 0; i < num_fields; i++)
   {
       printf("[%.*s] ", (int) lengths[i],
              row[i] ? row[i] : "NULL");
   }
   printf("\n");
}
}




}

if(r==6){

    int q;
cout<<"\n1-adan zye"<<endl;
cout<<"2-zden aya"<<endl;
   cin>>q;

if(q==1){
string query="SELECT * FROM Renk ORDER BY Renk";
            const char* q = query.c_str();
            qstate = mysql_query(conn,q);
            MYSQL_RES *result = mysql_store_result(conn);
            int num_fields = mysql_num_fields(result);
            while ((row = mysql_fetch_row(result)))
{
   unsigned long *lengths;
   lengths = mysql_fetch_lengths(result);
   for(int i = 0; i < num_fields; i++)
   {
       printf("[%.*s] ", (int) lengths[i],
              row[i] ? row[i] : "NULL");
   }
   printf("\n");
}
}


if(q==2){
string query="SELECT * FROM Renk ORDER BY Renk DESC";
            const char* q = query.c_str();
            qstate = mysql_query(conn,q);
            MYSQL_RES *result = mysql_store_result(conn);
            int num_fields = mysql_num_fields(result);
            while ((row = mysql_fetch_row(result)))
{
   unsigned long *lengths;
   lengths = mysql_fetch_lengths(result);
   for(int i = 0; i < num_fields; i++)
   {
       printf("[%.*s] ", (int) lengths[i],
              row[i] ? row[i] : "NULL");
   }
   printf("\n");
}
}



}

if(r==7){

    int q;
cout<<"\n1-adan zye"<<endl;
cout<<"2-zden aya"<<endl;
   cin>>q;

if(q==1){
string query="SELECT * FROM Sehir ORDER BY Sehir";
            const char* q = query.c_str();
            qstate = mysql_query(conn,q);
            MYSQL_RES *result = mysql_store_result(conn);
            int num_fields = mysql_num_fields(result);
            while ((row = mysql_fetch_row(result)))
{
   unsigned long *lengths;
   lengths = mysql_fetch_lengths(result);
   for(int i = 0; i < num_fields; i++)
   {
       printf("[%.*s] ", (int) lengths[i],
              row[i] ? row[i] : "NULL");
   }
   printf("\n");
}
}


if(q==2){
string query="SELECT * FROM Sehir ORDER BY Sehir DESC";
            const char* q = query.c_str();
            qstate = mysql_query(conn,q);
            MYSQL_RES *result = mysql_store_result(conn);
            int num_fields = mysql_num_fields(result);
            while ((row = mysql_fetch_row(result)))
{
   unsigned long *lengths;
   lengths = mysql_fetch_lengths(result);
   for(int i = 0; i < num_fields; i++)
   {
       printf("[%.*s] ", (int) lengths[i],
              row[i] ? row[i] : "NULL");
   }
   printf("\n");
}
}




}





}





if(t==2){



string fiyat,fiyat2,km,km2,sehir,renk,vitesturu,yakitturu,tarih,marka,model,marka2,model2,vitesturu2,yakitturu2,renk2,sehir2,tarih2,adkl,adkl2;


int mrk,mdl,vts,ykt,rnk,shr,trh,trh2,fyt,fyt2,klm,klm2,adk;




cout<<"fiyat veri girisi 1-0"<<endl;
         cin>>fyt;
         if(fyt==1){
          cout<<"1-dusuk"<<endl;
           cout<<"2-yuksek"<<endl;
            cout<<"3-iki sayi arasi"<<endl;
          cin>>fyt2;
        if(fyt2==1){
           cout<<"fiyat girisi"<<endl; cin>>fiyat2;
           fiyat="0";
        }
        if(fyt2==2){
            cout<<"fiyat girisi"<<endl; cin>>fiyat;
           fiyat2="99999999999";
        }
        if(fyt2==3){
            cout<<"min fiyat"<<endl;cin>>fiyat;
        cout<<"max fiyat"<<endl;cin>>fiyat2;
        }
         }
         if(fyt==0){
        fiyat="0";
        fiyat2="999999999999";
         }

cout<<"km veri girisi 1-0"<<endl;
         cin>>klm;
         if(klm==1){
          cout<<"1-dusuk"<<endl;
           cout<<"2-yuksek"<<endl;
            cout<<"3-iki sayi arasi"<<endl;
          cin>>klm2;
        if(klm2==1){
           cout<<"km girisi"<<endl; cin>>km2;
           km="0";
        }
        if(klm2==2){
            cout<<"km girisi"<<endl; cin>>km;
           km2="99999999999";
        }
        if(klm2==3){
            cout<<"min km"<<endl;cin>>km;
        cout<<"max km"<<endl;cin>>km2;
        }
         }
         if(klm==0){
        km="0";
        km2="999999999999";
         }

cout<<"adi veri girisi 1-0"<<endl;
         cin>>adk;
         if(adk==1){
          cout<<"adi giriniz"<<endl;cin>>adkl;
          adkl2=adkl;
         }
         if(adk==0){
        adkl="a";
        adkl2="z";
         }
cout<<"marka veri girisi 1-0"<<endl;
         cin>>mrk;
         if(mrk==1){
          cout<<"marka giriniz"<<endl;cin>>marka;
          marka2=marka;
         }
         if(mrk==0){
        marka="a";
        marka2="z";
         }
          cout<<"model veri girisi 1-0"<<endl;
         cin>>mdl;
         if(mdl==1){
          cout<<"model giriniz"<<endl;cin>>model;
          model2=model;
         }
         if(mdl==0){
        model="a";
        model2="z";
         }
          cout<<"vites veri girisi 1-0"<<endl;
         cin>>vts;
         if(vts==1){
          cout<<"vites giriniz"<<endl;cin>>vitesturu;
          vitesturu2=vitesturu;
         }
         if(vts==0){
        vitesturu="a";
        vitesturu2="z";
         }
        cout<<"yakit veri girisi 1-0"<<endl;
         cin>>vts;
         if(vts==1){
          cout<<"yakit giriniz"<<endl;cin>>yakitturu;
          yakitturu2=yakitturu;
         }
         if(vts==0){
        yakitturu="a";
        yakitturu2="z";
         }
          cout<<"renk veri girisi 1-0"<<endl;
         cin>>rnk;
         if(rnk==1){
          cout<<"renk giriniz"<<endl;cin>>renk;
          renk2=renk;
         }
         if(rnk==0){
        renk="a";
        renk2="z";
         }
         cout<<"sehir veri girisi 1-0"<<endl;
         cin>>shr;
         if(shr==1){
          cout<<"sehir giriniz"<<endl;cin>>sehir;
          sehir2=sehir;
         }
         if(shr==0){
        sehir="a";
        sehir2="z";
         }
         cout<<"tarih veri girisi(1=son 24s,1h,1a) 1-0"<<endl;
         cin>>trh;
         if(trh==1){
           cout<<"1-son 24 saat"<<endl;
           cout<<"2-son 1 hafta"<<endl;
           cout<<"3-son 1 ay"<<endl;
           cin>>trh2;
           if(trh2==1){
        tarih="19052018";
        tarih2="20052018";
           }
           if(trh2==2){
        tarih="13052018";
        tarih2="20052018";
           }
           if(trh2==3){
        tarih="20042018";
        tarih2="20052018";
           }
         }
         if(trh==0){
        tarih="0";
        tarih2="99999999";
         }

string query="SELECT * FROM Ilan WHERE Fiyat BETWEEN '"+fiyat+"' AND '"+fiyat2+"' AND Km BETWEEN '"+km+"' AND '"+km2+"' AND Adi BETWEEN '"+adkl+"' AND '"+adkl2+"' AND Tarih BETWEEN '"+tarih+"' AND '"+tarih2+"' AND SehirID IN (SELECT SehirID FROM Sehir WHERE Sehir BETWEEN '"+sehir+"' AND '"+sehir2+"' ) AND ArabaID IN (SELECT ArabaID FROM ARABA WHERE Marka BETWEEN '"+marka+"' AND '"+marka2+"' AND Model BETWEEN '"+model+"' AND '"+model2+"' AND VitesTuruID IN (SELECT VitesTuruID FROM VitesTuru WHERE Vites_Turu BETWEEN '"+vitesturu+"' AND '"+vitesturu2+"') AND YakitTuruID IN (SELECT YakitTuruID FROM YakitTuru WHERE Yakit_Turu BETWEEN '"+yakitturu+"' AND '"+yakitturu2+"') AND RenkID IN (SELECT RenkID FROM Renk WHERE Renk BETWEEN '"+renk+"' AND '"+renk2+"') ) ";
            const char* q = query.c_str();
            qstate = mysql_query(conn,q);
            MYSQL_RES *result = mysql_store_result(conn);
            int num_fields = mysql_num_fields(result);
            while ((row = mysql_fetch_row(result)))
{

   unsigned long *lengths;
   lengths = mysql_fetch_lengths(result);
   for(int i = 0; i < num_fields; i++)
   {
       printf("[%.*s] ", (int) lengths[i],
              row[i] ? row[i] : "NULL");
   }
   printf("\n");

}





}






}





    mysql_close(conn);
 }
    return 0;
}
