
_code_enter:

;MyProjectkapii.c,27 :: 		void code_enter(int kon){
;MyProjectkapii.c,28 :: 		tus = 0; //Tuþ kodu resetleniyor
	CLRF       _tus+0
;MyProjectkapii.c,29 :: 		while(!tus){
L_code_enter0:
	MOVF       _tus+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_code_enter1
;MyProjectkapii.c,30 :: 		tus = Keypad_Key_Click();// basýlan tuþ tus deðikeninde tutuluyor
	CALL       _Keypad_Key_Click+0
	MOVF       R0+0, 0
	MOVWF      _tus+0
;MyProjectkapii.c,31 :: 		}
	GOTO       L_code_enter0
L_code_enter1:
;MyProjectkapii.c,33 :: 		switch (tus){
	GOTO       L_code_enter2
;MyProjectkapii.c,34 :: 		case 1: tus = 49; break; // 1
L_code_enter4:
	MOVLW      49
	MOVWF      _tus+0
	GOTO       L_code_enter3
;MyProjectkapii.c,35 :: 		case 2: tus = 50; break; // 2
L_code_enter5:
	MOVLW      50
	MOVWF      _tus+0
	GOTO       L_code_enter3
;MyProjectkapii.c,36 :: 		case 3: tus = 51; break; // 3
L_code_enter6:
	MOVLW      51
	MOVWF      _tus+0
	GOTO       L_code_enter3
;MyProjectkapii.c,38 :: 		case 5: tus = 52; break; // 4
L_code_enter7:
	MOVLW      52
	MOVWF      _tus+0
	GOTO       L_code_enter3
;MyProjectkapii.c,39 :: 		case 6: tus = 53; break; // 5
L_code_enter8:
	MOVLW      53
	MOVWF      _tus+0
	GOTO       L_code_enter3
;MyProjectkapii.c,40 :: 		case 7: tus = 54; break; // 6
L_code_enter9:
	MOVLW      54
	MOVWF      _tus+0
	GOTO       L_code_enter3
;MyProjectkapii.c,42 :: 		case 9: tus = 55; break; // 7
L_code_enter10:
	MOVLW      55
	MOVWF      _tus+0
	GOTO       L_code_enter3
;MyProjectkapii.c,43 :: 		case 10: tus = 56; break; // 8
L_code_enter11:
	MOVLW      56
	MOVWF      _tus+0
	GOTO       L_code_enter3
;MyProjectkapii.c,44 :: 		case 11: tus = 57; break; // 9
L_code_enter12:
	MOVLW      57
	MOVWF      _tus+0
	GOTO       L_code_enter3
;MyProjectkapii.c,46 :: 		case 13: tus = 42; break; // *
L_code_enter13:
	MOVLW      42
	MOVWF      _tus+0
	GOTO       L_code_enter3
;MyProjectkapii.c,47 :: 		case 14: tus = 48; break; // 0
L_code_enter14:
	MOVLW      48
	MOVWF      _tus+0
	GOTO       L_code_enter3
;MyProjectkapii.c,48 :: 		case 15: tus = 35; break; // #
L_code_enter15:
	MOVLW      35
	MOVWF      _tus+0
	GOTO       L_code_enter3
;MyProjectkapii.c,50 :: 		}
L_code_enter2:
	MOVF       _tus+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_code_enter4
	MOVF       _tus+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_code_enter5
	MOVF       _tus+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_code_enter6
	MOVF       _tus+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_code_enter7
	MOVF       _tus+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_code_enter8
	MOVF       _tus+0, 0
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L_code_enter9
	MOVF       _tus+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L_code_enter10
	MOVF       _tus+0, 0
	XORLW      10
	BTFSC      STATUS+0, 2
	GOTO       L_code_enter11
	MOVF       _tus+0, 0
	XORLW      11
	BTFSC      STATUS+0, 2
	GOTO       L_code_enter12
	MOVF       _tus+0, 0
	XORLW      13
	BTFSC      STATUS+0, 2
	GOTO       L_code_enter13
	MOVF       _tus+0, 0
	XORLW      14
	BTFSC      STATUS+0, 2
	GOTO       L_code_enter14
	MOVF       _tus+0, 0
	XORLW      15
	BTFSC      STATUS+0, 2
	GOTO       L_code_enter15
L_code_enter3:
;MyProjectkapii.c,51 :: 		code1[i] = tus;
	MOVF       _i+0, 0
	ADDLW      _code1+0
	MOVWF      FSR
	MOVF       _tus+0, 0
	MOVWF      INDF+0
;MyProjectkapii.c,52 :: 		if(kon==0)  Lcd_Chr(2, i+1, '*'); // LCD ekranda * deðeri basýlýyor
	MOVLW      0
	XORWF      FARG_code_enter_kon+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__code_enter54
	MOVLW      0
	XORWF      FARG_code_enter_kon+0, 0
L__code_enter54:
	BTFSS      STATUS+0, 2
	GOTO       L_code_enter16
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	INCF       _i+0, 0
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      42
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
L_code_enter16:
;MyProjectkapii.c,53 :: 		if(kon==1)  Lcd_Chr(2, i+1, code1[i]); /* LCD ekranda ASCII deðeri karþýlýðý basýlýyor */
	MOVLW      0
	XORWF      FARG_code_enter_kon+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__code_enter55
	MOVLW      1
	XORWF      FARG_code_enter_kon+0, 0
L__code_enter55:
	BTFSS      STATUS+0, 2
	GOTO       L_code_enter17
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	INCF       _i+0, 0
	MOVWF      FARG_Lcd_Chr_column+0
	MOVF       _i+0, 0
	ADDLW      _code1+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
L_code_enter17:
;MyProjectkapii.c,54 :: 		i++;
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;MyProjectkapii.c,55 :: 		}
L_end_code_enter:
	RETURN
; end of _code_enter

_code_read:

;MyProjectkapii.c,56 :: 		void code_read(){ //EEPROM'dan veri oku
;MyProjectkapii.c,57 :: 		Delay_ms(20);
	MOVLW      52
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_code_read18:
	DECFSZ     R13+0, 1
	GOTO       L_code_read18
	DECFSZ     R12+0, 1
	GOTO       L_code_read18
	NOP
	NOP
;MyProjectkapii.c,58 :: 		user1[0] = EEPROM_Read(0x00); // adres 0'daki veriyi oku
	CLRF       FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _user1+0
;MyProjectkapii.c,59 :: 		Delay_ms(20);
	MOVLW      52
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_code_read19:
	DECFSZ     R13+0, 1
	GOTO       L_code_read19
	DECFSZ     R12+0, 1
	GOTO       L_code_read19
	NOP
	NOP
;MyProjectkapii.c,60 :: 		user1[1] = EEPROM_Read(0x01); // adres 1'deki veriyi oku
	MOVLW      1
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _user1+1
;MyProjectkapii.c,61 :: 		Delay_ms(20);
	MOVLW      52
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_code_read20:
	DECFSZ     R13+0, 1
	GOTO       L_code_read20
	DECFSZ     R12+0, 1
	GOTO       L_code_read20
	NOP
	NOP
;MyProjectkapii.c,62 :: 		user1[2] = EEPROM_Read(0x02); // adres 2'deki veriyi oku
	MOVLW      2
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _user1+2
;MyProjectkapii.c,63 :: 		Delay_ms(20);
	MOVLW      52
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_code_read21:
	DECFSZ     R13+0, 1
	GOTO       L_code_read21
	DECFSZ     R12+0, 1
	GOTO       L_code_read21
	NOP
	NOP
;MyProjectkapii.c,64 :: 		user1[3] = EEPROM_Read(0x03); // adres 3'deki veriyi oku
	MOVLW      3
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _user1+3
;MyProjectkapii.c,65 :: 		Delay_ms(20);
	MOVLW      52
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_code_read22:
	DECFSZ     R13+0, 1
	GOTO       L_code_read22
	DECFSZ     R12+0, 1
	GOTO       L_code_read22
	NOP
	NOP
;MyProjectkapii.c,66 :: 		}
L_end_code_read:
	RETURN
; end of _code_read

_code_write:

;MyProjectkapii.c,67 :: 		void code_write(){ // Veriyi EEPROM'a yaz
;MyProjectkapii.c,68 :: 		Delay_ms(20);
	MOVLW      52
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_code_write23:
	DECFSZ     R13+0, 1
	GOTO       L_code_write23
	DECFSZ     R12+0, 1
	GOTO       L_code_write23
	NOP
	NOP
;MyProjectkapii.c,69 :: 		EEPROM_Write(0x00,code1[0]); // veriyi adres 0'a yaz
	CLRF       FARG_EEPROM_Write_Address+0
	MOVF       _code1+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;MyProjectkapii.c,70 :: 		Delay_ms(20);
	MOVLW      52
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_code_write24:
	DECFSZ     R13+0, 1
	GOTO       L_code_write24
	DECFSZ     R12+0, 1
	GOTO       L_code_write24
	NOP
	NOP
;MyProjectkapii.c,71 :: 		EEPROM_Write(0x01,code1[1]); // veriyi adres 1'e yaz
	MOVLW      1
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVF       _code1+1, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;MyProjectkapii.c,72 :: 		Delay_ms(20);
	MOVLW      52
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_code_write25:
	DECFSZ     R13+0, 1
	GOTO       L_code_write25
	DECFSZ     R12+0, 1
	GOTO       L_code_write25
	NOP
	NOP
;MyProjectkapii.c,73 :: 		EEPROM_Write(0x02,code1[2]); // veriyi adres 2'ye yaz
	MOVLW      2
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVF       _code1+2, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;MyProjectkapii.c,74 :: 		Delay_ms(20);
	MOVLW      52
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_code_write26:
	DECFSZ     R13+0, 1
	GOTO       L_code_write26
	DECFSZ     R12+0, 1
	GOTO       L_code_write26
	NOP
	NOP
;MyProjectkapii.c,75 :: 		EEPROM_Write(0x03,code1[3]); // veriyi adres 3'e yaz
	MOVLW      3
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVF       _code1+3, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;MyProjectkapii.c,76 :: 		}
L_end_code_write:
	RETURN
; end of _code_write

_change_code:

;MyProjectkapii.c,77 :: 		void change_code(){
;MyProjectkapii.c,78 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProjectkapii.c,79 :: 		Lcd_Out(1,1,msj05);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _msj05+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProjectkapii.c,80 :: 		i = 0;
	CLRF       _i+0
	CLRF       _i+1
;MyProjectkapii.c,81 :: 		code_enter(1);
	MOVLW      1
	MOVWF      FARG_code_enter_kon+0
	MOVLW      0
	MOVWF      FARG_code_enter_kon+1
	CALL       _code_enter+0
;MyProjectkapii.c,82 :: 		code_enter(1);
	MOVLW      1
	MOVWF      FARG_code_enter_kon+0
	MOVLW      0
	MOVWF      FARG_code_enter_kon+1
	CALL       _code_enter+0
;MyProjectkapii.c,83 :: 		code_enter(1);
	MOVLW      1
	MOVWF      FARG_code_enter_kon+0
	MOVLW      0
	MOVWF      FARG_code_enter_kon+1
	CALL       _code_enter+0
;MyProjectkapii.c,84 :: 		code_enter(1);
	MOVLW      1
	MOVWF      FARG_code_enter_kon+0
	MOVLW      0
	MOVWF      FARG_code_enter_kon+1
	CALL       _code_enter+0
;MyProjectkapii.c,85 :: 		code_write();
	CALL       _code_write+0
;MyProjectkapii.c,86 :: 		delay_ms(20);
	MOVLW      52
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_change_code27:
	DECFSZ     R13+0, 1
	GOTO       L_change_code27
	DECFSZ     R12+0, 1
	GOTO       L_change_code27
	NOP
	NOP
;MyProjectkapii.c,87 :: 		code_read();
	CALL       _code_read+0
;MyProjectkapii.c,88 :: 		delay_ms(20);
	MOVLW      52
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_change_code28:
	DECFSZ     R13+0, 1
	GOTO       L_change_code28
	DECFSZ     R12+0, 1
	GOTO       L_change_code28
	NOP
	NOP
;MyProjectkapii.c,89 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProjectkapii.c,90 :: 		Lcd_Out(1,1,msj05);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _msj05+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProjectkapii.c,91 :: 		Lcd_Out(2,1, "KURULDU");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_MyProjectkapii+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProjectkapii.c,92 :: 		Delay_ms(5000);
	MOVLW      51
	MOVWF      R11+0
	MOVLW      187
	MOVWF      R12+0
	MOVLW      223
	MOVWF      R13+0
L_change_code29:
	DECFSZ     R13+0, 1
	GOTO       L_change_code29
	DECFSZ     R12+0, 1
	GOTO       L_change_code29
	DECFSZ     R11+0, 1
	GOTO       L_change_code29
	NOP
	NOP
;MyProjectkapii.c,93 :: 		}
L_end_change_code:
	RETURN
; end of _change_code

_ayarlar:

;MyProjectkapii.c,95 :: 		void ayarlar(){
;MyProjectkapii.c,96 :: 		Keypad_Init(); // Tuþ takýmý baþlatýlýyor
	CALL       _Keypad_Init+0
;MyProjectkapii.c,97 :: 		Lcd_Init(); // LCD baþlatýlýyor
	CALL       _Lcd_Init+0
;MyProjectkapii.c,98 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProjectkapii.c,99 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProjectkapii.c,100 :: 		INTCON=0;
	CLRF       INTCON+0
;MyProjectkapii.c,101 :: 		OPTION_REG = 0X87; //Dâhili Pull-up’lar kapalý, düþen kenar tetiklemesi
	MOVLW      135
	MOVWF      OPTION_REG+0
;MyProjectkapii.c,102 :: 		TRISA=0X00;
	CLRF       TRISA+0
;MyProjectkapii.c,103 :: 		PORTA=0;
	CLRF       PORTA+0
;MyProjectkapii.c,104 :: 		TRISC = 0x00;
	CLRF       TRISC+0
;MyProjectkapii.c,105 :: 		PORTC = 0;
	CLRF       PORTC+0
;MyProjectkapii.c,106 :: 		TRISE=0X00;
	CLRF       TRISE+0
;MyProjectkapii.c,107 :: 		PORTE=0;
	CLRF       PORTE+0
;MyProjectkapii.c,108 :: 		ANSEL = 0; // AN pinlerini dijital I/O olarak ayarla
	CLRF       ANSEL+0
;MyProjectkapii.c,109 :: 		ANSELH = 0;
	CLRF       ANSELH+0
;MyProjectkapii.c,110 :: 		CM1CON0.C1ON=0; // karþýlaþtýrýcýlarý kapat
	BCF        CM1CON0+0, 7
;MyProjectkapii.c,111 :: 		CM2CON0.C2ON=0;
	BCF        CM2CON0+0, 7
;MyProjectkapii.c,112 :: 		ADCON0.ADON=0; //ADC kapatýldý
	BCF        ADCON0+0, 0
;MyProjectkapii.c,113 :: 		for(i=0;i<5;i++){ //Açýlýþta mikrodenetleyicinin
	CLRF       _i+0
	CLRF       _i+1
L_ayarlar30:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ayarlar60
	MOVLW      5
	SUBWF      _i+0, 0
L__ayarlar60:
	BTFSC      STATUS+0, 0
	GOTO       L_ayarlar31
;MyProjectkapii.c,114 :: 		LED_kontrol=~LED_kontrol;//çalýþmadýðýný anlamamýzý saðlayan
	MOVLW      1
	XORWF      PORTA+0, 1
;MyProjectkapii.c,115 :: 		Delay_ms(250); //kontrol döngüsü
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_ayarlar33:
	DECFSZ     R13+0, 1
	GOTO       L_ayarlar33
	DECFSZ     R12+0, 1
	GOTO       L_ayarlar33
	DECFSZ     R11+0, 1
	GOTO       L_ayarlar33
	NOP
	NOP
;MyProjectkapii.c,113 :: 		for(i=0;i<5;i++){ //Açýlýþta mikrodenetleyicinin
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;MyProjectkapii.c,116 :: 		}
	GOTO       L_ayarlar30
L_ayarlar31:
;MyProjectkapii.c,117 :: 		LED_kontrol=0;
	BCF        PORTA+0, 0
;MyProjectkapii.c,118 :: 		}
L_end_ayarlar:
	RETURN
; end of _ayarlar

_main:

;MyProjectkapii.c,119 :: 		void main(){
;MyProjectkapii.c,120 :: 		ayarlar();
	CALL       _ayarlar+0
;MyProjectkapii.c,121 :: 		code_read();
	CALL       _code_read+0
;MyProjectkapii.c,122 :: 		L1:
___main_L1:
;MyProjectkapii.c,123 :: 		cnt = 0;
	CLRF       _cnt+0
	CLRF       _cnt+1
;MyProjectkapii.c,125 :: 		do{
L_main34:
;MyProjectkapii.c,126 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProjectkapii.c,127 :: 		Lcd_Out(1,1,msj01);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _msj01+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProjectkapii.c,128 :: 		Lcd_Out(2,3,"*'a BASIN");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_MyProjectkapii+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProjectkapii.c,129 :: 		i = 0;
	CLRF       _i+0
	CLRF       _i+1
;MyProjectkapii.c,130 :: 		code_enter(1);
	MOVLW      1
	MOVWF      FARG_code_enter_kon+0
	MOVLW      0
	MOVWF      FARG_code_enter_kon+1
	CALL       _code_enter+0
;MyProjectkapii.c,131 :: 		if(code1[0] == 42){ // *
	MOVF       _code1+0, 0
	XORLW      42
	BTFSS      STATUS+0, 2
	GOTO       L_main37
;MyProjectkapii.c,132 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProjectkapii.c,133 :: 		Lcd_Out(1, 1, "SIFREYI GIRIN");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_MyProjectkapii+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProjectkapii.c,134 :: 		i = 0;
	CLRF       _i+0
	CLRF       _i+1
;MyProjectkapii.c,135 :: 		code_enter(0);
	CLRF       FARG_code_enter_kon+0
	CLRF       FARG_code_enter_kon+1
	CALL       _code_enter+0
;MyProjectkapii.c,136 :: 		code_enter(0);
	CLRF       FARG_code_enter_kon+0
	CLRF       FARG_code_enter_kon+1
	CALL       _code_enter+0
;MyProjectkapii.c,137 :: 		code_enter(0);
	CLRF       FARG_code_enter_kon+0
	CLRF       FARG_code_enter_kon+1
	CALL       _code_enter+0
;MyProjectkapii.c,138 :: 		code_enter(0);
	CLRF       FARG_code_enter_kon+0
	CLRF       FARG_code_enter_kon+1
	CALL       _code_enter+0
;MyProjectkapii.c,139 :: 		code_enter(0);
	CLRF       FARG_code_enter_kon+0
	CLRF       FARG_code_enter_kon+1
	CALL       _code_enter+0
;MyProjectkapii.c,140 :: 		if(code1[0] == '1' && code1[1] == '2' && code1[2] == '3'
	MOVF       _code1+0, 0
	XORLW      49
	BTFSS      STATUS+0, 2
	GOTO       L_main40
	MOVF       _code1+1, 0
	XORLW      50
	BTFSS      STATUS+0, 2
	GOTO       L_main40
	MOVF       _code1+2, 0
	XORLW      51
	BTFSS      STATUS+0, 2
	GOTO       L_main40
;MyProjectkapii.c,141 :: 		&& code1[3] == '4' && code1[4] == '5' ){ // master kod
	MOVF       _code1+3, 0
	XORLW      52
	BTFSS      STATUS+0, 2
	GOTO       L_main40
	MOVF       _code1+4, 0
	XORLW      53
	BTFSS      STATUS+0, 2
	GOTO       L_main40
L__main52:
;MyProjectkapii.c,142 :: 		code_enter(0);
	CLRF       FARG_code_enter_kon+0
	CLRF       FARG_code_enter_kon+1
	CALL       _code_enter+0
;MyProjectkapii.c,143 :: 		if(code1[5] == 35){ // #
	MOVF       _code1+5, 0
	XORLW      35
	BTFSS      STATUS+0, 2
	GOTO       L_main41
;MyProjectkapii.c,144 :: 		change_code();
	CALL       _change_code+0
;MyProjectkapii.c,145 :: 		}
L_main41:
;MyProjectkapii.c,146 :: 		}
	GOTO       L_main42
L_main40:
;MyProjectkapii.c,147 :: 		else if(cnt<3 && code1[0] == user1[0] && code1[1] ==
	MOVLW      128
	XORWF      _cnt+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main62
	MOVLW      3
	SUBWF      _cnt+0, 0
L__main62:
	BTFSC      STATUS+0, 0
	GOTO       L_main45
	MOVF       _code1+0, 0
	XORWF      _user1+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main45
;MyProjectkapii.c,148 :: 		user1[1] && code1[2] == user1[2] && code1[3] == user1[3] &&
	MOVF       _code1+1, 0
	XORWF      _user1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main45
	MOVF       _code1+2, 0
	XORWF      _user1+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main45
	MOVF       _code1+3, 0
	XORWF      _user1+3, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main45
;MyProjectkapii.c,149 :: 		code1[4] == 35){
	MOVF       _code1+4, 0
	XORLW      35
	BTFSS      STATUS+0, 2
	GOTO       L_main45
L__main51:
;MyProjectkapii.c,151 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProjectkapii.c,152 :: 		Lcd_out(1,4,msj02); //Kapý açýk
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      4
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _msj02+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProjectkapii.c,153 :: 		LED=1;
	BSF        PORTA+0, 1
;MyProjectkapii.c,154 :: 		KAPI=1;
	BSF        PORTA+0, 2
;MyProjectkapii.c,155 :: 		Delay_ms(5000);
	MOVLW      51
	MOVWF      R11+0
	MOVLW      187
	MOVWF      R12+0
	MOVLW      223
	MOVWF      R13+0
L_main46:
	DECFSZ     R13+0, 1
	GOTO       L_main46
	DECFSZ     R12+0, 1
	GOTO       L_main46
	DECFSZ     R11+0, 1
	GOTO       L_main46
	NOP
	NOP
;MyProjectkapii.c,156 :: 		LCD_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProjectkapii.c,157 :: 		Lcd_out(1,4,msj03); //Kapý kapalý
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      4
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _msj03+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProjectkapii.c,158 :: 		LED=0;
	BCF        PORTA+0, 1
;MyProjectkapii.c,159 :: 		KAPI=0;
	BCF        PORTA+0, 2
;MyProjectkapii.c,160 :: 		Delay_ms(2000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main47:
	DECFSZ     R13+0, 1
	GOTO       L_main47
	DECFSZ     R12+0, 1
	GOTO       L_main47
	DECFSZ     R11+0, 1
	GOTO       L_main47
	NOP
;MyProjectkapii.c,161 :: 		}
	GOTO       L_main48
L_main45:
;MyProjectkapii.c,163 :: 		cnt++;
	INCF       _cnt+0, 1
	BTFSC      STATUS+0, 2
	INCF       _cnt+1, 1
;MyProjectkapii.c,164 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProjectkapii.c,165 :: 		Lcd_Out(1,1,msj04);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _msj04+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProjectkapii.c,166 :: 		Delay_ms(2000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main49:
	DECFSZ     R13+0, 1
	GOTO       L_main49
	DECFSZ     R12+0, 1
	GOTO       L_main49
	DECFSZ     R11+0, 1
	GOTO       L_main49
	NOP
;MyProjectkapii.c,167 :: 		}
L_main48:
L_main42:
;MyProjectkapii.c,168 :: 		if(cnt>=3)
	MOVLW      128
	XORWF      _cnt+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main63
	MOVLW      3
	SUBWF      _cnt+0, 0
L__main63:
	BTFSS      STATUS+0, 0
	GOTO       L_main50
;MyProjectkapii.c,169 :: 		goto L1;
	GOTO       ___main_L1
L_main50:
;MyProjectkapii.c,170 :: 		}
L_main37:
;MyProjectkapii.c,171 :: 		}while(1);
	GOTO       L_main34
;MyProjectkapii.c,172 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
