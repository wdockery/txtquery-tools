FasdUAS 1.101.10   ��   ��    k             j     �� �� 0 ptitle pTitle  m        � 	 	 R C o p y   f r o m   T a s k P a p e r   i n   F O L D I N G T E X T   f o r m a t   
  
 j    �� �� 0 pver pVer  m       �    0 . 1      j    �� �� 0 pauthor pAuthor  m       �   B R o b   T r e w   @ c o m p l e x p o i n t   o n   T w i t t e r      j   	 �� �� 0 prepo pRepo  m   	 
   �   R h t t p s : / / g i t h u b . c o m / R o b T r e w / t x t q u e r y - t o o l s      j    �� �� 0 plicense pLicense  m       �    M I T      l     ��������  ��  ��       !   j    �� "�� 0 pstrjs pstrJS " m     # # � $ $� 
 
 	 
 	 f u n c t i o n ( e d i t o r ,   o p t i o n s )   { 
 
 	 	 / /   H O W   M A N Y   P R E C E D I N G   T A B S   O R   H A S H E S   F O R   T H I S   L I N E   I N   F T   ? 
 	 	 f u n c t i o n   F T P r e f i x ( o N o d e )   { 
 	 	 	 v a r   o P a r e n t = o N o d e . p a r e n t ,   l n g L e v e l = 1 ,   l n g P r o j L e v e l = 1 ,   b l n F o u n d = f a l s e , 
 	 	 	 s t r T y p e = o N o d e . t y p e ( ) ,   b l n P r o j   =   ( s t r T y p e   = =   ' p r o j e c t ' ) ,   s t r P r e f i x ; 
 
 	 	 	 b l n F o u n d   =   b l n P r o j ; 
 	 	 	 w h i l e   ( o P a r e n t )   { 
 	 	 	 	 l n g L e v e l + + ; 
 	 	 	 	 i f   ( b l n F o u n d )   l n g P r o j L e v e l   + + ; 
 	 	 	 	 e l s e   b l n F o u n d   =   ( o P a r e n t . t y p e ( )   = =   ' p r o j e c t ' ) ; 
 	 	 	 	 o P a r e n t   =   o P a r e n t . p a r e n t ; 
 	 	 	 } 
 	 	 	 i f   ( b l n P r o j )   s t r P r e f i x   =   ' \ n '   +   A r r a y ( l n g L e v e l ) . j o i n ( ' # ' )   +   '   ' ; 
 	 	 	 e l s e   s t r P r e f i x   =   A r r a y ( l n g L e v e l - l n g P r o j L e v e l ) . j o i n ( ' \ t ' ) ; 
 
 	 	 	 r e t u r n   s t r P r e f i x ; 
 	 	 } 
 
 	 	 / /   G E T   T H E   S E L E C T E D   L I N E S 
 	 	 v a r   l s t N o d e s   =   e d i t o r . s e l e c t e d R a n g e ( ) . n o d e s I n R a n g e ( ) , 
 	 	 	 	 l s t L i n e s = [ ] ,   v a r N o d e ,   s t r L i n e ,   r g x E n d C o l o n   =   / ^ ( . * ) : ( . * ? ) $ / ; 
 
 	 	 / /   A N D   G I V E   A N   F T   P R E F I X   ( H A S H E S   O R   T A B S )   T O   E A C H   O N E 
 	 	 l s t N o d e s . f o r E a c h ( f u n c t i o n   ( o N o d e )   { 
 	 	 	 s t r L i n e   =   o N o d e . l i n e ( ) . t r i m ( ) ; 
 	 	 	 
 	 	 	 / /   R E M O V I N G   T H E   C O L O N   F R O M   P R O J E C T S   ( B U T   L E A V I N G   T R A I L L I N G   T A G S ) 
 	 	 	 i f   ( o N o d e . t y p e ( )   = =   ' p r o j e c t ' ) 
 	 	 	 	 s t r L i n e = s t r L i n e . r e p l a c e ( r g x E n d C o l o n ,   ' $ 1 $ 2 ' ) ; 
 	 	 	 l s t L i n e s . p u s h ( [ F T P r e f i x ( o N o d e ) , s t r L i n e ] . j o i n ( ' ' ) ) ; 
 	 	 } ) ; 
 
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
�� .JonspClpnull���     **** L o   + ,���� 0 	varresult 	varResult��  ��  ��  ��  ��   3 m     M M�                                                                                      @ alis    X  Macintosh HD               �9�SH+  P0TaskPaper.app                                                  ��5ύˠ        ����  	                Applications    �9�S      ύ��    P0  (Macintosh HD:Applications: TaskPaper.app    T a s k P a p e r . a p p    M a c i n t o s h   H D  Applications/TaskPaper.app  / ��   1  N�� N L   6 8 O O o   6 7���� 0 	varresult 	varResult��   (  P�� P l     ��������  ��  ��  ��       	�� Q      # R��   Q ���������������� 0 ptitle pTitle�� 0 pver pVer�� 0 pauthor pAuthor�� 0 prepo pRepo�� 0 plicense pLicense�� 0 pstrjs pstrJS
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