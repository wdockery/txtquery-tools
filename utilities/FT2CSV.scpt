FasdUAS 1.101.10   ��   ��    k             j     �� �� 0 ptitle pTitle  m        � 	 	 ^ C o p y   f r o n t   F o l d i n g T e x t   2   d o c u m e n t   a s   C S V   o r   T S V   
  
 j    �� �� 0 pver pVer  m       �    0 . 1      j    �� �� 0 pauthor pAuthor  m       �   B R o b   T r e w     T w i t t e r :     @ c o m p l e x p o i n t      j   	 �� �� 0 pdescription pDescription  m   	 
   �    
 
 	 C o p i e s   c o n t e n t s   o f   f r o n t   F o l d i n g T e x t   d o c u m e n t   t o   t h e   c l i p b o a r d   a s   C S V   o r   T S V 
 	 ( t a b   s e p a r a t e d   v a l u e s ) 
 
 	 E d i t   p s t r D e l i m   b e l o w   t o   s p e c i f y   c o m m a s   o r   t a b s 
 
 	 ( N O T E :   a   t a b - d e l i m i t e d   T S V   v e r s i o n   c a n   b e   p a s t e d   s t r a i g h t   i n t o   E x c e l , 
 	 C S V   n e e d s   t o   b e   p a s t e d   i n t o   a   t e x t   f i l e ,   a n d   t h e n   o p e n e d   i n   E x c e l ) 
 
 	 F O R M A T : 
 	 	 O n e   s p r e a d s h e e t   c o l u m n   f o r   e a c h   l e v e l   o f   o u t l i n e   i n d e n t a t i o n ,   a n d 
 	 	 O n e   s p r e a d s h e e t   c o l u m n   f o r   e a c h   t y p e   o f   @ k e y ( v a l u e )   t a g   i n   t h e   d o c u m e n t 
 
 	 	 T h e   k e y   o f   @ k e y ( v a l u e )   i s   u s e d   a s   t h e   c o l u m n   h e a d i n g ,   
 	 	 a n d   t h e   v a l u e   i s   p l a c e d   i n   t h e   s p r e a d s h e e t   c e l l s 
 
 	 D A T E S : 
 	 	 E x c e l   a u t o m a t i c a l l y   r e c o g n i s e s   y y y y - m m - d d 
 	 	 a n d   y y y y - m m - d d     h h : m m   a s   d a t e t i m e   s t r i n g s ,   a n d   c o n v e r t s   t h e m   a c c o r d i n g l y . 
 
 	       @ d u e ( 2 0 1 5 - 0 6 - 0 1   1 4 : 0 0 )   w i l l   b e c o m e   a n   e x c e l   d a t e   i n   a   c o l u m n   w i t h   h e a d e r   ' D u e ' 
 
      l     ��������  ��  ��        l     ��������  ��  ��        j    �� �� 0 pstrtab pstrTab  1    ��
�� 
tab      !   j    �� "�� 0 	pstrcomma 	pstrComma " m     # # � $ $  , !  % & % l     ��������  ��  ��   &  ' ( ' l     �� ) *��   ) E ? SPECIFY FIELD DELIMITER BY EDITING THE VALUE OF PSTRDELIM HERE    * � + + ~   S P E C I F Y   F I E L D   D E L I M I T E R   B Y   E D I T I N G   T H E   V A L U E   O F   P S T R D E L I M   H E R E (  , - , j    �� .�� 0 	pstrdelim 	pstrDelim . o    ���� 0 pstrtab pstrTab -  / 0 / l     ��������  ��  ��   0  1 2 1 l     ��������  ��  ��   2  3 4 3 j    �� 5�� 0 precoptions precOptions 5 K     6 6 �� 7���� 0 	delimiter   7 o    ���� 0 	pstrdelim 	pstrDelim��   4  8 9 8 l     ��������  ��  ��   9  : ; : l     �� < =��   < ; 5 NOTE: FIELDS CONTAINING THE DELIMITER WILL BE QUOTED    = � > > j   N O T E :   F I E L D S   C O N T A I N I N G   T H E   D E L I M I T E R   W I L L   B E   Q U O T E D ;  ? @ ? l     ��������  ��  ��   @  A B A j    �� C�� 0 pstrjs pstrJS C m     D D � E EV 
 f u n c t i o n ( e d i t o r ,   o p t i o n s )   { 
 
 	 f u n c t i o n   m a x d e p t h ( n o d e )   { 
 	 	 / /   D E E P E S T   L E V E L   I N   T H E   F O L D I N G T E X T   O U T L I N E 
 	 	 v a r 	 l n g C h i l n   =   0 ,   l s t C h i l n = [ ] , 
 	 	 	 l n g M a x   =   0 ,   l n g D e p t h   =   0 ; 
 
 	 	 i f   ( n o d e . h a s C h i l d r e n ( ) )   { 
 	 	 	 l s t C h i l n   =   n o d e . c h i l d r e n ( ) ; 
 	 	 	 f o r   ( v a r   i   =   l s t C h i l n . l e n g t h ;   i   - - ; )   { 
 	 	 	 	 l n g D e p t h   =   m a x d e p t h ( l s t C h i l n [ i ] )   +   1 ; 
 	 	 	 	 i f   ( l n g D e p t h   >   l n g M a x )   l n g M a x   =   l n g D e p t h ; 
 	 	 	 } 
 	 	 } 
 	 	 r e t u r n   l n g M a x ; 
 	 } 
 
 	 f u n c t i o n   n e s t L e v e l ( o N o d e )   { 
 	 	 / /   O U T L I N E   L E V E L   O F   T H I S   N O D E 
 	 	 v a r   o P a r e n t   =   o N o d e . p a r e n t ; 
 	 	 i f   ( ! o N o d e . p a r e n t )   { 
 	 	 	 r e t u r n   - 1 ; 
 	 	 }   e l s e   r e t u r n   n e s t L e v e l ( o P a r e n t )   + 1 ; 
 	 } 
 
 	 v a r 	 s t r D e l i m   =   o p t i o n s . d e l i m i t e r , 
 	 	 o T r e e = e d i t o r . t r e e ( ) , 
 	 	 l n g L e v e l s   =   m a x d e p t h ( o T r e e . r o o t ) , 
 	 	 l s t T a g s   =   o T r e e . t a g s ( t r u e ) . s o r t ( ) , 
 	 	 l n g T a g s   =   l s t T a g s . l e n g t h , 
 	 	 l n g C o l s = l n g L e v e l s + l n g T a g s , 
 	 	 l s t C o l s = n e w   A r r a y ( l n g C o l s ) , 
 	 	 l s t R e c o r d ,   s t r T a g ,   i T a g ,   i C o l , 
 	 	 l s t R o w s = [ ] ; 
 
 	 / /   C R E A T E   A   H E A D E R   ( O N E   C O L U M N   F O R   E A C H   O U T L I N E   L E V E L ,   A N D   O N E   C O L U M N   F O R   E A C H   T A G ) 
 	 l s t R e c o r d   =   l s t C o l s . s l i c e ( 0 ) ; 
 	 f o r   ( i C o l = l n g L e v e l s ;   i C o l - - ; )   { 
 	 	 l s t R e c o r d [ i C o l ]   =   ' L e v e l   '   +   ( i C o l + 1 ) . t o S t r i n g ( ) ; 
 	 } 
 	 f o r   ( i T a g = l n g T a g s ;   i T a g - - ; )   { 
 	 	 s t r T a g = l s t T a g s [ i T a g ] 
 	 	 l s t R e c o r d [ l n g L e v e l s + i T a g ]   =   s t r T a g [ 0 ] . t o U p p e r C a s e ( )   +   s t r T a g . s l i c e ( 1 ) . t o L o w e r C a s e ( ) ; 
 	 } 
 	 l s t R o w s . p u s h ( l s t R e c o r d . j o i n ( ' \ t ' ) ) ; 
 
 	 / /   G A T H E R   T H E   D A T A   R O W S 
 	 o T r e e . n o d e s ( ) . f o r E a c h ( f u n c t i o n   ( o N o d e )   { 
 	 	 l s t R e c o r d   =   l s t C o l s . s l i c e ( 0 ) ; 
 	 	 l s t R e c o r d [ n e s t L e v e l ( o N o d e ) ]   =   o N o d e . t e x t ( ) ; 
 	 	 f o r   ( i T a g = l n g T a g s ; i T a g - - ; )   { 
 	 	 	 s t r T a g = l s t T a g s [ i T a g ] ; 
 	 	 	 i f   ( o N o d e . h a s T a g ( s t r T a g ) )   { 
 	 	 	 	 s t r V a l u e = o N o d e . t a g ( s t r T a g ) ; 
 	 	 	 	 i f   ( s t r V a l u e . i n d e x O f ( s t r D e l i m )   ! = =   - 1 )   { 
 	 	 	 	 	 s t r V a l u e = ' " '   +   s t r V a l u e   +   ' " ' ; 
 	 	 	 	 } 
 	 	 	 	 l s t R e c o r d [ l n g L e v e l s + i T a g ]   =   s t r V a l u e ; 
 	 	 	 } 
 	 	 } 
 	 	 s t r R o w   =   l s t R e c o r d . j o i n ( s t r D e l i m ) ; 
 	 	 l s t R o w s . p u s h ( s t r R o w ) ; 
 	 } ) ; 
 
 	 r e t u r n   l s t R o w s . j o i n ( ' \ n ' ) ; 
 } 
 B  F G F l     ��������  ��  ��   G  H�� H i    " I J I I     ������
�� .aevtoappnull  �   � ****��  ��   J k     > K K  L M L r      N O N m     ��
�� 
msng O o      ���� 0 	varresult 	varResult M  P Q P O    ; R S R k    : T T  U V U r     W X W 2   ��
�� 
docu X o      ���� 0 lstdocs lstDocs V  Y�� Y Z    : Z [���� Z >     \ ] \ o    ���� 0 lstdocs lstDocs ] J    ����   [ k    6 ^ ^  _ ` _ O   0 a b a r    / c d c l   - e���� e I   -���� f
�� .FTsuevjSnull���     docu��   f �� g h
�� 
FTjs g o    #���� 0 pstrjs pstrJS h �� i��
�� 
FTop i o   $ )���� 0 precoptions precOptions��  ��  ��   d o      ���� 0 	varresult 	varResult b n     j k j 4    �� l
�� 
cobj l m    ����  k o    ���� 0 lstdocs lstDocs `  m�� m I  1 6�� n��
�� .JonspClpnull���     **** n o   1 2���� 0 	varresult 	varResult��  ��  ��  ��  ��   S m     o o�                                                                                      @ alis    `  Macintosh HD               �9�SH+  P0FoldingText.app                                                ��m��>�        ����  	                Applications    �9�S      ��0�    P0  *Macintosh HD:Applications: FoldingText.app     F o l d i n g T e x t . a p p    M a c i n t o s h   H D  Applications/FoldingText.app  / ��   Q  p�� p L   < > q q o   < =���� 0 	varresult 	varResult��  ��       �� r     s # s t D u��   r 
���������������������� 0 ptitle pTitle�� 0 pver pVer�� 0 pauthor pAuthor�� 0 pdescription pDescription�� 0 pstrtab pstrTab�� 0 	pstrcomma 	pstrComma�� 0 	pstrdelim 	pstrDelim�� 0 precoptions precOptions�� 0 pstrjs pstrJS
�� .aevtoappnull  �   � **** s � v v  	 t �� s���� 0 	delimiter  ��   u �� J���� w x��
�� .aevtoappnull  �   � ****��  ��   w   x ���� o����������������
�� 
msng�� 0 	varresult 	varResult
�� 
docu�� 0 lstdocs lstDocs
�� 
cobj
�� 
FTjs
�� 
FTop�� 
�� .FTsuevjSnull���     docu
�� .JonspClpnull���     ****�� ?�E�O� 4*�-E�O�jv &��k/ *�b  �b  � 	E�UO�j 
Y hUO�ascr  ��ޭ