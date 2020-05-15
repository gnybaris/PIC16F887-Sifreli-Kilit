#line 1 "C:/Users/GUNAY/Desktop/MyProjectTusKilit.c"



unsigned short tus;
unsigned Keypad_Key_Click ();
char code1[15] ,user1[4];
int i = 0, j, cnt;
char msj01[]="SIFRELI KILIT";
char msj02[]="KAPI ACIK";
char msj03[]="KAPI KAPALI";
char msj04[]="YANLIS SIFRE";
char msj05[]="YENI SIFRE";
char keypadPort at PORTB;
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
tus = 0;
while(!tus){
tus = Keypad_Key_Click();
}

switch (tus){
case 1: tus = 49; break;
case 2: tus = 50; break;
case 3: tus = 51; break;

case 5: tus = 52; break;
case 6: tus = 53; break;
case 7: tus = 54; break;

case 9: tus = 55; break;
case 10: tus = 56; break;
case 11: tus = 57; break;

case 13: tus = 42; break;
case 14: tus = 48; break;
case 15: tus = 35; break;

}
code1[i] = tus;
if(kon==0) Lcd_Chr(2, i+1, '*');
if(kon==1) Lcd_Chr(2, i+1, code1[i]);
i++;
}
void code_read(){
Delay_ms(20);
user1[0] = EEPROM_Read(0x00);
Delay_ms(20);
user1[1] = EEPROM_Read(0x01);
Delay_ms(20);
user1[2] = EEPROM_Read(0x02);
Delay_ms(20);
user1[3] = EEPROM_Read(0x03);
Delay_ms(20);
}
void code_write(){
Delay_ms(20);
EEPROM_Write(0x00,code1[0])
Delay_ms(20);
EEPROM_Write(0x01,code1[1]);
Delay_ms(20);
EEPROM_Write(0x02,code1[2]);
Delay_ms(20);
EEPROM_Write(0x03,code1[3]);
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
Keypad_Init();
Lcd_Init();
Lcd_Cmd(_LCD_CLEAR);
Lcd_Cmd(_LCD_CURSOR_OFF);
INTCON=0;
OPTION_REG = 0X87;
TRISA=0X00;
PORTA=0;
TRISC = 0x00;
PORTC = 0;
TRISE=0X00;
PORTE=0;
ANSEL = 0;
ANSELH = 0;
CM1CON0.C1ON=0;
CM2CON0.C2ON=0;
ADCON0.ADON=0;
for(i=0;i<5;i++){
 PORTA.RA0 =~ PORTA.RA0 
Delay_ms(250);
}
 PORTA.RA0 =0;
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
if(code1[0] == 42){
Lcd_Cmd(_LCD_CLEAR);
Lcd_Out(1, 1, "SIFREYI GIRIN");
i = 0;
code_enter(0);
code_enter(0);
code_enter(0);
code_enter(0);
code_enter(0);
if(code1[0] == '1' && code1[1] == '2' && code1[2] == '3'
&& code1[3] == '4' && code1[4] == '5' ){
code_enter(0);
if(code1[5] == 35){
change_code();
}
}
else if(cnt<3 && code1[0] == user1[0] && code1[1] ==
user1[1] && code1[2] == user1[2] && code1[3] == user1[3] &&
code1[4] == 35){

Lcd_Cmd(_LCD_CLEAR);
Lcd_out(1,4,msj02);
 PORTA.RA1 =1;
 PORTA.RA2 =1;
Delay_ms(5000);
LCD_Cmd(_LCD_CLEAR);
Lcd_out(1,4,msj03);
 PORTA.RA1 =0;
 PORTA.RA2 =0;
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
