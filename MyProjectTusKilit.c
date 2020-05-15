#define LED_kontrol PORTA.RA0
#define LED PORTA.RA1
#define KAPI PORTA.RA2
unsigned short tus;
unsigned Keypad_Key_Click ();
char code1[15] ,user1[4];
int i = 0, j, cnt;
char msj01[]="SIFRELI KILIT";
char msj02[]="KAPI ACIK";
char msj03[]="KAPI KAPALI";
char msj04[]="YANLIS SIFRE";
char msj05[]="YENI SIFRE";
char keypadPort at PORTB; //Tuþ takýmý PORTB için tanýmlýyor
sbit LCD_RS at RD2_bit;
sbit LCD_EN at RD3_bit;
sbit LCD_D4 at RD4_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D7 at RD7_bit;
sbit LCD_RS_Direction at TRISD2_bit;
sbit LCD_EN_Direction at TRISD3_bit;
sbit LCD_D4_Direction at TRISD4_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D7_Direction at TRISD7_bit;
void code_enter(int kon){
tus = 0; //Tuþ kodu resetleniyor
while(!tus){
tus = Keypad_Key_Click();// basýlan tuþ tus deðikeninde tutuluyor
}
// Basýlan tuþ deðerinin ekran çýktýsý için ASCII deðeri üretiliyor
switch (tus){
case 1: tus = 49; break; // 1
case 2: tus = 50; break; // 2
case 3: tus = 51; break; // 3
//case 4: tus = 65; break; // A 4x4 pad için
case 5: tus = 52; break; // 4
case 6: tus = 53; break; // 5
case 7: tus = 54; break; // 6
//case 8: tus = 66; break; // B 4x4 pad için
case 9: tus = 55; break; // 7
case 10: tus = 56; break; // 8
case 11: tus = 57; break; // 9
//case 12: tus = 67; break; // C 4x4 pad için
case 13: tus = 42; break; // *
case 14: tus = 48; break; // 0
case 15: tus = 35; break; // #
//case 16: tus = 67; break; // D 4x4 pad için
}
code1[i] = tus;
if(kon==0)  Lcd_Chr(2, i+1, '*'); // LCD ekranda * deðeri basýlýyor
if(kon==1)  Lcd_Chr(2, i+1, code1[i]); /* LCD ekranda ASCII deðeri karþýlýðý basýlýyor */
i++;
}
void code_read(){ //EEPROM'dan veri oku
Delay_ms(20);
user1[0] = EEPROM_Read(0x00); // adres 0'daki veriyi oku
Delay_ms(20);
user1[1] = EEPROM_Read(0x01); // adres 1'deki veriyi oku
Delay_ms(20);
user1[2] = EEPROM_Read(0x02); // adres 2'deki veriyi oku
Delay_ms(20);
user1[3] = EEPROM_Read(0x03); // adres 3'deki veriyi oku
Delay_ms(20);
}
void code_write(){ // Veriyi EEPROM'a yaz
Delay_ms(20);
EEPROM_Write(0x00,code1[0]) // veriyi adres 0'a yaz
Delay_ms(20);
EEPROM_Write(0x01,code1[1]); // veriyi adres 1'e yaz
Delay_ms(20);
EEPROM_Write(0x02,code1[2]); // veriyi adres 2'ye yaz
Delay_ms(20);
EEPROM_Write(0x03,code1[3]); // veriyi adres 3'e yaz
}
void change_code(){
Lcd_Cmd(_LCD_CLEAR);
Lcd_Out(1,1,msj05);
i = 0;
code_enter(1);
code_enter(1);
code_enter(1);
code_enter(1);
code_write();
delay_ms(20);
code_read();
delay_ms(20);
Lcd_Cmd(_LCD_CLEAR);
Lcd_Out(1,1,msj05);
Lcd_Out(2,1, "KURULDU");
Delay_ms(5000);
}

void ayarlar(){
Keypad_Init(); // Tuþ takýmý baþlatýlýyor
Lcd_Init(); // LCD baþlatýlýyor
Lcd_Cmd(_LCD_CLEAR);
Lcd_Cmd(_LCD_CURSOR_OFF);
INTCON=0;
OPTION_REG = 0X87; //Dâhili Pull-up’lar kapalý, düþen kenar tetiklemesi
TRISA=0X00;
PORTA=0;
TRISC = 0x00;
PORTC = 0;
TRISE=0X00;
PORTE=0;
ANSEL = 0; // AN pinlerini dijital I/O olarak ayarla
ANSELH = 0;
CM1CON0.C1ON=0; // karþýlaþtýrýcýlarý kapat
CM2CON0.C2ON=0;
ADCON0.ADON=0; //ADC kapatýldý
for(i=0;i<5;i++){ //Açýlýþta mikrodenetleyicinin
LED_kontrol=~LED_kontrol//çalýþmadýðýný anlamamýzý saðlayan
Delay_ms(250); //kontrol döngüsü
}
LED_kontrol=0;
}
void main(){
ayarlar();
code_read();
L1:
cnt = 0;

do{
Lcd_Cmd(_LCD_CLEAR);
Lcd_Out(1,1,msj01);
Lcd_Out(2,3,"*'a BASIN");
i = 0;
code_enter(1);
if(code1[0] == 42){ // *
Lcd_Cmd(_LCD_CLEAR);
Lcd_Out(1, 1, "SIFREYI GIRIN");
i = 0;
code_enter(0);
code_enter(0);
code_enter(0);
code_enter(0);
code_enter(0);
if(code1[0] == '1' && code1[1] == '2' && code1[2] == '3'
&& code1[3] == '4' && code1[4] == '5' ){ // master kod
code_enter(0);
if(code1[5] == 35){ // #
change_code();
}
}
else if(cnt<3 && code1[0] == user1[0] && code1[1] ==
user1[1] && code1[2] == user1[2] && code1[3] == user1[3] &&
code1[4] == 35){
// þifre onayýný kaydet
Lcd_Cmd(_LCD_CLEAR);
Lcd_out(1,4,msj02); //Kapý açýk
LED=1;
KAPI=1;
Delay_ms(5000);
LCD_Cmd(_LCD_CLEAR);
Lcd_out(1,4,msj03); //Kapý kapalý
LED=0;
KAPI=0;
Delay_ms(2000);
}
else{
cnt++;
Lcd_Cmd(_LCD_CLEAR);
Lcd_Out(1,1,msj04);
Delay_ms(2000);
}
if(cnt>=3)
goto L1;
}
}while(1);
}