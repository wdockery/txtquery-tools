FasdUAS 1.101.10   ��   ��    k             j     �� �� 0 ptitle pTitle  m        � 	 	 R C o p y   f r o m   F o l d i n g T e x t   i n   T A S K P A P E R   f o r m a t   
  
 j    �� �� 0 pver pVer  m       �    0 . 1      j    �� �� 0 pauthor pAuthor  m       �   B R o b   T r e w   @ c o m p l e x p o i n t   o n   T w i t t e r      j   	 �� �� 0 prepo pRepo  m   	 
   �   R h t t p s : / / g i t h u b . c o m / R o b T r e w / t x t q u e r y - t o o l s      j    �� �� 0 plicense pLicense  m       �    M I T      l     ��������  ��  ��       !   j    �� "�� 0 pstrjs pstrJS " m     # # � $ $	L 
 
 	 
 	 f u n c t i o n ( e d i t o r ,   o p t i o n s )   { 
 	 
 	 	 / /   H O W   M A N Y   T A B S   W I L L   T A S K P A P E R   N E E D   F O R   T H I S   L I N E   ? 
 	 	 f u n c t i o n   n e s t L e v e l ( o N o d e )   { 
 	 	 	 v a r   l n g L e v e l = 0 ; 
 	 	 	 w h i l e   ( o N o d e . p a r e n t )   { 
 	 	 	 	 l n g L e v e l + + ; 
 	 	 	 	 o N o d e   =   o N o d e . p a r e n t ; 
 	 	 	 } 
 	 	 	 r e t u r n   l n g L e v e l ; 
 	 	 } 
 	 
 	 	 / /   G E T   T H E   S E L E C T E D   L I N E S 
 	 	 v a r   l s t N o d e s   =   e d i t o r . s e l e c t e d R a n g e ( ) . n o d e s I n R a n g e ( ) , 
 	 	 	 l s t L i n e s = [ ] ,   v a r N o d e ,   s t r L i n e ,   d c t T a g s ,   l s t T a g s ,   v a r T a g ,   s t r V a l u e ; 
 	 
 	 	 / /   A N D   A D J U S T   T A B   P R E F I X E S   A N D   C O L O N   S U F F I X E S / I N F I X E S   ( B E F O R E   T A G S )   
 	 	 l s t N o d e s . f o r E a c h ( f u n c t i o n   ( v a r N o d e )   { 
 	 	 	 i f   ( v a r N o d e . t y p e ( )   ! = =   ' h e a d i n g ' ) 
 	 	 	 	 s t r L i n e   =   v a r N o d e . l i n e ( ) . t r i m ( ) ; 
 	 	 	 e l s e   { 
 	 	 	 	 / /   I N S E R T   A   C O L O N   ( B E F O R E   A N Y   T A G S )   T O   M A R K   E A C H   H A S H   H E A D I N G   A S   A   T P   P R O J E C T 
 	 	 	 	 s t r L i n e   =   v a r N o d e . t e x t ( )   +   ' :   ' ; 
 	 	 	 	 d c t T a g s   =   v a r N o d e . t a g s ( ) ;   l s t T a g s   =   [ ] ; 
 	 	 	 	 f o r   ( v a r T a g   i n   d c t T a g s )   { 
 	 	 	 	 	 s t r V a l u e   =   d c t T a g s [ v a r T a g ] ; 
 	 	 	 	 	 i f   ( s t r V a l u e )   l s t T a g s . p u s h ( [ ' @ ' , v a r T a g , ' ( ' , s t r V a l u e , ' ) ' ] . j o i n ( ' ' ) ) ; 
 	 	 	 	 	 e l s e   l s t T a g s . p u s h ( ' @ '   +   v a r T a g ) ; 
 	 	 	 	 } 
 	 	 	 	 i f   ( l s t T a g s . l e n g t h )   s t r L i n e   + =   l s t T a g s . j o i n ( '   ' ) ; 
 	 	 	 } 
 	 	 	 
 	 	 	 / /   P R E P E N D   E A C H   L I N E   W I T H   T H E   N U M B E R   O F   T A B S   T H A T   M A T C H E S   T H E   N E S T I N G   L E V E L 
 	 	 	 l s t L i n e s . p u s h ( [ A r r a y ( n e s t L e v e l ( v a r N o d e ) ) . j o i n ( ' \ t ' ) ,   s t r L i n e ] . j o i n ( ' ' ) ) ; 
 	 	 } ) ; 
 	 	 r e t u r n   l s t L i n e s . j o i n ( ' \ n ' ) ; 
 	 } 
 
 !  % & % l     ��������  ��  ��   &  ' ( ' i     ) * ) I     ������
�� .aevtoappnull  �   � ****��  ��   * k     8 + +  , - , r      . / . m     ��
�� 
msng / o      ���� 0 	varresult 	varResult -  0 1 0 O    5 2 3 2 k    4 4 4  5 6 5 r     7 8 7 2   ��
�� 
docu 8 o      ���� 0 lstdocs lstDocs 6  9�� 9 Z    4 : ;���� : >     < = < o    ���� 0 lstdocs lstDocs = J    ����   ; k    0 > >  ? @ ? O   * A B A r    ) C D C l   ' E���� E I   '���� F
�� .FTsuevjSnull���     docu��   F �� G��
�� 
FTjs G o    #���� 0 pstrjs pstrJS��  ��  ��   D o      ���� 0 	varresult 	varResult B n     H I H 4    �� J
�� 
cobj J m    ����  I o    ���� 0 lstdocs lstDocs @  K�� K I  + 0�� L��
�� .JonspClpnull���     **** L o   + ,���� 0 	varresult 	varResult��  ��  ��  ��  ��   3 m     M M�                                                                                      @ alis    `  Macintosh HD               �9�SH+  P0FoldingText.app                                                ��m��>�        ����  	                Applications    �9�S      ��0�    P0  *Macintosh HD:Applications: FoldingText.app     F o l d i n g T e x t . a p p    M a c i n t o s h   H D  Applications/FoldingText.app  / ��   1  N�� N L   6 8 O O o   6 7���� 0 	varresult 	varResult��   (  P�� P l     ��������  ��  ��  ��       	�� Q      # R��   Q ���������������� 0 ptitle pTitle�� 0 pver pVer�� 0 pauthor pAuthor�� 0 prepo pRepo�� 0 plicense pLicense�� 0 pstrjs pstrJS
�� .aevtoappnull  �   � **** R �� *���� S T��
�� .aevtoappnull  �   � ****��  ��   S   T 	���� M������������
�� 
msng�� 0 	varresult 	varResult
�� 
docu�� 0 lstdocs lstDocs
�� 
cobj
�� 
FTjs
�� .FTsuevjSnull���     docu
�� .JonspClpnull���     ****�� 9�E�O� .*�-E�O�jv  ��k/ *�b  l E�UO�j Y hUO�ascr  ��ޭ