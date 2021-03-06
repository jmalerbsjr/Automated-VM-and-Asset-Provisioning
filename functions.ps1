�� 
 #   - - - - - - - - - C R E A T E   N E W   V M - - - - - - - - - -  
 #   U S E S   A N   I S O   W H I C H   I N C L U D E S   A N   O S   E D I T I O N   S P E C I F I C   U N A T T E N D . X M L   F I L E  
 F u n c t i o n   C r e a t e N e w V M  
 {  
 	 [ c m d l e t b i n d i n g ( S u p p o r t s S h o u l d P r o c e s s ) ]  
 	 P a r a m (  
 	 $ S e r v e r M e t a D a t a ,  
 	 [ V a l i d a t e N o t N u l l o r E m p t y ( ) ]  
 	 [ s t r i n g ] $ C o m p u t e r N a m e ,  
 	 [ s t r i n g ] $ D o m a i n N a m e ,  
 	 [ s t r i n g ] $ S e r v e r R o l e   =   $ n u l l ,  
 	 [ s t r i n g ] $ C o l l e c t i o n N a m e   =   $ n u l l ,  
 	 [ s t r i n g ] $ R D S H A   =   $ n u l l ,  
 	 [ s t r i n g ] $ D N S S e r v e r ,  
 	  
 	 [ V a l i d a t e S c r i p t ( { $ _   - g e   2 5 6 M B } ) ]  
 	 [ i n t 6 4 ] $ V M M e m o r y ,  
 	 $ V M M e m o r y T y p e   =   " " ,  
 	  
 	 [ s t r i n g ] $ O S I S O P a t h ,  
 	  
 	 [ V a l i d a t e N o t N u l l o r E m p t y ( ) ]  
 	 [ s t r i n g ] $ O S E d i t i o n ,  
 	  
 	 [ V a l i d a t e S c r i p t ( { $ _   - g e   1 0 G B } ) ]  
 	 [ i n t 6 4 ] $ V M V H D S i z e ,  
 	  
 	 [ V a l i d a t e N o t N u l l o r E m p t y ( ) ]  
 	 [ s t r i n g ] $ H V R o o t D i r ,  
 	  
 	 [ V a l i d a t e N o t N u l l o r E m p t y ( ) ]  
 	 [ s t r i n g ] $ V M S w i t c h ,  
 	    
 	 [ V a l i d a t e S c r i p t ( { $ _   - g e   1 } ) ]  
 	 [ i n t ] $ V M P r o c e s s o r C o u n t ,  
 	  
 	 [ s t r i n g ] $ P r o d u c t K e y   =   $ n u l l ,  
 	 [ s t r i n g ] $ S t a t i c I P   =   " " ,  
 	 [ s t r i n g ] $ N e x t H o p A d d r e s s   =   " "  
 	  
 	 )        
 	  
 	 W r i t e - H o s t   ` n   " - - - - B u i l d i n g   V M :   $ C o m p u t e r N a m e - - - - "   - F o r e g r o u n d C o l o r   M a g e n t a  
 	  
 # 	 #   U p d a t e   B u i l d   S t a t u s  
 # 	 $ M e t a D a t a T a b l e   |   ? { $ _ . C o m p u t e r N a m e   - i e q   $ C o m p u t e r N a m e }   |   % { $ _ . S t a t u s   =   " P r o v i s i o n V M " }  
  
 	 I p c o n f i g   / f l u s h d n s   |   O u t - N u l l  
 	 I f ( ! ( T e s t - C o n n e c t i o n   - C o m p u t e r N a m e   $ C o m p u t e r N a m e   - C o u n t   2   - Q u i e t ) )  
 	 {  
 	 	 #   B U I L D   V M   F R O M   V H D X   T E M P L A T E  
 	 	 I f ( $ O S I S O P a t h   - i m a t c h   " . v h d x " )  
 	 	 {  
 	 	 	 W r i t e - H o s t   " I N F O :   P r o v i s i o n i n g   V H D X   F r o m   $ ( $ O S I S O P a t h ) "  
 	 	 	  
 	 	 	 $ O S I S O P a t h   =   $ R o o t W o r k i n g D i r + " \ O S I m a g e s \ " + $ O S I S O P a t h  
 	 	 	 $ V M V H D P a t h   =   ( " $ H V R o o t D i r \ V i r t u a l   H a r d   D i s k s \ $ C o m p u t e r N a m e . v h d x " ) . r e p l a c e ( " \ \ " , " \ " )  
 	 	 	 #   D u p l i c a t e   V H D X   T e m p l a t e   a s   N e w   V H D X  
 	 	 	 C o p y - I t e m   $ O S I S O P a t h   $ V M V H D P a t h   - F o r c e   |   O u t - N u l l  
 	 	 	 S t a r t - S l e e p   - S e c o n d s   6 0  
 	 	 	  
 	 	 	 # # M o u n t   V H D X  
 	 	 	 W r i t e - H o s t   " I N F O :   M o u n t i n g   V H D X "  
 	 	 	 $ M o u n t D r i v e   =   M o u n t - V H D   $ V M V H D P a t h    p a s s t h r u   |   G e t - D i s k   |   G e t - P a r t i t i o n   |   G e t - V o l u m e  
 	 	 	 W r i t e - H o s t   " I N F O :   U s i n g   $ ( $ M o u n t D r i v e . D r i v e L e t t e r ) : \ "  
 	 	 	  
 	 	 	 #   G e n e r a t e   a n d   I n j e c t   U n a t t e n d   F i l e  
 	 	 	 W r i t e - H o s t   " I N F O :   G e n e r a t i n g   U n a t t e n d   F i l e "  
 	 	 	 G e n e r a t e U n a t t e n d F i l e   - C o m p u t e r N a m e   $ C o m p u t e r N a m e   - O S E d i t i o n   $ O S E d i t i o n   - P r o d u c t K e y   $ P r o d u c t K e y   - S t a t i c I P   $ S t a t i c I P   - N e x t H o p A d d r e s s   $ N e x t H o p A d d r e s s  
 	 	 	 #   G l o b a l   V a r i a b l e  
 	 	 	 W r i t e - H o s t   " I N F O :   I n j e c t i n g   U n a t t e n d   F i l e   t o   V H D X "  
 	 	 	 C o p y - I t e m   $ U n a t t e n d F i l e   " $ ( $ M o u n t D r i v e . D r i v e L e t t e r ) : \ "   |   O u t - N u l l  
 	 	 	  
 	 	 	 W r i t e - H o s t   " I N F O :   D i s m o u n t i n g   $ ( $ M o u n t D r i v e . D r i v e L e t t e r ) : \ "  
 	 	 	 D i s m o u n t - V H D   - P a t h   $ V M V H D P a t h  
 	 	 	  
 	 	 	 W r i t e - H o s t   " I N F O :   C r e a t i n g   V M   O n   V - H o s t "  
 	 	 	 I f ( $ V M M e m o r y T y p e   - i e q   " D y n a m i c " )  
 	 	 	 {  
 	 	 	 	 N e w - V M   - N a m e   $ C o m p u t e r N a m e   - G e n e r a t i o n   2   - V H D P a t h   $ V M V H D P a t h   - M e m o r y S t a r t u p B y t e s   $ V M M e m o r y   - S w i t c h N a m e   $ V M S w i t c h   |  
 	 	 	 	 S e t - V M   - D y n a m i c M e m o r y   - P r o c e s s o r C o u n t   $ V M P r o c e s s o r C o u n t   - P a s s t h r u   |   O u t - N u l l  
 	 	 	 }  
 	 	 	 E l s e  
 	 	 	 {  
 	 	 	 	 N e w - V M   - N a m e   $ C o m p u t e r N a m e   - G e n e r a t i o n   2   - V H D P a t h   $ V M V H D P a t h   - M e m o r y S t a r t u p B y t e s   $ V M M e m o r y   - S w i t c h N a m e   $ V M S w i t c h   |  
 	 	 	 	 S e t - V M   - S t a t i c M e m o r y   - P r o c e s s o r C o u n t   $ V M P r o c e s s o r C o u n t   - P a s s t h r u   |   O u t - N u l l  
 	 	 	 }  
 	 	 }  
 	 	 #   B U I L D   V M   F R O M   I S O   M E D I A  
 	 	 E l s e  
 	 	 {  
 	 	 	 ' F R O M   I S O '  
 	 	 	 $ O S I S O P a t h   =   $ R o o t W o r k i n g D i r + " \ O S I m a g e s \ " + $ O S I S O P a t h  
 	 	 	 #   M o d i f y   V a r i a b l e s   &   R e m o v e   T r a i l i n g   S l a s h e s  
 	 	 	 $ V M V H D P a t h   =   ( " $ H V R o o t D i r \ V i r t u a l   H a r d   D i s k s \ $ C o m p u t e r N a m e . v h d x " ) . r e p l a c e ( " \ \ " , " \ " )  
  
 	 	 	 # D y n a m i c a l l y   G e n e r a t e   U n a t t e n d   F i l e  
 	 	 	 G e n e r a t e U n a t t e n d F i l e   - C o m p u t e r N a m e   $ C o m p u t e r N a m e   - O S E d i t i o n   $ O S E d i t i o n   - P r o d u c t K e y   $ P r o d u c t K e y   - S t a t i c I P   $ S t a t i c I P   - N e x t H o p A d d r e s s   $ N e x t H o p A d d r e s s  
  
 	 	 	 # r e g i o n   C o n v e r t   I S O   t o   V H D  
 	 	 	 W r i t e - V e r b o s e   " C o n v e r t i n g   I S O   t o   V H D ( X ) "  
 	 	 	    
 	 	 	 # p a r s e   t h e   f o r m a t   f r o m   t h e   V H D P a t h   p a r a m e t e r   v a l u e  
 	 	 	 [ r e g e x ] $ r x   =   " \ . V H D $ | \ . V H D X $ "  
 	 	 	 # r e g e x   p a t t e r n   i s   c a s e - s e n s i t i v e  
 	 	 	 i f   ( $ V M V H D P a t h . T o U p p e r ( )   - m a t c h   $ r x )   {  
 	 	 	         # g e t   t h e   m a t c h   a n d   s t r i p   o f f   t h e   p e r i o d  
 	 	 	         $ F o r m a t   =   $ r x . M a t c h ( $ V M V H D P a t h . t o U p p e r ( ) ) . V a l u e . R e p l a c e ( " . " , " " )  
 	 	 	 }  
 	 	 	 e l s e   {  
 	 	 	         T h r o w   " T h e   e x t e n s i o n   f o r   V H D P a t h   i s   i n v a l i d .   I t   m u s t   b e   . V H D   o r   . V H D X "  
 	 	 	         R e t u r n  
 	 	 	 }  
 	 	 	    
 	 	 	 # d e f i n e   a   h a s h t a b l e   o f   p a r a m e t e r s   a n d   v a l u e s   f o r   t h e   C o n v e r t - W i n d o w s I m a g e  
 	 	 	    
 	 	 	 $ c o n v e r t P a r a m s   =   @ {  
 	 	 	 S o u r c e P a t h   =   $ O S I S O P a t h  
 	 	 	 S i z e B y t e s   =   $ V M V H D S i z e  
 	 	 	 U n a t t e n d P a t h   =   $ U n a t t e n d F i l e  
 	 	 	 E d i t i o n   =   $ O S E d i t i o n  
 	 	 	 V H D F o r m a t   =   $ F o r m a t  
 	 	 	 V H D P a t h   =   $ V M V H D P a t h  
 	 	 	 E r r o r A c t i o n   =   ' S t o p '  
 	 	 	 }  
 	 	 	    
 	 	 	 W r i t e - V e r b o s e   ( $ c o n v e r t P a r a m s   |   O u t - S t r i n g )  
 	 	 	    
 	 	 	 # d e f i n e   a   v a r i a b l e   w i t h   i n f o r m a t i o n   t o   b e   d i s p l a y e d   i n   W h a t I f   m e s s a g e s  
 	 	 	 $ S h o u l d   =   " V M   $ C o m p u t e r N a m e   f r o m   $ O S I S O P a t h   t o   $ V M V H D P a t h "  
 	 	 	    
 	 	 	 # r e g i o n   - W h a t i f   p r o c e s s i n g  
 	 	 	 I f   ( $ p s c m d l e t . S h o u l d P r o c e s s ( $ S h o u l d ) )   {  
 	 	 	         T r y   {  
 	 	 	                 # c a l l   t h e   c o n v e r t   s c r i p t   s p l a t t i n g   t h e   p a r a m e t e r   h a s h t a b l e  
 	 	 	                 . \ C o n v e r t - W i n d o w s I m a g e . p s 1   @ c o n v e r t P a r a m s  
 	 	 	         }  
 	 	 	         C a t c h   {  
 	 	 	                 W r i t e - W a r n i n g   " F a i l e d   t o   c o n v e r t   $ O S I S O P a t h   t o   $ V M V H D P a t h "  
 	 	 	                 W r i t e - W a r n i n g   $ _ . E x c e p t i o n . M e s s a g e  
 	 	 	         }  
 	 	 	 }   # s h o u l d   p r o c e s s t e  
  
 	 	 	 # e n d r e g i o n  
 	 	 	    
 	 	 	 # e n d r e g i o n  
  
 	 	 	 # r e g i o n   C r e a t i n g   t h e   v i r t u a l   m a c h i n e  
 	 	 	 W r i t e - V e r b o s e   " C r e a t i n g   v i r t u a l   m a c h i n e   $ C o m p u t e r N a m e "  
 	 	 	 W r i t e - V e r b o s e   " V H D P a t h   =   $ V M V H D P a t h "  
 	 	 	 W r i t e - V e r b o s e   " M e m o r y S t a r t u p   =   $ V M M e m o r y "  
 	 	 	 W r i t e - V e r b o s e   " S w i t c h   =   $ V M S w i t c h "  
 	 	 	 W r i t e - V e r b o s e   " P r o c e s s o r C o u n t   =   $ V M P r o c e s s o r C o u n t "  
 	 	 	    
 	 	 	 I f ( $ V M M e m o r y T y p e   - i e q   " D y n a m i c " )  
 	 	 	 {  
 	 	 	 	 N e w - V M   - N a m e   $ C o m p u t e r N a m e   - G e n e r a t i o n   2   - V H D P a t h   $ V M V H D P a t h   - M e m o r y S t a r t u p B y t e s   $ V M M e m o r y   - S w i t c h N a m e   $ V M S w i t c h   |  
 	 	 	 	 S e t - V M   - D y n a m i c M e m o r y   - P r o c e s s o r C o u n t   $ V M P r o c e s s o r C o u n t   - P a s s t h r u  
 	 	 	 }  
 	 	 	 E l s e  
 	 	 	 {  
 	 	 	 	 N e w - V M   - N a m e   $ C o m p u t e r N a m e   - G e n e r a t i o n   2   - V H D P a t h   $ V M V H D P a t h   - M e m o r y S t a r t u p B y t e s   $ V M M e m o r y   - S w i t c h N a m e   $ V M S w i t c h   |  
 	 	 	 	 S e t - V M   - S t a t i c M e m o r y   - P r o c e s s o r C o u n t   $ V M P r o c e s s o r C o u n t   - P a s s t h r u  
 	 	 	 }  
 	 	 	  
 	 	 	 W r i t e - V e r b o s e   " N e w   V M   f r o m   I S O   c o m p l e t e "  
 	 	 	 # e n d r e g i o n  
 	 	 }  
 	 	  
 	 	 #   S T A R T   V M   A F T E R   C R E A T I O N  
 	 	 W r i t e - H o s t   " S t a r t i n g   V M   $ C o m p u t e r N a m e "  
 	 	 S t a r t - V M   - N a m e   $ C o m p u t e r N a m e  
  
 	 	 #   W a i t   f o r   c o m p u t e r   t o   c o m e   o n l i n e   b e f o r e   c o n t i n u i n g    
 	 	 W a i t C o m p u t e r O n l i n e   - C o m p u t e r N a m e   $ C o m p u t e r N a m e   - D o m a i n   $ f a l s e  
 	 	  
 	 }  
 	 E l s e  
 	 {  
 	 	 W r i t e - H o s t   " ` t C o m p u t e r   A l r e a d y   E x i s t s :   $ C o m p u t e r N a m e "   - F o r e g r o u n d C o l o r   D a r k R e d  
 	 }  
 	  
 	 #   G e t   L o c a l   A d m i n   C r e d e n t i a l s  
   	 $ L A d m i n c r e d e n t i a l s   =   G e t L A d m i n C r e d e n t i a l s   - C o m p u t e r N a m e   $ C o m p u t e r N a m e  
 	  
  
 	 I f ( $ S e r v e r R o l e   - i m a t c h   " D C D N S " )  
 	 {  
 	 	 C r e a t e N e w A D D N S   - D C P R O M O C o m p u t e r n a m e   $ C o m p u t e r N a m e   - S e r v e r M e t a D a t a   $ S e r v e r M e t a D a t a   - S e r v e r R o l e   $ S e r v e r R o l e   - D o m a i n N a m e   $ D o m a i n N a m e  
 	 }  
 	 E l s e I f ( $ S e r v e r R o l e   - i m a t c h   " W o r k g r o u p " )  
 	 {  
 	 	 W r i t e - H o s t   " W O R K G R O U P "  
 	 }  
 	 E l s e  
 	 {  
 	 	 J o i n D o m a i n   - D o m a i n N a m e   $ D o m a i n N a m e   - C o m p u t e r N a m e   $ C o m p u t e r N a m e    
 	 }  
 	 I f ( $ S e r v e r R o l e   - i m a t c h   " R D S " )  
 	 {  
 	 	 D e p l o y R D S   - S e r v e r R o l e   $ S e r v e r R o l e   - C o l l e c t i o n N a m e   $ C o l l e c t i o n N a m e   - C o m p u t e r N a m e   $ C o m p u t e r N a m e   - D o m a i n N a m e   $ D o m a i n N a m e    
 	 }  
 	  
 }  
  
 	  
  
 F u n c t i o n   D e p l o y R D S  
 {  
 	 P a r a m (  
 	 $ C o m p u t e r N a m e   =   " " ,  
 	 $ S e r v e r R o l e   =   " " ,  
 	 $ C o l l e c t i o n N a m e   =   " " ,  
 	 $ D o m a i n N a m e   =   " " )  
 	  
 	 #   G e t   D o m a i n   A d m i n   C r e d e n t i a l s  
 	 $ D o m a i n A d m i n c r e d e n t i a l s   =   G e t D o m a i n A d m i n C r e d e n t i a l s   - D o m a i n N a m e   $ D o m a i n N a m e  
 	 $ D o m a i n S e a r c h B a s e   =   G e t D o m a i n S e a r c h B a s e   - D o m a i n N a m e   $ D o m a i n N a m e  
 	  
 	 #   C r e a t e   L i s t   o f   c o m p o n e n t s   t o   I n s t a l l   b a s e d   o n   S e r v e r   R o l e  
 	 $ R D S C o m p o n e n t L i s t   =   @ ( )  
 	 F o r e a c h ( $ R D S R o l e   i n   $ S e r v e r R o l e . S p l i t ( " , " ) )  
 	 {  
 	 	 I f ( $ R D S R o l e   - i m a t c h   " R D S G W " ) { $ R D S C o m p o n e n t L i s t   + =   " R D S - G a t e w a y " }  
 	 	 I f ( $ R D S R o l e   - i m a t c h   " R D S G W " ) { $ R D S C o m p o n e n t L i s t   + =   " R S A T - R D S - G a t e w a y " }  
 	 	 I f ( $ R D S R o l e   - i m a t c h   " R D S W A " ) { $ R D S C o m p o n e n t L i s t   + =   " R D S - W e b - A c c e s s " }  
 	 	 I f ( $ R D S R o l e   - i m a t c h   " R D S C B " ) { $ R D S C o m p o n e n t L i s t   + =   " R D S - C o n n e c t i o n - B r o k e r " }  
 	 	 I f ( $ R D S R o l e   - i m a t c h   " R D S C B " ) { $ R D S C o m p o n e n t L i s t   + =   " R S A T - R D S - T o o l s " }  
 	 	 I f ( $ R D S R o l e   - i m a t c h   " R D S S H " ) { $ R D S C o m p o n e n t L i s t   + =   " R D S - R D - S e r v e r " }  
 	 	 I f ( $ R D S R o l e   - i m a t c h   " R D S L S " ) { $ R D S C o m p o n e n t L i s t   + =   " R D S - L i c e n s i n g " }  
 	 	 I f ( $ R D S R o l e   - i m a t c h   " R D S L S " ) { $ R D S C o m p o n e n t L i s t   + =   " R D S - L i c e n s i n g - U I " }  
 	 }  
  
 	 #   C h e c k   i f   a   R e b o o t   i s   N e c e s s a r y   A f t e r   I n s t a l l i n g   t h e   R D   S e s s i o n   H o s t   F e a t u r e  
 	 I f ( $ R D S R o l e   - i m a t c h   " R D S S H " )  
 	 {  
 	 	 $ C h e c k R e b o o t   = ( I n v o k e - C o m m a n d   - C o m p u t e r N a m e   $ C o m p u t e r N a m e   - C r e d e n t i a l   $ D o m a i n A d m i n c r e d e n t i a l s   - S c r i p t B l o c k   { ( G e t - W i n d o w s F e a t u r e   " R D S - R D - S e r v e r " ) . I n s t a l l e d } )  
 	 }  
 	  
 	 W r i t e - H o s t   " I n s t a l l i n g   R D S   C o m p o n e n t s   t o   $ C o m p u t e r N a m e "  
 	 I n v o k e - C o m m a n d   - C o m p u t e r N a m e   $ C o m p u t e r N a m e   - C r e d e n t i a l   $ D o m a i n A d m i n c r e d e n t i a l s   - S c r i p t B l o c k   {  
 	 	  
 	 	 #   V a l i d a t e   R D S   C o m p o n e n t s  
 	 	 F o r e a c h ( $ R D S C o m p o n e n t   i n   $ u s i n g : R D S C o m p o n e n t L i s t )  
 	 	 {  
 	 	 	 I f ( ! ( ( G e t - W i n d o w s F e a t u r e   $ R D S C o m p o n e n t ) . I n s t a l l e d ) )  
 	 	 	 {  
 	 	 	 	 W r i t e - H o s t   " ` t I n s t a l l i n g   $ R D S C o m p o n e n t "  
 	 	 	 	 A d d - W i n d o w s F e a t u r e   $ R D S C o m p o n e n t   |   O u t - N u l l  
 	 	 	 }  
 	 	 	 E l s e  
 	 	 	 {  
 	 	 	 	 W r i t e - H o s t   " ` t $ R D S C o m p o n e n t   i s   a l r e a d y   i n s t a l l e d "   - F o r e g r o u n d C o l o r   D a r k R e d  
 	 	 	 }  
 	 	 }  
  
 	 }  
 	  
 	 #   R e s t a r t   C o m p u t e r   O n l y   A f t e r   I n s t a l l i n g   t h e   R D   S e s s i o n   H o s t  
 	 I f ( $ C h e c k R e b o o t   - i e q   $ F a l s e )  
 	 {  
 	 	 W r i t e - H o s t   " R e s t a r t i n g   C o m p u t e r   $ C o m p u t e r N a m e "  
 	 	 R e s t a r t - C o m p u t e r   - C o m p u t e r N a m e   $ C o m p u t e r N a m e   - W a i t   - F o r   P o w e r S h e l l   - C r e d e n t i a l   $ D o m a i n A d m i n c r e d e n t i a l s   - F o r c e  
 	 	  
 	 	 #   I f   R D M S   s e r v i c e   e x i s t s ,   w a i t   f o r   i t  
 	 	 $ G e t S e r v i c e   =   ( I n v o k e - C o m m a n d   - C o m p u t e r N a m e   $ C o m p u t e r N a m e   - C r e d e n t i a l   $ D o m a i n A d m i n c r e d e n t i a l s   - S c r i p t B l o c k   { ( G e t - S e r v i c e ) . N a m e } )  
 	 	 I f ( $ G e t S e r v i c e   - i c o n t a i n s   " R D M S " )  
 	 	 {  
 	 	 	 W a i t C o m p u t e r O n l i n e   - C o m p u t e r N a m e   $ C o m p u t e r N a m e   - W a i t S e r v i c e   R D M S  
 	 	 }  
 	 	 e l s e  
 	 	 {  
 	 	 	 W a i t C o m p u t e r O n l i n e   - C o m p u t e r N a m e   $ C o m p u t e r N a m e  
 	 	 }  
 	 	  
 	 	  
 	 }  
 	  
 	  
 	 #   M O V E   C O M P U T E R   O B J E C T   T O   C O R R E C T   O U  
 	 #   G e t   I P   o f   F i r s t   D N S   S e r v e r  
 	 $ D N S S e r v e r   =   ( G e t D N S S e r v e r I P L i s t   - A l l D N S S e r v e r s ) . S p l i t ( " , " ) [ 0 ]  
 	  
 	 I n v o k e - C o m m a n d   - C o m p u t e r N a m e   $ D N S S e r v e r   - C r e d e n t i a l   $ D o m a i n A d m i n c r e d e n t i a l s   - S c r i p t B l o c k   {  
 	 	  
 	 	 I f ( $ u s i n g : S e r v e r R o l e   - i m a t c h   " R D S S H " )  
 	 	 {  
 	 	 W r i t e - H o s t   " M o v i n g   C o m p u t e r   O b j e c t   $ u s i n g : C o m p u t e r N a m e   t o   R D S   H o s t s   O U "  
 	 	 $ A D O b j T a r g e t   =   G e t - A D O r g a n i z a t i o n a l U n i t   - L D A P F i l t e r   " ( n a m e = R D S   H o s t s ) "   - S e a r c h B a s e   $ u s i n g : D o m a i n S e a r c h B a s e   - S e r v e r   $ u s i n g : D N S S e r v e r   - C r e d e n t i a l   $ u s i n g : D o m a i n A d m i n c r e d e n t i a l s  
 	 	 G e t - A D C o m p u t e r   $ u s i n g : C o m p u t e r N a m e   |   M o v e - A D O b j e c t   - T a r g e t P a t h   $ A D O b j T a r g e t . D i s t i n g u i s h e d N a m e   - C r e d e n t i a l   $ u s i n g : D o m a i n A d m i n c r e d e n t i a l s  
 	 	 }  
 	 	 E l s e I f ( $ u s i n g : S e r v e r R o l e   - i n o t m a t c h   " D C D N S "   )  
 	 	 {  
 	 	 W r i t e - H o s t   " M o v i n g   C o m p u t e r   O b j e c t   $ u s i n g : C o m p u t e r N a m e   t o   R D S   I n f r a s t r u c t u r e   O U "  
 	 	 $ A D O b j T a r g e t   =   G e t - A D O r g a n i z a t i o n a l U n i t   - L D A P F i l t e r   " ( n a m e = R D S   I n f r a s t r u c t u r e ) "   - S e a r c h B a s e   $ u s i n g : D o m a i n S e a r c h B a s e   - S e r v e r   $ u s i n g : D N S S e r v e r   - C r e d e n t i a l   $ u s i n g : D o m a i n A d m i n c r e d e n t i a l s  
 	 	 G e t - A D C o m p u t e r   $ u s i n g : C o m p u t e r N a m e   |   M o v e - A D O b j e c t   - T a r g e t P a t h   $ A D O b j T a r g e t . D i s t i n g u i s h e d N a m e   - C r e d e n t i a l   $ u s i n g : D o m a i n A d m i n c r e d e n t i a l s  
 	 	 }  
 	 	  
 	 }  
  
 }  
  
  
  
 F u n c t i o n   C o n f i g u r e R D S D e p l o y m e n t  
 {  
 	 P a r a m (  
 	 $ R D S H A ,  
 	 $ R D S D N S R R N a m e ,  
 	 $ C o l l e c t i o n N a m e ,  
 	 $ D o m a i n N a m e  
 	 )  
 	  
 	 #   G e t   D o m a i n   A d m i n   C r e d e n t i a l s  
 	 $ D o m a i n A d m i n c r e d e n t i a l s   =   G e t D o m a i n A d m i n C r e d e n t i a l s   - D o m a i n N a m e   $ D o m a i n N a m e  
 	  
 	  
 	 W r i t e - H o s t   ` n   " - - - - C o n f i g u r i n g   R D S   D e p l o y m e n t - - - - "   - F o r e g r o u n d C o l o r   M a g e n t a  
 	 W r i t e - H o s t   " C o l l e c t i o n :   $ C o l l e c t i o n N a m e "  
 	  
 	 #   C r e a t e   V a r i a b l e   t o   C o n f i g u r e   E a c h   R D S   C o m p o n e n t  
 	 $ R D S G W C o m p u t e r N a m e   =   @ ( )  
 	 $ R D S W A C o m p u t e r N a m e   =   @ ( )  
 	 $ R D S C B C o m p u t e r N a m e   =   @ ( )  
 	 $ R D S S H C o m p u t e r N a m e   =   @ ( )  
 	 $ D C C o m p u t e r N a m e   =   @ ( )  
 	  
 	 F o r e a c h ( $ R o w   i n   $ M e t a D a t a T a b l e )  
 	 {  
 	 	  
 	 	 	 I f ( $ R o w . S e r v e r R o l e   - i m a t c h   " R D S G W " )  
 	 	 	 {  
 	 	 	 	 $ R D S G W C o m p u t e r N a m e   + =   $ R o w . C o m p u t e r N a m e  
 	 	 	 	 $ R D S G W C o m p u t e r N a m e 1   =   $ R D S G W C o m p u t e r N a m e [ 0 ]  
 	 	 	 }  
 	 	 	 I f ( $ R o w . S e r v e r R o l e   - i m a t c h   " R D S W A " )  
 	 	 	 {  
 	 	 	 	 $ R D S W A C o m p u t e r N a m e   + =   $ R o w . C o m p u t e r N a m e  
 	 	 	 	 $ R D S W A C o m p u t e r N a m e 1   =   $ R D S W A C o m p u t e r N a m e [ 0 ]  
 	 	 	 }  
 	 	 	 I f ( $ R o w . S e r v e r R o l e   - i m a t c h   " R D S C B " )  
 	 	 	 {  
 	 	 	 	 $ R D S C B C o m p u t e r N a m e   + =   $ R o w . C o m p u t e r N a m e  
 	 	 	 	 $ R D S C B C o m p u t e r N a m e 1   =   $ R D S C B C o m p u t e r N a m e [ 0 ]  
 	 	 	 }  
 	 	 	 I f ( $ R o w . S e r v e r R o l e   - i m a t c h   " R D S S H " ) {  
 	 	 	 	 $ R D S S H C o m p u t e r N a m e   + =   $ R o w . C o m p u t e r N a m e  
 	 	 	 	 $ R D S S H C o m p u t e r N a m e 1   =   $ R D S S H C o m p u t e r N a m e [ 0 ]  
 	 	 	 }  
 	 	 	 I f ( $ R o w . S e r v e r R o l e   - i m a t c h     " R D S L S " ) { $ R D S L S C o m p u t e r N a m e   =   $ R o w . C o m p u t e r N a m e }  
 	 	 	 I f ( $ R o w . S e r v e r R o l e   - i m a t c h     " R D S S Q L " ) { $ R D S S Q L C o m p u t e r N a m e   =   $ R o w . C o m p u t e r N a m e }  
 	 	 	 I f ( $ R o w . S e r v e r R o l e   - i m a t c h     " D C D N S " )  
 	 	 	 {  
 	 	 	 	 $ D C C o m p u t e r N a m e   + =   $ R o w . C o m p u t e r N a m e  
 	 	 	 	 $ D C C o m p u t e r N a m e 1   =   $ D C C o m p u t e r N a m e [ 0 ]  
 	 	 	 }  
 	 	  
 	 }  
 	  
 	  
 	  
 	 #   E n a b l e   C r e d S S P   o n   R e m o t e   S e r v e r 	  
 	 E n a b l e C r e d S S P S e r v e r   - C o m p u t e r N a m e   $ R D S C B C o m p u t e r N a m e 1   - C r e d e n t i a l   $ D o m a i n A d m i n c r e d e n t i a l s  
 	  
 	 $ V a l R D S C o l l e c t i o n   =   I n v o k e - C o m m a n d   - C o m p u t e r N a m e   $ R D S C B C o m p u t e r N a m e 1   - A u t h e n t i c a t i o n   C r e d s s p   - C r e d e n t i a l   $ D o m a i n A d m i n c r e d e n t i a l s   - S c r i p t B l o c k   { ( G e t - R D S e s s i o n C o l l e c t i o n ) . C o l l e c t i o n N a m e }   - E r r o r A c t i o n   S i l e n t l y C o n t i n u e  
  
 	 I f ( ! ( $ V a l R D S C o l l e c t i o n   - i e q   $ C o l l e c t i o n N a m e ) )  
 	 {  
 	 	 I n v o k e - C o m m a n d   - C o m p u t e r N a m e   $ R D S C B C o m p u t e r N a m e 1   - A u t h e n t i c a t i o n   C r e d s s p   - C r e d e n t i a l   $ D o m a i n A d m i n c r e d e n t i a l s   - S c r i p t B l o c k   {  
 	 	 	 #   C o n f i g u r e   R D S   D e p l o y m e n t / C o l l e c t i o n  
 	 	 	 W r i t e - H o s t   " ` t C r e a t i n g   D e p l o y m e n t "  
 	 	 	 N e w - R D S e s s i o n D e p l o y m e n t   - C o n n e c t i o n B r o k e r   " $ u s i n g : R D S C B C o m p u t e r N a m e 1 ` . $ u s i n g : D o m a i n N a m e "   - W e b A c c e s s S e r v e r   " $ u s i n g : R D S W A C o m p u t e r N a m e 1 ` . $ u s i n g : D o m a i n N a m e "   - S e s s i o n H o s t   " $ u s i n g : R D S S H C o m p u t e r N a m e 1 ` . $ u s i n g : D o m a i n N a m e "  
 	 	 	 W r i t e - H o s t   " ` t C r e a t i n g   C o l l e c t i o n "  
 	 	 	 N e w - R D S e s s i o n C o l l e c t i o n   - C o l l e c t i o n N a m e   $ u s i n g : C o l l e c t i o n N a m e   - C o n n e c t i o n B r o k e r   " $ u s i n g : R D S C B C o m p u t e r N a m e 1 ` . $ u s i n g : D o m a i n N a m e "   - S e s s i o n H o s t   " $ u s i n g : R D S S H C o m p u t e r N a m e 1 ` . $ u s i n g : D o m a i n N a m e "   - E r r o r A c t i o n   S i l e n t l y C o n t i n u e  
                     	 W r i t e - H o s t   " ` t C o n f i g u r i n g   L i c e n s e   S e r v e r :   $ u s i n g : R D S L S C o m p u t e r N a m e "  
 	 	 	 S e t - R D L i c e n s e C o n f i g u r a t i o n   - L i c e n s e S e r v e r   " $ u s i n g : R D S L S C o m p u t e r N a m e ` . $ u s i n g : D o m a i n N a m e "   - M o d e   P e r D e v i c e   - C o n n e c t i o n B r o k e r   " $ u s i n g : R D S C B C o m p u t e r N a m e 1 ` . $ u s i n g : D o m a i n N a m e "   - F o r c e  
 	 	 	 # # # # S e t - R D S e s s i o n C o l l e c t i o n C o n f i g u r a t i o n   - C o l l e c t i o n N a m e   $ u s i n g : C o l l e c t i o n N a m e   - C l i e n t P r i n t e r R e d i r e c t e d   $ f a l s e   - C l i e n t D e v i c e R e d i r e c t i o n O p t i o n s     N o n e   - C o n n e c t i o n B r o k e r   " $ u s i n g : R D S C B C o m p u t e r N a m e 1 ` . $ u s i n g : D o m a i n N a m e "  
 	 	 }  
 	 }  
 	 E l s e  
 	 {  
 	 	 W r i t e - H o s t   " ` t C o l l e c t i o n   A l r e a d y   E x i s t s "   - F o r e g r o u n d C o l o r   D a r k R e d  
 	 }  
  
 	  
 	 I f ( $ R D S H A   - i e q   $ t r u e )  
 	 {  
 	 	 #   I n s t a l l   S Q L   I f   R D S S Q L   S e r v e r R o l e   E x i s t s   i n   M e t a D a t a T a b l e  
 	 	 I f ( $ M e t a D a t a T a b l e . S e r v e r R o l e   - i c o n t a i n s   " R D S S Q L " )  
 	 	 {  
 	 	 	 #   S t a g e   S Q L   S e r v e r   I n s t a l l e r   F i l e s  
 	 	 	 W r i t e - H o s t   " I n s t a l l i n g   S Q L   S e r v e r   2 0 1 2   E x p r e s s   o n   $ R D S S Q L C o m p u t e r N a m e "  
 	 	 	 I f ( ! ( T e s t - P a t h   " \ \ $ R D S S Q L C o m p u t e r N a m e \ c $ \ S t a g i n g \ S Q L S e r v e r 2 0 1 2 \ S e t u p . e x e "   |   O u t - N u l l ) )  
 	 	 	 {  
 	 	 	 	 N e w - I t e m   - P a t h   " \ \ $ R D S S Q L C o m p u t e r N a m e \ c $ \ S t a g i n g \ S Q L S e r v e r 2 0 1 2 \ "   - I t e m T y p e   D i r e c t o r y   - F o r c e   - E r r o r A c t i o n   S i l e n t l y C o n t i n u e   |   O u t - N u l l  
 	 	 	 	 C o p y - I t e m   " $ R o o t W o r k i n g D i r \ C o p y - S Q L \ S Q L S e r v e r 2 0 1 2 "   " \ \ $ R D S S Q L C o m p u t e r N a m e \ c $ \ S t a g i n g \ "   - R e c u r s e   - F o r c e   - E r r o r A c t i o n   S i l e n t l y C o n t i n u e   |   O u t - N u l l  
 	 	 	 }  
 	 	 	  
 	 	 	 #   I n s t a l l   S Q L   S e r v e r  
 	 	 	 E n a b l e C r e d S S P S e r v e r   - C o m p u t e r N a m e   $ R D S S Q L C o m p u t e r N a m e   - C r e d e n t i a l   $ D o m a i n A d m i n c r e d e n t i a l s  
 	 	 	 I n v o k e - C o m m a n d   - C o m p u t e r N a m e   $ R D S S Q L C o m p u t e r N a m e   - A u t h e n t i c a t i o n   C r e d s s p   - C r e d e n t i a l   $ D o m a i n A d m i n c r e d e n t i a l s   - S c r i p t B l o c k   {  
 	 	 	 	  
  
 	 	 	 	 #   I n s t a l l   . N E T   3 5 / 4 5   i f   N o t   I n s t a l l e d  
 	 	 	 	 $ W i n d o w s F e a t u r e L i s t   =   @ ( " N E T - F r a m e w o r k - C o r e " , " N E T - F r a m e w o r k - 4 5 - C o r e " )  
 	 	 	 	 F o r e a c h ( $ W i n d o w s F e a t u r e   i n   $ W i n d o w s F e a t u r e L i s t )  
 	 	 	 	 {  
 	 	 	 	 	 I f ( ! ( ( G e t - W i n d o w s F e a t u r e   $ W i n d o w s F e a t u r e ) . I n s t a l l e d ) )  
 	 	 	 	 	 {  
 	 	 	 	 	 	 W r i t e - H o s t   " I n s t a l l i n g   $ W i n d o w s F e a t u r e "  
 	 	 	 	 	 	 A d d - W i n d o w s F e a t u r e   $ W i n d o w s F e a t u r e   |   O u t - N u l l  
 	 	 	 	 	 }  
 	 	 	 	 }  
 	 	 	  
 	 	 	 	 #   V a l i d a t e / I n s t a l l   S Q L   E n g i n e   &   C o n n e c t i o n   T o o l s  
 	 	 	 	 I f ( ! ( ( G e t - S e r v i c e ) . N a m e   - i c o n t a i n s   " M S S Q L S E R V E R " ) )  
 	 	 	 	 {  
 	 	 	 	 	 #   I n s t a l l   S Q L   S e r v e r   2 0 1 2 ,   S p e c i f i c   F e a t u r e s   &   S t a r t   S Q L B r o w s e r   S e r v i c e  
 	 	 	 	 	 C M D . e x e   / C   ' C : \ S t a g i n g \ S Q L S e r v e r 2 0 1 2 \ S e t u p . e x e   / Q   / H I D E C O N S O L E   / A C T I O N = I n s t a l l   / U P D A T E E N A B L E D = 0   / F E A T U R E S = S Q L E n g i n e , T o o l s   / I N S T A N C E N A M E = M S S Q L S E R V E R   / S Q L S V C A C C O U N T = " N e t w o r k   S e r v i c e "   / A G T S V C A C C O U N T = " N e t w o r k   S e r v i c e "   / S Q L S Y S A D M I N A C C O U N T S = " D o m a i n   A d m i n s "   / S A P W D = "PASSWORD"   / I A C C E P T S Q L S E R V E R L I C E N S E T E R M S   / T C P E N A B L E D = 1   / I N D I C A T E P R O G R E S S   / S Q M R E P O R T I N G = 0 '  
 	 	 	 	 	  
 	 	 	 	 	 #   C o n f i r m   S Q L   S e r v e r   I n s t a l l a t i o n  
 	 	 	 	 	 I f ( ( G e t - S e r v i c e ) . N a m e   - i c o n t a i n s   " M S S Q L S E R V E R " )  
 	 	 	 	 	 {  
 	 	 	 	 	 	 W r i t e - H o s t   " ` t S u c c e s s f u l l y   I n s t a l l e d   S Q L   S e r v e r "   - F o r e g r o u n d C o l o r   D a r k G r e e n 	  
 	 	 	 	 	 }  
 	 	 	 	 	  
 	 	 	 	 	 W r i t e - H o s t   " S e t t i n g   S Q L B r o w s e r   S e r v i c e   t o   A u t o m a t i c / R u n n i n g "  
 	 	 	 	 	 S e t - S e r v i c e   S Q L B r o w s e r   - s t a r t u p t y p e   " A u t o m a t i c "   - S t a t u s   R u n n i n g  
 	 	 	 	 	 I f ( ( G e t - S e r v i c e   S Q L B r o w s e r ) . S t a t u s   - i e q   " R u n n i n g " ) { W r i t e - H o s t   " ` t S u c c e s s f u l l y   S e t   S e r v i c e "   - F o r e g r o u n d C o l o r   D a r k G r e e n }  
 	 	 	 	 	  
 	 	 	 	 	 #   A d d   S Q L   t o   P A T H   i n   C u r r e n t   P S   S e s s i o n .   O t h e r w i s e ,   I n v o k e   a   N e w   S e s s i o n  
 	 	 	 	 	 I f ( $ e n v : P S M o d u l e P a t h   - i n o t c o n t a i n s   " \ M i c r o s o f t   S Q L   S e r v e r \ 1 1 0 \ T o o l s \ P o w e r S h e l l \ M o d u l e s " )  
 	 	 	 	 	 {  
 	 	 	 	 	 	 $ E N V : P S M o d u l e P a t h   + =   " ; C : \ P r o g r a m   F i l e s   ( x 8 6 ) \ M i c r o s o f t   S Q L   S e r v e r \ 1 1 0 \ T o o l s \ P o w e r S h e l l \ M o d u l e s "  
 	 	 	 	 	 }  
  
  
 	 	 	 	 	 #   C r e a t e   S Q L   D B ,   A d d   G r o u p   t o   S Q L   S e c u r i t y ,   A l l o w   C r e a t e   D B ' s   &   D B O   o f   D B  
 	 	 	 	 	 $ D o m a i n N a m e S p l i t   =   ( $ u s i n g : D o m a i n N a m e ) . S p l i t ( " . " ) [ 0 ]  
 	 	 	 	 	 $ S Q L U s e r   =   " $ D o m a i n N a m e S p l i t \ R D S   C o n n e c t i o n   B r o k e r s "  
 	 	 	 	 	 T r y { I n v o k e - S q l c m d   - Q u e r y   " C R E A T E   L O G I N   [ $ S Q L U s e r ]   F R O M   W I N D O W S ; "   - S e r v e r I n s t a n c e   " l o c a l h o s t " } C a t c h { }  
 	 	 	 	 	 T r y { I n v o k e - S q l c m d   - Q u e r y   " A L T E R   S E R V E R   R O L E   [ d b c r e a t o r ]   A D D   M E M B E R   [ $ S Q L U s e r ] ; "   - S e r v e r I n s t a n c e   " l o c a l h o s t " } C a t c h { }  
 	 	 	 	 }  
 	 	 	 	 E l s e  
 	 	 	 	 {  
 	 	 	 	 	 W r i t e - H o s t   " ` t S Q L   I n s t a n c e   M S S Q L S E R V E R   A l r e a d y   E x i s t s "   - F o r e g r o u n d C o l o r   D a r k R e d  
 	 	 	 	 }  
 	 	 	 }  
 	 	 }  
 	 	  
 	 	 #   S t a g e   &   I n s t a l l   S Q L   C l i e n t  
 	 	 F o r ( $ k = 0 ; $ k   - l t   $ R D S C B C o m p u t e r N a m e . C o u n t ; $ k + + )  
 	 	 {  
 	 	 	 $ R D S C B C o m p u t e r N a m e X   =   $ R D S C B C o m p u t e r N a m e [ $ k ]  
 	 	 	 W r i t e - H o s t   " I n s t a l l i n g   S Q L   2 0 1 2   S P 1   C l i e n t   t o   $ R D S C B C o m p u t e r N a m e X "  
 	 	 	  
 	 	 	 #   S t a g e   I n s t a l l e r    
 	 	 	 I f ( ! ( T e s t - P a t h   " \ \ $ R D S C B C o m p u t e r N a m e X \ c $ \ S t a g i n g \ S Q L _ S e r v e r _ 2 0 1 2 _ S P 1 _ N a t i v e _ C l i e n t . m s i " ) )  
 	 	 	 {  
 	 	 	 	 W r i t e - H o s t   " ` t S t a g i n g   S Q L   C l i e n t   I n s t a l l e r "  
 	 	 	 	 N e w - I t e m   - P a t h   " \ \ $ R D S C B C o m p u t e r N a m e X \ c $ \ S t a g i n g \ "   - I t e m T y p e   D i r e c t o r y   - F o r c e   - E r r o r A c t i o n   S i l e n t l y C o n t i n u e   |   O u t - N u l l  
 	 	 	 	 C o p y - I t e m   " $ R o o t W o r k i n g D i r \ C o p y - S Q L \ S Q L _ S e r v e r _ 2 0 1 2 _ S P 1 _ N a t i v e _ C l i e n t . m s i "   " \ \ $ R D S C B C o m p u t e r N a m e X \ c $ \ S t a g i n g \ "   - R e c u r s e   - F o r c e   - E r r o r A c t i o n   S i l e n t l y C o n t i n u e   |   O u t - N u l l  
 	 	 	 }  
 	 	  
 	 	 	 #   V a l i d a t e / I n s t a l l   S Q L   C l i e n t  
 	 	 	 E n a b l e C r e d S S P S e r v e r   - C o m p u t e r N a m e   $ R D S C B C o m p u t e r N a m e X   - C r e d e n t i a l   $ D o m a i n A d m i n c r e d e n t i a l s  
 	 	 	 I n v o k e - C o m m a n d   - C o m p u t e r N a m e   $ R D S C B C o m p u t e r N a m e X   - A u t h e n t i c a t i o n   C r e d s s p   - C r e d e n t i a l   $ D o m a i n A d m i n c r e d e n t i a l s   - S c r i p t B l o c k   {  
 	 	 	 	 I f ( ! ( T e s t - P a t h   " C : \ P r o g r a m   F i l e s \ M i c r o s o f t   S Q L   S e r v e r \ 1 1 0 \ K e y F i l e \ 1 0 3 3 \ s q l n c l i _ k e y f i l e . d l l " ) )  
 	 	 	 	 {  
 	 	 	 	 	 P o w e r s h e l l . e x e   ' m s i e x e c . e x e   / q   / i   " C : \ S t a g i n g \ S Q L _ S e r v e r _ 2 0 1 2 _ S P 1 _ N a t i v e _ C l i e n t . m s i "   I A C C E P T S Q L N C L I L I C E N S E T E R M S = Y e s '  
 	 	 	 	 	 # m s i e x e c . e x e   / q   / i   " C : \ S t a g i n g \ S Q L _ S e r v e r _ 2 0 1 2 _ S P 1 _ N a t i v e _ C l i e n t . m s i "   I A C C E P T S Q L N C L I L I C E N S E T E R M S = Y e s  
 	 	 	 	 	  
 	 	 	 	 	 #   C o n f i r m   I n s t a l l a t i o n  
 	 	 	 	 	 I f ( T e s t - P a t h   " C : \ P r o g r a m   F i l e s \ M i c r o s o f t   S Q L   S e r v e r \ 1 1 0 \ K e y F i l e \ 1 0 3 3 \ s q l n c l i _ k e y f i l e . d l l " )  
 	 	 	 	 	 {  
 	 	 	 	 	 	 W r i t e - H o s t   " ` t S u c c e s s f u l l y   I n s t a l l e d   S Q L   C l i e n t "   - F o r e g r o u n d C o l o r   D a r k G r e e n  
 	 	 	 	 	 }  
 	 	 	 	 	 E l s e  
 	 	 	 	 	 {  
 	 	 	 	 	 	 W r i t e - H o s t   " ` t E R R O R :   F a i l e d   I n s t a l l a t i o n "   - F o r e g r o u n d C o l o r   R e d  
 	 	 	 	 	 }  
 	 	 	 	 }  
 	 	 	 	 E l s e  
 	 	 	 	 {  
 	 	 	 	 	 W r i t e - H o s t   " ` t S Q L   C l i e n t   A l r e a d y   I n s t a l l e d "   - F o r e g r o u n d C o l o r   D a r k R e d  
 	 	 	 	 }  
 	 	 	 }  
 	 	 	  
 	 	 	  
 	 	 	 #   C h e c k   G r o u p   M e m b e r s h i p  
 	 	 	 $ G r o u p M e m b e r s h i p   =   I n v o k e - C o m m a n d   - C o m p u t e r N a m e   $ D C C o m p u t e r N a m e 1   - C r e d e n t i a l   $ D o m a i n A d m i n c r e d e n t i a l s   - S c r i p t B l o c k   { ( G e t - A D G r o u p M e m b e r   - I d e n t i t y   " R D S   C o n n e c t i o n   B r o k e r s " ) . N a m e }  
 	 	 	  
 	 	 	 #   A d d   E a c h   C o n n e c t i o n   B r o k e r   t o   A D   G r o u p   " R D S   C o n n e c t i o n   B r o k e r s "   &   R E B O O T  
 	 	 	 W r i t e - H o s t   " ` t A d d i n g   $ R D S C B C o m p u t e r N a m e X ` $   t o   A D   G r o u p   [ R D S   C o n n e c t i o n   B r o k e r s ] "  
 	 	 	 I f ( $ G r o u p M e m b e r s h i p   - i n o t c o n t a i n s   $ R D S C B C o m p u t e r N a m e X )  
 	 	 	 {  
 	 	 	 	 I n v o k e - C o m m a n d   - C o m p u t e r N a m e   $ D C C o m p u t e r N a m e 1   - C r e d e n t i a l   $ D o m a i n A d m i n c r e d e n t i a l s   - S c r i p t B l o c k   {  
 	 	 	 	 	 A d d - A D G r o u p M e m b e r   - I d e n t i t y   " R D S   C o n n e c t i o n   B r o k e r s "   - M e m b e r s   $ u s i n g : R D S C B C o m p u t e r N a m e X ` $  
 	 	 	 	 } 	  
 	 	 	 	  
 	 	 	 	 W r i t e - H o s t   " R e b o o t i n g   $ R D S C B C o m p u t e r N a m e X   t o   A p p l y   N e w   G r o u p   M e m b e r s h i p "  
 	 	 	 	 R e s t a r t - C o m p u t e r   - C o m p u t e r N a m e   $ R D S C B C o m p u t e r N a m e X   - W a i t   - F o r   P o w e r S h e l l   - C r e d e n t i a l   $ D o m a i n A d m i n c r e d e n t i a l s   - F o r c e  
 	 	 	 	 W a i t C o m p u t e r O n l i n e   - C o m p u t e r N a m e   $ R D S C B C o m p u t e r N a m e X   - W a i t S e r v i c e   R D M S  
 	 	 	 }  
 	 	 	 E l s e  
 	 	 	 {  
 	 	 	 	 W r i t e - H o s t   " ` t A l r e a d y   a   M e m b e r   o f   A D   G r o u p   [ R D S   C o n n e c t i o n   B r o k e r s ] "   - F o r e g r o u n d C o l o r   D a r k R e d  
 	 	 	 }  
 	 	 	  
  
 	 	  
 	 	 }  
 	 	  
 	 	  
 	 	 #   A d d   A d d i t i o n a l   W e b   A c c e s s   t o   D e p l o y m e n t    
 	 	 F o r ( $ k = 1 ; $ k   - l t   $ R D S W A C o m p u t e r N a m e . C o u n t ; $ k + + )  
 	 	 {  
 	 	 	 $ R D S W A C o m p u t e r N a m e X   =   $ R D S W A C o m p u t e r N a m e [ $ k ]  
 	 	 	 I n v o k e - C o m m a n d   - C o m p u t e r N a m e   $ R D S C B C o m p u t e r N a m e 1   - A u t h e n t i c a t i o n   C r e d s s p   - C r e d e n t i a l   $ D o m a i n A d m i n c r e d e n t i a l s   - S c r i p t B l o c k   {  
 	 	 	 	 W r i t e - H o s t   " ` t A d d i n g   $ u s i n g : R D S W A C o m p u t e r N a m e X   a s   R D S   W e b   A c c e s s "  
 	 	 	 	 A d d - R D S e r v e r   - S e r v e r   " $ u s i n g : R D S W A C o m p u t e r N a m e X ` . $ u s i n g : D o m a i n N a m e "   - C o n n e c t i o n B r o k e r   " $ u s i n g : R D S C B C o m p u t e r N a m e 1 ` . $ u s i n g : D o m a i n N a m e "   - R o l e   " R D S - W E B - A C C E S S "   - E r r o r A c t i o n   S i l e n t l y C o n t i n u e   |   O u t - N u l l  
 	 	 	 	  
 	 	 	 }  
 	 	 } 	  
  
 	 	  
 	 	 #   A d d   A d d i t i o n a l   S e s s i o n   H o s t s   t o   D e p l o y m e n t   &   C o l l e c t i o n  
 	 	 F o r ( $ k = 1 ; $ k   - l t   $ R D S S H C o m p u t e r N a m e . C o u n t ; $ k + + )  
 	 	 {  
 	 	 	 $ R D S S H C o m p u t e r N a m e X   =   $ R D S S H C o m p u t e r N a m e [ $ k ]  
 	 	 	 I n v o k e - C o m m a n d   - C o m p u t e r N a m e   $ R D S C B C o m p u t e r N a m e 1   - A u t h e n t i c a t i o n   C r e d s s p   - C r e d e n t i a l   $ D o m a i n A d m i n c r e d e n t i a l s   - S c r i p t B l o c k   {  
 	 	 	 	 W r i t e - H o s t   " ` t A d d i n g   $ u s i n g : R D S S H C o m p u t e r N a m e X   a s   R D S   S e s s i o n   H o s t "  
 	 	 	 	 A d d - R D S e r v e r   - S e r v e r   " $ u s i n g : R D S S H C o m p u t e r N a m e X ` . $ u s i n g : D o m a i n N a m e "   - C o n n e c t i o n B r o k e r   " $ u s i n g : R D S C B C o m p u t e r N a m e 1 ` . $ u s i n g : D o m a i n N a m e "   - R o l e   " R D S - R D - S E R V E R "   - E r r o r A c t i o n   S i l e n t l y C o n t i n u e   |   O u t - N u l l  
 	 	 	 	 A d d - R D S e s s i o n H o s t   - C o l l e c t i o n N a m e   $ u s i n g : C o l l e c t i o n N a m e   - S e s s i o n H o s t   " $ u s i n g : R D S S H C o m p u t e r N a m e X ` . $ u s i n g : D o m a i n N a m e "   - C o n n e c t i o n B r o k e r   " $ u s i n g : R D S C B C o m p u t e r N a m e 1 ` . $ u s i n g : D o m a i n N a m e "   - E r r o r A c t i o n   S i l e n t l y C o n t i n u e   |   O u t - N u l l  
 	 	 	 }  
 	 	  
 	 	 }  
  
  
 	 	 W r i t e - H o s t   " C o n f i g u r i n g   C o n n e c t i o n   B r o k e r s   f o r   H / A " 	 	  
  
 	 	 #   S e t   D N S   R R   F Q D N   I f   N o   D o m a i n   S u f f i x   i s   p r o v i d e d  
 	 	 I f ( $ R D S D N S R R N a m e   - i n o t l i k e   " * . * " )  
 	 	 {  
 	 	 	 #   I s   N o t   F u l l y   Q u a l i f i e d  
 	 	 	 $ R D S D N S R R F Q D N   =   " $ R D S D N S R R N a m e ` . $ D o m a i n N a m e "  
 	 	 }  
 	 	 E l s e  
 	 	 {  
 	 	 	 $ R D S D N S R R F Q D N   =   $ R D S D N S R R N a m e  
 	 	 }  
  
 	 	 #   G e t   F i r s t   S e t   o f   T e x t    
 	 	 $ R D S D N S R R N a m e O n l y   =   $ R D S D N S R R F Q D N . S p l i t ( " . " ) [ 0 ]  
 	 	  
 	 	 #   F i n d   Z o n e   N a m e   f o r   D N S   ( R e q u i r e d   i f   S u f f i x   i s   D i f f e r e n t   t h a n   t h e   D o m a i n   N a m e )  
 	 	 $ R D S D N S R R Z o n e   =   $ R D S D N S R R F Q D N . S u b s t r i n g ( $ R D S D N S R R F Q D N . I n d e x O f ( " . " ) + 1 )  
 	 	 W r i t e - H o s t   " C r e a t i n g   D N S   R R   R e c o r d :   $ R D S D N S R R F Q D N "  
 	 	  
 	 	 #   G e t   I P   S u b n e t   o f   C B 1  
 	 	 $ G e t I P I n f o   =   ( T e s t - C o n n e c t i o n   - C o m p u t e r N a m e   $ R D S C B C o m p u t e r N a m e 1   - C o u n t   1 ) . I P V 4 A d d r e s s   |   S e l e c t - O b j e c t   { $ _ . I P A d d r e s s T o S t r i n g }   - E x p a n d P r o p e r t y   I P A d d r e s s T o S t r i n g  
 	 	 $ G e t I P I n f o S p l i t   =   $ G e t I P I n f o . S p l i t ( " . " )  
 	 	 $ D N S R R I P A d d r e s s   =   $ G e t I P I n f o S p l i t [ 0 ] + " . " + $ G e t I P I n f o S p l i t [ 1 ] + " . " + $ G e t I P I n f o S p l i t [ 2 ] + " . " + " 2 0 "  
 	  
 	 	 I n v o k e - C o m m a n d   - C o m p u t e r N a m e   $ D C C o m p u t e r N a m e 1   - C r e d e n t i a l   $ D o m a i n A d m i n c r e d e n t i a l s   - S c r i p t B l o c k   {  
 	 	 	 #   C r e a t e   D N S   Z o n e  
 	 	 	 T r y { A d d - D n s S e r v e r P r i m a r y Z o n e   - N a m e   $ u s i n g : R D S D N S R R Z o n e   - R e p l i c a t i o n S c o p e   " F o r e s t "   - P a s s T h r u } C a t c h { }  
 	 	 	  
 	 	 	 #   C r e a t e   D N S   R e c o r d  
 	 	 	 A d d - D n s S e r v e r R e s o u r c e R e c o r d A   - N a m e   $ u s i n g : R D S D N S R R N a m e O n l y   - Z o n e N a m e   $ u s i n g : R D S D N S R R Z o n e   - A l l o w U p d a t e A n y   - I P v 4 A d d r e s s   $ u s i n g : D N S R R I P A d d r e s s   - T i m e T o L i v e   0 1 : 0 0 : 0 0   - E r r o r A c t i o n   S i l e n t l y C o n t i n u e  
 	 	 }  
 	 	  
  
 	 	 #   C o n f i g u r e   C B   H / A  
 	 	 I n v o k e - C o m m a n d   - C o m p u t e r N a m e   $ R D S C B C o m p u t e r N a m e 1   - A u t h e n t i c a t i o n   C r e d s s p   - C r e d e n t i a l   $ D o m a i n A d m i n c r e d e n t i a l s   - S c r i p t B l o c k   {  
 	 	 	 $ V a l i d a t e C B H A   =   G e t - R D C o n n e c t i o n B r o k e r H i g h A v a i l a b i l i t y  
 	 	 	 #   C o n f i g u r e   H / A   f o r   t h e   F i r s t   t i m e   o r   i f   C l i e n t A c c e s s N a m e   D o e s n   M a t c h   D N S R R   N a m e  
 	 	 	 I f ( $ V a l i d a t e C B H A   - i e q   $ n u l l )  
 	 	 	 {  
 	 	 	 	 S e t - R D C o n n e c t i o n B r o k e r H i g h A v a i l a b i l i t y   - C l i e n t A c c e s s N a m e   $ u s i n g : R D S D N S R R F Q D N   - C o n n e c t i o n B r o k e r   " $ u s i n g : R D S C B C o m p u t e r N a m e 1 ` . $ u s i n g : D o m a i n N a m e "   - D a t a b a s e C o n n e c t i o n S t r i n g   " D R I V E R = S Q L   S e r v e r   N a t i v e   C l i e n t   1 1 . 0 ; S E R V E R = $ u s i n g : R D S S Q L C o m p u t e r N a m e ; T r u s t e d _ C o n n e c t i o n = Y e s ; A P P = R e m o t e   D e s k t o p   S e r v i c e s   C o n n e c t i o n   B r o k e r ; D a t a b a s e = R D S C B H A "   - D a t a b a s e F i l e P a t h   " C : \ P r o g r a m   F i l e s \ M i c r o s o f t   S Q L   S e r v e r \ M S S Q L 1 1 . M S S Q L S E R V E R \ M S S Q L \ D A T A \ R D S C B H A . m d f " 	  
 	 	 	 }  
 	 	 	 E l s e  
 	 	 	 {  
 	 	 	 	 W r i t e - H o s t   " ` t D N S   R e c o r d   A l r e a d y   E x i s t s "   - F o r e g r o u n d C o l o r   D a r k R e d  
 	 	 	 }  
 	 	 	 I f ( $ V a l i d a t e C B H A . C l i e n t A c c e s s N a m e   - i n o t m a t c h   $ u s i n g : R D S D N S R R F Q D N )  
 	 	 	 {  
 	 	 	 	 S e t - R D C l i e n t A c c e s s N a m e   - C l i e n t A c c e s s N a m e   $ u s i n g : R D S D N S R R F Q D N   - C o n n e c t i o n B r o k e r   " $ u s i n g : R D S C B C o m p u t e r N a m e 1 ` . $ u s i n g : D o m a i n N a m e "  
 	 	 	 }  
 	 	 	  
 	 	 }  
 	 	  
 	 	 #   S e t   S Q L   U s e r   a s   D B O   o f   D a t a b a s e   ( R D S   D B   D e p l o y m e n t   O v e r w r i t e s   S e t t i n g s )  
 	 	 I n v o k e - C o m m a n d   - C o m p u t e r N a m e   $ R D S S Q L C o m p u t e r N a m e   - C r e d e n t i a l   $ D o m a i n A d m i n c r e d e n t i a l s   - S c r i p t B l o c k   { 	  
 	 	 	 $ D o m a i n N a m e S p l i t   =   ( $ u s i n g : D o m a i n N a m e ) . S p l i t ( " . " ) [ 0 ]  
 	 	 	 $ S Q L U s e r   =   " $ D o m a i n N a m e S p l i t \ R D S   C o n n e c t i o n   B r o k e r s "  
 	 	 	 I n v o k e - S q l c m d   - Q u e r y   " U S E   [ R D S C B H A ] ; C R E A T E   U S E R   [ $ S Q L U s e r ]   f r o m   l o g i n   [ $ S Q L U s e r ] ; "   - S e r v e r I n s t a n c e   " l o c a l h o s t "     - E r r o r A c t i o n   S i l e n t l y C o n t i n u e    
 	 	 	 I n v o k e - S q l c m d   - Q u e r y   " U S E   [ R D S C B H A ] ; e x e c   s p _ a d d r o l e m e m b e r   ' d b _ o w n e r ' ,   [ $ S Q L U s e r ] ; "   - S e r v e r I n s t a n c e   " l o c a l h o s t "     - E r r o r A c t i o n   S i l e n t l y C o n t i n u e  
 	 	 }  
  
  
 	 	  
 	 	 #   A d d   A d d i t i o n a l   C o n n e c t i o n   B r o k e r s   t o   D e p l o y m e n t   &   C o n f i g u r e   F o r   H / A  
 	 	 F o r ( $ k = 1 ; $ k   - l t   $ R D S C B C o m p u t e r N a m e . C o u n t ; $ k + + )  
 	 	 {  
 	 	 	 $ R D S C B C o m p u t e r N a m e X   =   $ R D S C B C o m p u t e r N a m e [ $ k ]  
 	 	 	 I n v o k e - C o m m a n d   - C o m p u t e r N a m e   $ R D S C B C o m p u t e r N a m e 1   - A u t h e n t i c a t i o n   C r e d s s p   - C r e d e n t i a l   $ D o m a i n A d m i n c r e d e n t i a l s   - S c r i p t B l o c k   {  
 	 	 	 	 W r i t e - H o s t   " A d d i n g   $ u s i n g : R D S C B C o m p u t e r N a m e X   a s   C o n n e c t i o n   B r o k e r "  
 	 	 	 	 A d d - R D S e r v e r   - S e r v e r   " $ u s i n g : R D S C B C o m p u t e r N a m e X ` . $ u s i n g : D o m a i n N a m e "   - C o n n e c t i o n B r o k e r   " $ u s i n g : R D S C B C o m p u t e r N a m e 1 ` . $ u s i n g : D o m a i n N a m e "   - R o l e   " R D S - C O N N E C T I O N - B R O K E R "   - E r r o r A c t i o n   S i l e n t l y C o n t i n u e  
 	 	 	 	  
 	 	 	 }  
 	 	  
 	 	 }  
 	 	  
 	 	  
 	 	 #   C o n f i g u r e   G a t e w a y   R o l e s   i f   i t   E x i s t s  
 	 	 I f ( $ R D S G W C o m p u t e r N a m e . c o u n t   - g t   0 )  
 	 	 {  
 	 	 	 W r i t e - H o s t   " C o n f i g u r i n g   R D   G a t e w a y s "  
 	 	 	  
 	 	 	 F o r ( $ k = 0 ; $ k   - l t   $ R D S G W C o m p u t e r N a m e . C o u n t ; $ k + + )  
 	 	 	 {  
 	 	 	 	 $ R D S G W C o m p u t e r N a m e X   =   $ R D S G W C o m p u t e r N a m e [ $ k ]  
 	 	 	 	  
 	 	 	 	 #   A d d   A d d i t i o n a l   G a t e w a y s   t o   D e p l o y m e n t  
 	 	 	 	 I n v o k e - C o m m a n d   - C o m p u t e r N a m e   $ R D S C B C o m p u t e r N a m e 1   - A u t h e n t i c a t i o n   C r e d s s p   - C r e d e n t i a l   $ D o m a i n A d m i n c r e d e n t i a l s   - S c r i p t B l o c k   {  
 	 	 	 	 	 W r i t e - H o s t   " A d d i n g   $ u s i n g : R D S G W C o m p u t e r N a m e X   a s   R D S   G a t e w a y "   |   O u t - N u l l  
 	 	 	 	 	 A d d - R D S e r v e r   - S e r v e r   " $ u s i n g : R D S G W C o m p u t e r N a m e X ` . $ u s i n g : D o m a i n N a m e "   - C o n n e c t i o n B r o k e r   " $ u s i n g : R D S C B C o m p u t e r N a m e 1 ` . $ u s i n g : D o m a i n N a m e "   - R o l e   " R D S - G A T E W A Y "   - G a t e w a y E x t e r n a l F q d n   $ u s i n g : R D S D N S R R F Q D N   - E r r o r A c t i o n   S i l e n t l y C o n t i n u e  
 	 	 	 	 } 	  
  
 	 	 	 	 #   F o r   t h e   F i r s t   G a t e w a y   S e r v e r   O N L Y  
 	 	 	 	 I f ( $ k   - e q   0 )  
 	 	 	 	 {  
 	 	 	 	 	  
 	 	 	 	 	 I n v o k e - C o m m a n d   - C o m p u t e r N a m e   $ R D S C B C o m p u t e r N a m e 1   - A u t h e n t i c a t i o n   C r e d s s p   - C r e d e n t i a l   $ D o m a i n A d m i n c r e d e n t i a l s   - S c r i p t B l o c k   {  
 	 	 	 	 	 	  
 	 	 	 	 	 	 #   C r e a t e   S S L   C e r t i f i c a t e s   &   I m p o r t   i f   T h e y   D o n ' t   E x i s t   i n   t h e   R D S   D e p l o y m e n t   S e t t i n g s  
 	 	 	 	 	 	 W r i t e - H o s t   " C h e c k i n g   S S L   C e r t i f i c a t e s   f o r   R D S   D e p l o y m e n t "  
  
 	 	 	 	 	 	 #   G e t   C e r t i f i c a t e s   f r o m   C o m p u t e r   a n d   R D S   S t o r e   t o   C o m p a r e  
 	 	 	 	 	 	 I f ( ! ( T e s t - P a t h   " C : \ S t a g i n g \ S S L " ) ) { N e w - I t e m   - I t e m T y p e   D i r e c t o r y   " C : \ S t a g i n g \ S S L "   - F o r c e }  
 	 	 	 	 	 	 $ C o m p u t e r S S L T h u m b p r i n t   =   G e t - C h i l d I t e m   - p a t h   " C e r t : \ L o c a l M a c h i n e \ M y "   |   ? { $ _ . S u b j e c t   - i m a t c h   $ u s i n g : R D S D N S R R F Q D N }  
 	 	 	 	 	 	 $ R D C e r t i f i c a t e L i s t   =   G e t - R D C e r t i f i c a t e  
 	 	 	 	 	 	  
 	 	 	 	 	 	 $ C e r t i f i c a t e R o l e L i s t   =   @ ( " R D G a t e w a y " , " R D W e b A c c e s s " , " R D R e d i r e c t o r " , " R D P u b l i s h i n g " )  
 	 	 	 	 	 	 I f ( $ C o m p u t e r S S L T h u m b p r i n t . S u b j e c t   - i m a t c h   $ u s i n g : R D S D N S R R F Q D N )  
 	 	 	 	 	 	 {  
 	 	 	 	 	 	 	 $ T h u m b p r i n t M a t c h   =   @ ( )  
 	 	 	 	 	 	 	  
 	 	 	 	 	 	 	 F o r e a c h ( $ C e r t i f i c a t e R o l e   i n   $ C e r t i f i c a t e R o l e L i s t )  
 	 	 	 	 	 	 	 {  
 	 	 	 	 	 	 	 	 I f ( ( $ R D C e r t i f i c a t e L i s t   |   ? { $ _ . R o l e   - i e q   $ C e r t i f i c a t e R o l e } ) . T h u m b p r i n t   - i m a t c h   $ C o m p u t e r S S L T h u m b p r i n t . T h u m b p r i n t )  
 	 	 	 	 	 	 	 	 {  
 	 	 	 	 	 	 	 	 	 $ T h u m b p r i n t M a t c h   + =   $ t r u e  
 	 	 	 	 	 	 	 	 }  
 	 	 	 	 	 	 	 	 E l s e  
 	 	 	 	 	 	 	 	 {  
 	 	 	 	 	 	 	 	 	 $ T h u m b p r i n t M a t c h   + =   $ f a l s e  
 	 	 	 	 	 	 	 	 }  
 	 	 	 	 	 	 	 }  
 	 	 	 	 	 	 }  
 	 	 	 	 	 	 E l s e  
 	 	 	 	 	 	 {  
 	 	 	 	 	 	 	 $ T h u m b p r i n t M a t c h   =   $ f a l s e  
 	 	 	 	 	 	 }  
 	 	 	 	 	 	  
 	 	 	 	 	 	  
 	 	 	 	 	 	 I f ( $ T h u m b p r i n t M a t c h   - i c o n t a i n s   $ F a l s e )  
 	 	 	 	 	 	 {  
 	 	 	 	 	 	 	 W r i t e - H o s t   " ` t G e n e r a t i n g   N e w   S S L   C e r t i f i c a t e   [ $ u s i n g : R D S D N S R R F Q D N ] "  
 	 	 	 	 	 	 	 $ P F X P a t h   =   " C : \ S t a g i n g \ S S L \ R D S C e r t i f i c a t e - P F X . p f x "  
 	 	 	 	 	 	 	 $ C E R P a t h   =   " C : \ S t a g i n g \ S S L \ R D S C e r t i f i c a t e - C E R . c e r "  
 	 	 	 	 	 	 	 $ P F X P a s s w o r d   =   "PASSWORD"  
 	 	 	 	 	 	 	 $ I m p o r t P a s s w o r d   =   'PASSWORD'   |   C o n v e r t T o - S e c u r e S t r i n g   - A s P l a i n T e x t   - F o r c e 	 	 	 	 	 	 	  
 	 	 	 	 	 	 	  
 	 	 	 	 	 	 	 #   R e m o v e   E x i s t i n g / S t a l e   C e r t i f i c a t e s  
 	 	 	 	 	 	 	 ( G e t - C h i l d I t e m   - p a t h   C e r t : \ L o c a l M a c h i n e \ M y )   |   ? { $ _ . S u b j e c t   - i m a t c h   $ u s i n g : R D S D N S R R F Q D N }   |   R e m o v e - I t e m   - F o r c e  
 	 	 	 	 	 	 	 ( G e t - C h i l d I t e m   - p a t h   C e r t : \ L o c a l M a c h i n e \ R o o t )   |   ? { $ _ . S u b j e c t   - i m a t c h   $ u s i n g : R D S D N S R R F Q D N }   |   R e m o v e - I t e m   - F o r c e  
 	 	 	 	 	 	 	  
 	 	 	 	 	 	 	 #   C r e a t e   P F X   &   C E R  
 	 	 	 	 	 	 	 N e w - R D C e r t i f i c a t e   - R o l e   R D W e b A c c e s s   - D n s N a m e   $ u s i n g : R D S D N S R R F Q D N   - P a s s w o r d   $ I m p o r t P a s s w o r d   - E x p o r t P a t h   $ P F X P a t h   - C o n n e c t i o n B r o k e r   " $ u s i n g : R D S C B C o m p u t e r N a m e 1 ` . $ u s i n g : D o m a i n N a m e "   - F o r c e   |   O u t - N u l l  
 	 	 	 	 	 	 	 ( G e t - C h i l d I t e m   - p a t h   C e r t : \ L o c a l M a c h i n e \ M y )   |   ? { $ _ . S u b j e c t   - i m a t c h   $ u s i n g : R D S D N S R R F Q D N }   |   E x p o r t - C e r t i f i c a t e   - T y p e   C E R T   - F i l e P a t h   $ C E R P a t h  
 	 	 	 	 	 	 	  
 	 	 	 	 	 	 	 F o r e a c h ( $ C e r t i f i c a t e R o l e   i n   $ C e r t i f i c a t e R o l e L i s t )  
 	 	 	 	 	 	 	 {  
 	 	 	 	 	 	 	 	 W r i t e - H o s t   " ` t I m p o r t i n g   C e r t i f i c a t e   f o r :   $ C e r t i f i c a t e R o l e "  
 	 	 	 	 	 	 	 	 S e t - R D C e r t i f i c a t e   - R o l e   $ C e r t i f i c a t e R o l e   - P a s s w o r d   $ I m p o r t P a s s w o r d   - I m p o r t P a t h   $ P F X P a t h   - C o n n e c t i o n B r o k e r   " $ u s i n g : R D S C B C o m p u t e r N a m e 1 ` . $ u s i n g : D o m a i n N a m e "   - F o r c e  
 	 	 	 	 	 	 	 }  
 	 	 	 	 	 	 }  
 	 	 	 	 	 	 E l s e  
 	 	 	 	 	 	 {  
 	 	 	 	 	 	 	 W r i t e - H o s t   " ` t A L L   C E R T I F I C A T E S   M A T C H "   - F o r e g r o u n d C o l o r   D a r k G r e e n  
 	 	 	 	 	 	 }  
 	 	 	 	 	 }  
 	 	 	 	 }  
 	 	 	 } 	 	  
 	 	 }  
  
  
  
 	 	 #   C o n f i g u r e   N L B   C l u s t e r   f o r   C o n n e c t i o n   B r o k e r s  
 	 	 W r i t e - H o s t   " C o n f i g u r i n g   N L B   C l u s t e r "  
 	 	 F o r ( $ k = 0 ; $ k   - l t   $ R D S C B C o m p u t e r N a m e . C o u n t ; $ k + + )  
 	 	 {  
 	 	 	  
 	 	 	 $ R D S C B C o m p u t e r N a m e X   =   $ R D S C B C o m p u t e r N a m e [ $ k ]  
 	 	 	 I n v o k e - C o m m a n d   - C o m p u t e r N a m e   $ R D S C B C o m p u t e r N a m e X   - A u t h e n t i c a t i o n   C r e d s s p   - C r e d e n t i a l   $ D o m a i n A d m i n c r e d e n t i a l s   - S c r i p t B l o c k   {  
 	 	 	 	 #   V a l i d a t e / I n s t a l l   N L B   C o m p o n e n t s  
 	 	 	 	 $ R D S C o m p o n e n t L i s t   =   @ ( " N L B " , " R S A T - N L B " )  
 	 	 	 	 F o r e a c h ( $ R D S C o m p o n e n t   i n   $ R D S C o m p o n e n t L i s t )  
 	 	 	 	 {  
 	 	 	 	 	 I f ( ! ( ( G e t - W i n d o w s F e a t u r e   $ R D S C o m p o n e n t ) . I n s t a l l e d ) )  
 	 	 	 	 	 {  
 	 	 	 	 	 	 A d d - W i n d o w s F e a t u r e   $ R D S C o m p o n e n t   |   O u t - N u l l  
 	 	 	 	 	 }  
 	 	 	 	 }  
 	 	 	 	  
 	 	 	 	  
 	 	 	 	 #   V a l i d a t e / I n s t a l l   N e w   N L B   C l u s t e r   f o r   F i r s t   C B   N o d e  
 	 	 	 	 I f ( $ u s i n g : k   - i e q   0 )  
 	 	 	 	 {  
 	 	 	 	 	 $ V a l i d a t e N L B C l u s t e r   =   G e t - N L B C l u s t e r   - E r r o r A c t i o n   S i l e n t l y C o n t i n u e  
 	 	 	 	 	 I f ( $ V a l i d a t e N L B C l u s t e r . N a m e   - i n o t m a t c h   " R D S - C l u s t e r " )  
 	 	 	 	 	 {  
 	 	 	 	 	 	 W r i t e - H o s t   " C r e a t i n g   N L B   C l u s t e r "  
 	 	 	 	 	 	 N e w - N l b C l u s t e r   - C l u s t e r N a m e   " R D S - C l u s t e r "   - I n t e r f a c e N a m e   E t h e r n e t   - C l u s t e r P r i m a r y I P   $ u s i n g : D N S R R I P A d d r e s s   - S u b n e t M a s k   " 2 5 5 . 2 5 5 . 2 5 5 . 0 "   - O p e r a t i o n M o d e   M u l t i c a s t  
 	 	 	 	 	 }  
 	 	 	 	 	 E l s e  
 	 	 	 	 	 {  
 	 	 	 	 	 	 W r i t e - H o s t   " ` t N L B   C l u s t e r   A l r e a d y   E x i s t s "   - F o r e g r o u n d C o l o r   D a r k R e d  
 	 	 	 	 	 	  
 	 	 	 	 	 }  
 	 	 	 	 }  
 	 	 	 	 #   A d d   O t h e r   C B   N o d e s   T o   C l u s t e r  
 	 	 	 	 I f ( $ u s i n g : k   - g t   0 )  
 	 	 	 	 {  
 	 	 	 	 	 $ V a l i d a t e N L B N o d e   =   G e t - N l b C l u s t e r N o d e   - E r r o r A c t i o n   S i l e n t l y C o n t i n u e  
 	 	 	 	 	 I f ( $ V a l i d a t e N L B N o d e . N a m e   - i n o t c o n t a i n s     $ u s i n g : R D S C B C o m p u t e r N a m e X )  
 	 	 	 	 	 { 	  
 	 	 	 	 	 	 W r i t e - H o s t   " A d d i n g   $ u s i n g : R D S C B C o m p u t e r N a m e X   t o   N L B   C l u s t e r "  
 	 	 	 	 	 	 G e t - N l b C l u s t e r   $ u s i n g : R D S C B C o m p u t e r N a m e 1   |   A d d - N l b C l u s t e r N o d e   - N e w N o d e N a m e   $ u s i n g : R D S C B C o m p u t e r N a m e X   - N e w N o d e I n t e r f a c e   E t h e r n e t   - F o r c e  
 	 	 	 	 	 }  
 	 	 	 	 	 E l s e  
 	 	 	 	 	 {  
 	 	 	 	 	 	 W r i t e - H o s t   " ` t A l r e a d y   M e m b e r   o f   N L B   C l u s t e r :   $ u s i n g : R D S C B C o m p u t e r N a m e X "   - F o r e g r o u n d C o l o r   D a r k R e d  
 	 	 	 	 	 }  
 	 	 	 	 }  
 	 	 	 }  
 	 	 }  
 	 }  
 }  
  
  
  
  
  
  
 F u n c t i o n   E n a b l e C r e d S S P S e r v e r  
 {  
 	 P a r a m (  
 	 $ C o m p u t e r N a m e ,  
 	 $ C r e d e n t i a l s  
 	 )  
 	 # W r i t e - H o s t   " E n a b l i n g   C r e d S S P   S e r v e r   o n   $ C o m p u t e r N a m e "  
 	 $ V a l i d a t e W S M a n C r e d S S P   =   I n v o k e - C o m m a n d   - C o m p u t e r N a m e   $ C o m p u t e r N a m e   - C r e d e n t i a l   $ C r e d e n t i a l s   - S c r i p t B l o c k   { G e t - W S M a n C r e d S S P }  
 	 I f ( $ V a l i d a t e W S M a n C r e d S S P   - i m a t c h   " T h i s   c o m p u t e r   i s   c o n f i g u r e d   t o   r e c e i v e   c r e d e n t i a l s   f r o m   a   r e m o t e   c l i e n t   c o m p u t e r . " )  
 	 {  
 	 	 # W r i t e - H o s t   " C r e d S S P   A l r e a d y   E n a b l e d "   - F o r e g r o u n d C o l o r   D a r k R e d  
 	 }  
 	 e l s e  
 	 {  
 	 	 I n v o k e - C o m m a n d   - C o m p u t e r N a m e   $ C o m p u t e r N a m e   - C r e d e n t i a l   $ C r e d e n t i a l s   - S c r i p t B l o c k   {  
 	 	 E n a b l e - W S M a n C r e d S S P   - R o l e   s e r v e r   - F o r c e    
 	 	 N e w - I t e m   - P a t h   ' h k l m : \ S O F T W A R E \ P o l i c i e s \ M i c r o s o f t \ W i n d o w s \ C r e d e n t i a l s D e l e g a t i o n '   - E r r o r A c t i o n   S i l e n t l y C o n t i n u e    
 	 	 N e w - I t e m P r o p e r t y   - P a t h   ' h k l m : \ S O F T W A R E \ P o l i c i e s \ M i c r o s o f t \ W i n d o w s \ C r e d e n t i a l s D e l e g a t i o n '   - N a m e   A l l o w F r e s h C r e d e n t i a l s W h e n N T L M O n l y   - V a l u e   1   - P r o p e r t y T y p e   D w o r d   - E r r o r A c t i o n   S i l e n t l y C o n t i n u e  
 	 	 N e w - I t e m P r o p e r t y   - P a t h   ' h k l m : \ S O F T W A R E \ P o l i c i e s \ M i c r o s o f t \ W i n d o w s \ C r e d e n t i a l s D e l e g a t i o n '   - N a m e   C o n c a t e n a t e D e f a u l t s _ A l l o w F r e s h N T L M O n l y   - V a l u e   1   - P r o p e r t y T y p e   D w o r d   - E r r o r A c t i o n   S i l e n t l y C o n t i n u e      
 	 	 N e w - I t e m   - P a t h   ' h k l m : \ S O F T W A R E \ P o l i c i e s \ M i c r o s o f t \ W i n d o w s \ C r e d e n t i a l s D e l e g a t i o n \ A l l o w F r e s h C r e d e n t i a l s W h e n N T L M O n l y '   - E r r o r A c t i o n   S i l e n t l y C o n t i n u e    
 	 	 N e w - I t e m P r o p e r t y   - P a t h   ' h k l m : \ S O F T W A R E \ P o l i c i e s \ M i c r o s o f t \ W i n d o w s \ C r e d e n t i a l s D e l e g a t i o n \ A l l o w F r e s h C r e d e n t i a l s W h e n N T L M O n l y '   - N a m e   " 1 "   - V a l u e   " w s m a n / * "   - E r r o r A c t i o n   S i l e n t l y C o n t i n u e    
 	 	 }   |   O u t - N u l l  
 	 }  
 } 	  
  
  
  
  
  
 F u n c t i o n   E n a b l e C r e d S S P C l i e n t  
 {  
  
  
 	 I f ( ( G e t - W S M a n C r e d S S P )   - i c o n t a i n s   " T h e   m a c h i n e   i s   c o n f i g u r e d   t o   a l l o w " )  
 	 {  
 	 	 # W r i t e - H o s t   " C r e d S S P   i s   A l r e a d y   E n a b l e d "  
 	 }  
 	 e l s e  
 	 {  
 	 	 #   E n a b l e   C r e d S S P   o n   C l i e n t  
 	 	 # W r i t e - H o s t   " E n a b l i n g   C r e d S S P   C l i e n t "  
 	 	 E n a b l e - W S M a n C r e d S S P   - R o l e   c l i e n t   - D e l e g a t e C o m p u t e r   *   - F o r c e    
 	 	 N e w - I t e m   - P a t h   ' h k l m : \ S O F T W A R E \ P o l i c i e s \ M i c r o s o f t \ W i n d o w s \ C r e d e n t i a l s D e l e g a t i o n '    
 	 	 N e w - I t e m P r o p e r t y   - P a t h   ' h k l m : \ S O F T W A R E \ P o l i c i e s \ M i c r o s o f t \ W i n d o w s \ C r e d e n t i a l s D e l e g a t i o n '   - N a m e   A l l o w F r e s h C r e d e n t i a l s W h e n N T L M O n l y   - V a l u e   1   - P r o p e r t y T y p e   D w o r d   - E r r o r A c t i o n   S i l e n t l y C o n t i n u e      
 	 	 N e w - I t e m P r o p e r t y   - P a t h   ' h k l m : \ S O F T W A R E \ P o l i c i e s \ M i c r o s o f t \ W i n d o w s \ C r e d e n t i a l s D e l e g a t i o n '   - N a m e   C o n c a t e n a t e D e f a u l t s _ A l l o w F r e s h N T L M O n l y   - V a l u e   1   - P r o p e r t y T y p e   D w o r d   - E r r o r A c t i o n   S i l e n t l y C o n t i n u e      
 	 	 N e w - I t e m   - P a t h   ' h k l m : \ S O F T W A R E \ P o l i c i e s \ M i c r o s o f t \ W i n d o w s \ C r e d e n t i a l s D e l e g a t i o n \ A l l o w F r e s h C r e d e n t i a l s W h e n N T L M O n l y '     - E r r o r A c t i o n   S i l e n t l y C o n t i n u e   |   O u t - N u l l    
 	 	 N e w - I t e m P r o p e r t y   - P a t h   ' h k l m : \ S O F T W A R E \ P o l i c i e s \ M i c r o s o f t \ W i n d o w s \ C r e d e n t i a l s D e l e g a t i o n \ A l l o w F r e s h C r e d e n t i a l s W h e n N T L M O n l y '   - N a m e   " 1 "   - V a l u e   " w s m a n / * "   - E r r o r A c t i o n   S i l e n t l y C o n t i n u e    
 	 }  
 }  
  
  
  
  
  
 #   C h e c k   D o m a i n   M e m b e r s h i p  
 F u n c t i o n   J o i n D o m a i n  
 {  
 	 P a r a m (  
 	 $ C o m p u t e r N a m e   =   " " ,  
 	 $ D o m a i n N a m e   =   " "  
 	 ) 	  
 	  
 	 #   G e t   D o m a i n   A d m i n   C r e d e n t i a l s  
 	 $ D o m a i n A d m i n c r e d e n t i a l s   =   G e t D o m a i n A d m i n C r e d e n t i a l s   - D o m a i n N a m e   $ D o m a i n N a m e  
 	  
 	 #   G e t   L o c a l   A d m i n   C r e d e n t i a l s  
   	 $ L A d m i n c r e d e n t i a l s   =   G e t L A d m i n C r e d e n t i a l s   - C o m p u t e r N a m e   $ C o m p u t e r N a m e  
 	  
 	 #   G e t   L i s t   o f   D N S   S e r v e r   I P ' s  
 	 $ S e t D N S S e r v e r I P L i s t   =   G e t D N S S e r v e r I P L i s t   - A l l D N S S e r v e r s  
 	  
 	 #   G e t   I P   o f   F i r s t   D N S   S e r v e r  
 	 $ D N S S e r v e r   =   $ S e t D N S S e r v e r I P L i s t . S p l i t ( " , " ) [ 0 ]  
 	  
 	 #   V a l i d a t e   D o m a i n   M e m b e r s h i p ,   O t h e r w i s e   J o i n  
 	 $ V a l D o m a i n M e m b e r   =   I n v o k e - C o m m a n d   - C o m p u t e r N a m e   $ D N S S e r v e r   - C r e d e n t i a l   $ D o m a i n A d m i n c r e d e n t i a l s   - S c r i p t B l o c k   { ( G e t - A D C o m p u t e r   $ u s i n g : C o m p u t e r N a m e ) . N a m e }   - E r r o r A c t i o n   S i l e n t l y C o n t i n u e  
  
 	 I f ( $ V a l D o m a i n M e m b e r   - i n e   $ C o m p u t e r N a m e )  
 	 { 	  
 	 	 #   J o i n   C o m p u t e r   t o   D o m a i n  
 	 	 I n v o k e - C o m m a n d   - C o m p u t e r N a m e   $ C o m p u t e r N a m e   - C r e d e n t i a l   $ L A d m i n c r e d e n t i a l s   - S c r i p t B l o c k   {  
 	 	 	 #   D e l e t e   U n a t t e n d   F i l e s  
 	 	 	 I f ( T e s t - P a t h   C : \ C o n v e r t - W i n d o w s I m a g e I n f o . t x t ) { R e m o v e - I t e m   C : \ C o n v e r t - W i n d o w s I m a g e I n f o . t x t   - F o r c e }  
 	 	 	 I f ( T e s t - P a t h   C : \ u n a t t e n d . x m l ) { R e m o v e - I t e m   C : \ u n a t t e n d . x m l   - F o r c e }  
 	 	 	  
 	 	 	 #   S e t   T i m e   Z o n e   &   D i s a b l e   U A C  
 	 	 	 t z u t i l   / s   ' E a s t e r n   S t a n d a r d   T i m e '  
 	 	 	 S e t - I t e m P r o p e r t y   - P a t h   r e g i s t r y : : H K E Y _ L O C A L _ M A C H I N E \ S O F T W A R E \ M i c r o s o f t \ W i n d o w s \ C u r r e n t V e r s i o n \ P o l i c i e s \ S y s t e m   - N a m e   E n a b l e L U A   - V a l u e   0  
 	 	 	  
 	 	 	 #   C o n f i g u r e   D N S   o n   R e m o t e   H o s t  
 	 	 	 W r i t e - H o s t   " C o n f i g u r i n g   D N S :   $ u s i n g : S e t D N S S e r v e r I P L i s t "  
 	 	 	 G e t - D n s C l i e n t S e r v e r A d d r e s s   - I n t e r f a c e A l i a s   E t h e r n e t   |   S e t - D n s C l i e n t S e r v e r A d d r e s s   - R e s e t S e r v e r A d d r e s s e s  
 	 	 	 S e t - D N S C l i e n t S e r v e r A d d r e s s   - I n t e r f a c e A l i a s   E t h e r n e t   - S e r v e r A d d r e s s e s   $ u s i n g : S e t D N S S e r v e r I P L i s t  
 	 	 	  
 	 	 	 #   J o i n   C o m p u t e r   t o   D o m a i n  
 	 	 	 W r i t e - H o s t   " J o i n i n g   C o m p u t e r   t o   D o m a i n "  
 	 	 	 A d d - C o m p u t e r   - D o m a i n N a m e   $ u s i n g : D o m a i n N a m e   - C r e d e n t i a l   $ u s i n g : D o m a i n A d m i n c r e d e n t i a l s   - F o r c e  
 	 	 }  
 	 	 W r i t e - H o s t   " R e s t a r t i n g   C o m p u t e r   $ C o m p u t e r N a m e "  
 	 	 R e s t a r t - C o m p u t e r   - C o m p u t e r N a m e   $ C o m p u t e r N a m e   - W a i t   - F o r   P o w e r S h e l l   - C r e d e n t i a l   $ L A d m i n c r e d e n t i a l s   - F o r c e  
 	 }  
 	 E l s e  
 	 {  
 	 	 W r i t e - H o s t   " ` t C o m p u t e r   $ C o m p u t e r N a m e   A l r e a d y   J o i n e d   t o   D o m a i n :   $ D o m a i n N a m e "   - F o r e g r o u n d C o l o r   D a r k R e d  
 	 }  
 }  
  
  
 F u n c t i o n   G e t D N S S e r v e r I P L i s t  
 {  
 	 P a r a m (  
 	 $ D C P R O M O C o m p u t e r n a m e = " " ,  
 	 [ s w i t c h ] $ A l l D N S S e r v e r s ,  
 	 [ s w i t c h ] $ O t h e r D N S S e r v e r s ,  
 	 [ s w i t c h ] $ O t h e r D N S S e r v e r s L o o p  
 	 )  
 	  
 	 $ D N S S e r v e r I P L i s t   =   @ ( )  
 	  
 	 #   G e n e r a t e   F u l l   L i s t   o f   D N S   S e r v e r s  
 	 I f ( $ A l l D N S S e r v e r s . I s P r e s e n t   - i e q   " T r u e " )  
 	 {  
 	 	 F o r e a c h ( $ D N S S e r v e r   i n   $ M e t a D a t a T a b l e   |   ? { $ _ . S e r v e r R o l e   - i m a t c h   " D C D N S " } )  
 	 	 {  
 	 	 	 I f ( $ D N S S e r v e r . S t a t i c I P   - i m a t c h   " . " )  
 	 	 	 {  
 	 	 	 	 $ D N S S e r v e r I P L i s t   + =   $ D N S S e r v e r . S t a t i c I P  
 	 	 	 }  
 	 	 	 E l s e  
 	 	 	 {  
 	 	 	 	 $ D N S S e r v e r I P L i s t   + =   ( T e s t - C o n n e c t i o n   - C o m p u t e r N a m e   $ ( $ D N S S e r v e r . C o m p u t e r N a m e )   - C o u n t   1   - E r r o r A c t i o n   S i l e n t l y C o n t i n u e ) . I P V 4 A d d r e s s   |   S e l e c t - O b j e c t   { $ _ . I P A d d r e s s T o S t r i n g }   - E x p a n d P r o p e r t y   I P A d d r e s s T o S t r i n g  
 	 	 	 }  
 	 	 }  
 	 }  
 	 #   G e n e r a t e   L i s t   o f   D N S   S e r v e r s   O t h e r   T h a n   I t s e l f  
 	 E l s e I f ( $ O t h e r D N S S e r v e r s . I s P r e s e n t   - i e q   " T r u e "   - o r   $ O t h e r D N S S e r v e r s L o o p . I s P r e s e n t   - i e q   " T r u e " )  
 	 {  
 	 	 #   A d d   L o o p   B a c k   F i r s t  
 	 	 I f ( $ O t h e r D N S S e r v e r s L o o p . I s P r e s e n t   - i e q   " T r u e " )  
 	 	 {  
 	 	 	 $ D N S S e r v e r I P L i s t   + =   " 1 2 7 . 0 . 0 . 1 "  
 	 	 }  
 	 	  
 	 	 F o r e a c h ( $ D N S S e r v e r   i n   $ M e t a D a t a T a b l e   |   ? { $ _ . S e r v e r R o l e   - i m a t c h   " D C D N S " } )  
 	 	 {  
 	 	 	 I f ( $ D C P R O M O C o m p u t e r n a m e   - i n e   $ D N S S e r v e r . C o m p u t e r N a m e )  
 	 	 	 {  
 	 	 	 	 I f ( $ D N S S e r v e r . S t a t i c I P   - i m a t c h   " . " )  
 	 	 	 	 {  
 	 	 	 	 	 $ D N S S e r v e r I P L i s t   + =   $ D N S S e r v e r . S t a t i c I P  
 	 	 	 	 }  
 	 	 	 	 E l s e  
 	 	 	 	 {  
 	 	 	 	 	 $ D N S S e r v e r I P L i s t   + =   ( T e s t - C o n n e c t i o n   - C o m p u t e r N a m e   $ ( $ D N S S e r v e r . C o m p u t e r N a m e )   - C o u n t   1   - E r r o r A c t i o n   S i l e n t l y C o n t i n u e ) . I P V 4 A d d r e s s   |   S e l e c t - O b j e c t   { $ _ . I P A d d r e s s T o S t r i n g }   - E x p a n d P r o p e r t y   I P A d d r e s s T o S t r i n g  
 	 	 	 	 }  
 	 	 	 }  
 	 	 }  
 	 }  
 	  
 	  
 	 $ I P L i s t   =   " "  
 	 $ i = 1  
 	 F o r e a c h ( $ I P   i n   $ D N S S e r v e r I P L i s t )  
 	 {  
 	 	 [ S T R I N G ] $ I P L i s t   + =   $ I P  
 	 	  
 	 	 I f ( $ i   - l t   $ D N S S e r v e r I P L i s t . C o u n t )  
 	 	 {  
 	 	 	 $ I P L i s t   + =   " , "  
 	 	 }  
 	 	 $ i + +  
 	 }  
  
 	 R E T U R N   $ I P L i s t  
 	  
 	  
 }  
  
  
  
 #   - - - - - - - - - -   C R E A T E   A   N E W   D O M A I N   ( D C P R O M O ) - - - - - - - - - - -  
 F u n c t i o n   C r e a t e N e w A D D N S  
 {  
 	 P a r a m (  
 	 $ D C P R O M O C o m p u t e r n a m e   =   " " ,  
 	 $ S e r v e r R o l e   =   " " ,  
 	 $ S e r v e r M e t a D a t a ,  
 	 $ D o m a i n N a m e   =   " "  
 	 )  
  
 	 #   G e t   D o m a i n   A d m i n   C r e d e n t i a l s  
 	 $ D o m a i n A d m i n c r e d e n t i a l s   =   G e t D o m a i n A d m i n C r e d e n t i a l s   - D o m a i n N a m e   $ D o m a i n N a m e  
 	  
 	 #   G e t   L o c a l   A d m i n   C r e d e n t i a l s  
   	 $ L A d m i n c r e d e n t i a l s   =   G e t L A d m i n C r e d e n t i a l s   - C o m p u t e r N a m e   $ C o m p u t e r N a m e  
  
 	  
 	 #   C h e c k   i f   C u r r e n t   C o m p u t e r   i s   a   D C  
 	 $ V a l i d a t e D C   =   T e s t - P a t h   " \ \ $ D C P R O M O C o m p u t e r n a m e \ N E T L O G O N "  
 	  
 	  
 	 #   C h e c k   i f   t h e   D o m a i n   E x i s t s   o n   O t h e r   S e r v e r s   w i t h   t h e   D C D N S   R o l e  
 	 $ V a l i d a t e D o m a i n E x i s t s   =   @ ( )  
 	 F o r e a c h ( $ D C S e r v e r   i n   $ M e t a D a t a T a b l e   |   ? { $ _ . S e r v e r R o l e   - i m a t c h   " D C D N S " } )  
 	 {  
 	 	 $ V a l i d a t e D o m a i n E x i s t s   + =   T e s t - P a t h   " \ \ $ ( $ D C S e r v e r . C o m p u t e r N a m e ) \ N E T L O G O N "  
 	 }  
 	  
 	 #   G e t   L i s t   o f   D N S   S e r v e r   I P ' s   F o r   U s e   B e f o r e   a n d   A f t e r   D C P R O M O  
 	 $ S e t O t h e r D N S S e r v e r I P L i s t   =   G e t D N S S e r v e r I P L i s t   - D C P R O M O C o m p u t e r n a m e   $ D C P R O M O C o m p u t e r n a m e   - O t h e r D N S S e r v e r s  
 	 $ S e t O t h e r L o o p D N S S e r v e r I P L i s t   =   G e t D N S S e r v e r I P L i s t   - D C P R O M O C o m p u t e r n a m e   $ D C P R O M O C o m p u t e r n a m e   - O t h e r D N S S e r v e r s L o o p  
 	  
 	 	  
 	 #   I f   C o m p u t e r   i s   N o t   a   D C   a n d   t h e   D o m a i n   E x i s t s ,   A d d   C o m p u t e r   t o   E x i s t i n g   D o m a i n  
 	 I f ( $ V a l i d a t e D C   - i e q   $ T r u e )  
 	 {  
 	 	 W r i t e - H o s t   " ` t C o m p u t e r   i s   A l r e a d y   a   D o m a i n   C o n t r o l l e r "   - F o r e g r o u n d C o l o r   D a r k R e d  
 	 }  
 	 #   A d d i t i o n a l   D C   I n   D o m a i n  
 	 E l s e I f ( $ V a l i d a t e D C   - i e q   $ F a l s e   - a n d   $ V a l i d a t e D o m a i n E x i s t s   - i c o n t a i n s   $ t r u e )  
 	 {  
  
 	 	 #   A d d   C o m p u t e r   t o   E x i s t i n g   D o m o a i n  
 	 	 W r i t e - H o s t   " A d d i n g   $ D C P R O M O C o m p u t e r N a m e   t o   D o m a i n   $ D o m a i n N a m e "  
 	 	 I n v o k e - C o m m a n d    C o m p u t e r N a m e   $ D C P R O M O C o m p u t e r n a m e   - C r e d e n t i a l   $ L A d m i n c r e d e n t i a l s    S c r i p t B l o c k   {  
 	 	 	 #   C o n f i g u r e   D N S   f o r   D C P R O M O  
 	 	 	 W r i t e - H o s t   " C o n f i g u r i n g   D N S   f o r   D C P R O M O "  
 	 	 	 G e t - D n s C l i e n t S e r v e r A d d r e s s   - I n t e r f a c e A l i a s   E t h e r n e t   |   S e t - D n s C l i e n t S e r v e r A d d r e s s   - R e s e t S e r v e r A d d r e s s e s  
 	 	 	 S e t - D N S C l i e n t S e r v e r A d d r e s s   - I n t e r f a c e A l i a s   E t h e r n e t   - S e r v e r A d d r e s s e s   $ u s i n g : S e t O t h e r D N S S e r v e r I P L i s t  
 	 	 	  
  
 	 	 	 #   I n s t a l l   A D   D o m a i n   S e r v i c e s  
 	 	 	 W r i t e - H o s t   " I n s t a l l i n g   A D   D o m a i n   S e r v i c e s "  
 	 	 	 I n s t a l l - W i n d o w s F e a t u r e    N a m e   A D - D o m a i n - S e r v i c e s   - I n c l u d e M a n a g e m e n t T o o l s   |   O u t - N u l l  
 	 	 	  
 	 	 	 I m p o r t - M o d u l e   A D D S D e p l o y m e n t  
 	 	 	 I n s t a l l - A D D S D o m a i n C o n t r o l l e r   `  
 	 	 	 - D o m a i n N a m e : $ u s i n g : D o m a i n N a m e   `  
 	 	 	 - I n s t a l l D n s : $ t r u e   `  
 	 	 	 - S i t e N a m e : ' D e f a u l t - F i r s t - S i t e - N a m e '   `  
 	 	 	 - N o G l o b a l C a t a l o g : $ f a l s e   `  
 	 	 	 - N o R e b o o t O n C o m p l e t i o n : $ f a l s e   `  
 	 	 	 - C r e d e n t i a l : $ u s i n g : D o m a i n A d m i n c r e d e n t i a l s   `  
 	 	 	 - S a f e M o d e A d m i n i s t r a t o r P a s s w o r d   ( C o n v e r t T o - S e c u r e S t r i n g   'PASSWORD'   - A s P l a i n T e x t   - F o r c e )   `  
 	 	 	 - S k i p P r e C h e c k s   `  
 	 	 	 - C o n f i r m : $ f a l s e   `  
 	 	 	 - F o r c e : $ t r u e  
 	 	 	  
 	 	 	  
 	 	 	 #   C o n f i g u r e   l o o p b a c k   D N S  
 	 	 	 W r i t e - H o s t   " C o n f i g u r i n g   D N S   F o r   P r o d u c t i o n :   $ U s i n g : S e t O t h e r L o o p D N S S e r v e r I P L i s t "  
 	 	 	 G e t - D n s C l i e n t S e r v e r A d d r e s s   - I n t e r f a c e A l i a s   E t h e r n e t   |   S e t - D n s C l i e n t S e r v e r A d d r e s s   - R e s e t S e r v e r A d d r e s s e s  
 	 	 	 S e t - D N S C l i e n t S e r v e r A d d r e s s   - I n t e r f a c e A l i a s   E t h e r n e t   - S e r v e r A d d r e s s e s   $ U s i n g : S e t O t h e r L o o p D N S S e r v e r I P L i s t  
 	 	 	  
 	 	 }  
 	 	  
 	 	 	  
 	 	 #   W a i t   f o r   c o m p u t e r   &   S e r v i c e   t o   c o m e   o n l i n e   b e f o r e   c o n t i n u i n g    
 	 	 W a i t C o m p u t e r O n l i n e   - C o m p u t e r N a m e   $ D C P R O M O C o m p u t e r n a m e  
 	 	 S t a r t - S l e e p   - S e c o n d s   6 0  
 	 	 	  
 	 }  
 	 #   F i r s t   D C   I n   D o m a i n  
 	 E l s e I f ( $ V a l i d a t e D C   - i e q   $ F a l s e   - a n d   $ V a l i d a t e D o m a i n E x i s t s   - i n o t c o n t a i n s   $ t r u e )  
 	 {  
 	 	 #   C r e a t e   n e w   f o r e s t   &   d o m a i n  
 	 	 W r i t e - H o s t   " C r e a t i n g   N e w   D o m a i n   $ D o m a i n N a m e "  
 	 	 I n v o k e - C o m m a n d    C o m p u t e r N a m e   $ D C P R O M O C o m p u t e r n a m e   - C r e d e n t i a l   $ L A d m i n c r e d e n t i a l s    S c r i p t B l o c k   {  
 	 	 	 #   C o n f i g u r e   l o o p b a c k   D N S  
 	 	 	 W r i t e - H o s t   " C o n f i g u r i n g   D N S   f o r   D C P R O M O "  
 	 	 	 G e t - D n s C l i e n t S e r v e r A d d r e s s   - I n t e r f a c e A l i a s   E t h e r n e t   |   S e t - D n s C l i e n t S e r v e r A d d r e s s   - R e s e t S e r v e r A d d r e s s e s  
 	 	 	 S e t - D N S C l i e n t S e r v e r A d d r e s s   - I n t e r f a c e A l i a s   E t h e r n e t   - S e r v e r A d d r e s s e s   1 2 7 . 0 . 0 . 1  
  
 	 	 	 #   I n s t a l l   A D   D o m a i n   S e r v i c e s  
 	 	 	 W r i t e - H o s t   " I n s t a l l i n g   A D   D o m a i n   S e r v i c e s "  
 	 	 	 I n s t a l l - W i n d o w s F e a t u r e    N a m e   A D - D o m a i n - S e r v i c e s   - I n c l u d e M a n a g e m e n t T o o l s   |   O u t - N u l l  
 	 	 	  
 	 	 	 I m p o r t - M o d u l e   A D D S D e p l o y m e n t  
 	 	 	 I n s t a l l - A D D S F o r e s t   `  
 	 	 	 - D o m a i n N a m e   $ u s i n g : D o m a i n N a m e   `  
 	 	 	 - F o r e s t M o d e   W i n 2 0 1 2 R 2   `  
 	 	 	 - D o m a i n M o d e   W i n 2 0 1 2 R 2   - F o r c e   `  
 	 	 	 - I n s t a l l D n s : $ t r u e   `  
 	 	 	 - N o R e b o o t O n C o m p l e t i o n : $ f a l s e   `  
 	 	 	 - S a f e M o d e A d m i n i s t r a t o r P a s s w o r d   ( C o n v e r t T o - S e c u r e S t r i n g   'PASSWORD'   - A s P l a i n T e x t   - F o r c e )   `  
 	 	 	 - S k i p P r e C h e c k s   `  
 	 	 	 - C o n f i r m : $ f a l s e  
 	 	 	  
 	 	 	 W r i t e - H o s t   " C o n f i g u r i n g   D N S   F o r   P r o d u c t i o n :   $ U s i n g : S e t O t h e r L o o p D N S S e r v e r I P L i s t "  
 	 	 	 G e t - D n s C l i e n t S e r v e r A d d r e s s   - I n t e r f a c e A l i a s   E t h e r n e t   |   S e t - D n s C l i e n t S e r v e r A d d r e s s   - R e s e t S e r v e r A d d r e s s e s  
 	 	 	 S e t - D N S C l i e n t S e r v e r A d d r e s s   - I n t e r f a c e A l i a s   E t h e r n e t   - S e r v e r A d d r e s s e s   $ U s i n g : S e t O t h e r L o o p D N S S e r v e r I P L i s t  
 	 	 	  
 	 	 }  
 	 	  
 	 	  
 	 	 #   W a i t   f o r   c o m p u t e r   &   S e r v i c e   t o   c o m e   o n l i n e   b e f o r e   c o n t i n u i n g    
 	 	 W a i t C o m p u t e r O n l i n e   - C o m p u t e r N a m e   $ D C P R O M O C o m p u t e r n a m e  
 	 	 S t a r t - S l e e p   - S e c o n d s   6 0  
 	 }  
 	  
 	 #   C o n v e r t   D o m a i n   N a m e   I n t o   D o m a i n   S e a r c h   B a s e   ( D C = D O M A I N , D C = C O M )  
 	 $ D o m a i n S e a r c h B a s e   =   G e t D o m a i n S e a r c h B a s e   - D o m a i n N a m e   $ D o m a i n N a m e  
  
 	  
 	 #   C o p y   G P O   F i l e s   t o   D o m a i n   C o n t r o l l e r  
 	 W r i t e - H o s t   " S t a g i n g   A D M X / G P O / L o g o n   S c r i p t s   t o   $ D C P R O M O C o m p u t e r n a m e "  
 	 I f ( ! ( T e s t - P a t h   " \ \ $ D C P R O M O C o m p u t e r n a m e \ c $ \ S t a g i n g \ G P O s "   |   O u t - N u l l ) ) { N e w - I t e m   " \ \ $ D C P R O M O C o m p u t e r n a m e \ c $ \ S t a g i n g "   - I t e m T y p e   D i r e c t o r y   - F o r c e   - E r r o r A c t i o n   S i l e n t l y C o n t i n u e   |   O u t - N u l l }  
 	 C o p y - I t e m   " $ R o o t W o r k i n g D i r \ C o p y - D C \ G P O s "   " \ \ $ D C P R O M O C o m p u t e r n a m e \ c $ \ S t a g i n g \ G P O s "   - R e c u r s e   - F o r c e   |   O u t - N u l l  
 	 C o p y - I t e m   " $ R o o t W o r k i n g D i r \ C o p y - D C \ L o g o n S c r i p t s "   " \ \ $ D C P R O M O C o m p u t e r n a m e \ c $ \ W i n d o w s \ S Y S V O L \ d o m a i n \ s c r i p t s "   - R e c u r s e   - F o r c e   |   O u t - N u l l  
 	 C o p y - I t e m   " $ R o o t W o r k i n g D i r \ C o p y - D C \ P o l i c y D e f i n i t i o n s "   " \ \ $ D C P R O M O C o m p u t e r n a m e \ c $ \ W i n d o w s "   - R e c u r s e   - F o r c e   |   O u t - N u l l  
  
 	 I f ( $ V a l i d a t e D C   - i e q   $ F a l s e   - a n d   $ V a l i d a t e D o m a i n E x i s t s   - i n o t c o n t a i n s   $ t r u e )  
 	 {  
 	 	 I n v o k e - C o m m a n d    C o m p u t e r N a m e   $ D C P R O M O C o m p u t e r n a m e   - C r e d e n t i a l   $ D o m a i n A d m i n c r e d e n t i a l s    S c r i p t B l o c k   {  
 	 	 	 I m p o r t - M o d u l e   A c t i v e D i r e c t o r y  
 	 	 	 A d d - W i n d o w s F e a t u r e   - N a m e   G P M C   |   O u t - N u l l  
 	 	 	 I m p o r t - M o d u l e   G r o u p P o l i c y  
 	 	 	 	  
 	 	 	 #   C r e a t e   O r g a n i z a t i o n a l   U n i t   S t r u c t u r e  
 	 	 	 W r i t e - H o s t   " C r e a t i n g   O U   S t r u c t u r e "  
 	 	 	 $ D o m a i n N a m e S p l i t   =   $ ( $ u s i n g : D o m a i n N a m e ) . s p l i t ( " . " ) [ 0 ]  
 	 	 	  
 	 	 	  
 	 	 	 T r y { N e w - A D O r g a n i z a t i o n a l U n i t   - P r o t e c t e d F r o m A c c i d e n t a l D e l e t i o n   $ f a l s e   - N a m e   $ D o m a i n N a m e S p l i t   - P a t h   $ u s i n g : D o m a i n S e a r c h B a s e } C a t c h { }  
 	 	 	 	 	 T r y { N e w - A D O r g a n i z a t i o n a l U n i t   - P r o t e c t e d F r o m A c c i d e n t a l D e l e t i o n   $ f a l s e   - N a m e   " S e r v e r s "   - P a t h   ( G e t - A D O r g a n i z a t i o n a l U n i t   - L D A P F i l t e r   " ( n a m e = $ D o m a i n N a m e S p l i t ) " ) . D i s t i n g u i s h e d N a m e   } C a t c h { }  
 	 	 	 	 	 	 T r y { N e w - A D O r g a n i z a t i o n a l U n i t   - P r o t e c t e d F r o m A c c i d e n t a l D e l e t i o n   $ f a l s e   - N a m e   " R D S   H o s t s "   - P a t h   ( G e t - A D O r g a n i z a t i o n a l U n i t   - L D A P F i l t e r   " ( n a m e = S e r v e r s ) " ) . D i s t i n g u i s h e d N a m e   } C a t c h { }  
 	 	 	 	 	 	 T r y { N e w - A D O r g a n i z a t i o n a l U n i t   - P r o t e c t e d F r o m A c c i d e n t a l D e l e t i o n   $ f a l s e   - N a m e   " R D S   I n f r a s t r u c t u r e "   - P a t h   ( G e t - A D O r g a n i z a t i o n a l U n i t   - L D A P F i l t e r   " ( n a m e = S e r v e r s ) " ) . D i s t i n g u i s h e d N a m e   } C a t c h { }  
 	 	 	 	 	 	 T r y { N e w - A D O r g a n i z a t i o n a l U n i t   - P r o t e c t e d F r o m A c c i d e n t a l D e l e t i o n   $ f a l s e   - N a m e   " H y p e r - v "   - P a t h   ( G e t - A D O r g a n i z a t i o n a l U n i t   - L D A P F i l t e r   " ( n a m e = S e r v e r s ) " ) . D i s t i n g u i s h e d N a m e   } C a t c h { }  
 	 	 	 	 	 	 T r y { N e w - A D O r g a n i z a t i o n a l U n i t   - P r o t e c t e d F r o m A c c i d e n t a l D e l e t i o n   $ f a l s e   - N a m e   " T C   M a n a g e m e n t "   - P a t h   ( G e t - A D O r g a n i z a t i o n a l U n i t   - L D A P F i l t e r   " ( n a m e = S e r v e r s ) " ) . D i s t i n g u i s h e d N a m e   } C a t c h { }  
 	 	 	 	 	 T r y { N e w - A D O r g a n i z a t i o n a l U n i t   - P r o t e c t e d F r o m A c c i d e n t a l D e l e t i o n   $ f a l s e   - N a m e   " U s e r   A c c o u n t s "   - P a t h   ( G e t - A D O r g a n i z a t i o n a l U n i t   - L D A P F i l t e r   " ( n a m e = $ D o m a i n N a m e S p l i t ) " ) . D i s t i n g u i s h e d N a m e } C a t c h { }    
 	 	 	 	 	 	 T r y { N e w - A D O r g a n i z a t i o n a l U n i t   - P r o t e c t e d F r o m A c c i d e n t a l D e l e t i o n   $ f a l s e   - N a m e   " U s e r s "   - P a t h   ( G e t - A D O r g a n i z a t i o n a l U n i t   - L D A P F i l t e r   " ( n a m e = U s e r   A c c o u n t s ) " ) . D i s t i n g u i s h e d N a m e   } C a t c h { }  
 	 	 	 	 	 	 T r y { N e w - A D O r g a n i z a t i o n a l U n i t   - P r o t e c t e d F r o m A c c i d e n t a l D e l e t i o n   $ f a l s e   - N a m e   " R D S   U s e r s "   - P a t h   ( G e t - A D O r g a n i z a t i o n a l U n i t   - L D A P F i l t e r   " ( n a m e = U s e r   A c c o u n t s ) " ) . D i s t i n g u i s h e d N a m e   } C a t c h { }  
 	 	 	 	 	 	 T r y { N e w - A D O r g a n i z a t i o n a l U n i t   - P r o t e c t e d F r o m A c c i d e n t a l D e l e t i o n   $ f a l s e   - N a m e   " S e c u r i t y   G r o u p s "   - P a t h   ( G e t - A D O r g a n i z a t i o n a l U n i t   - L D A P F i l t e r   " ( n a m e = U s e r   A c c o u n t s ) " ) . D i s t i n g u i s h e d N a m e   } C a t c h { }  
 	 	 	  
 	 	 	 	  
 	 	 	 #   C r e a t e   G r o u p s   * * * * * U S E R   N E E D S   C R E D S  
 	 	 	 W r i t e - H o s t   " C r e a t i n g   A D   G r o u p s "  
 	 	 	  
 	 	 	 	 T r y { N e w - A D G r o u p   - N a m e   " G _ R D S _ H o s t s _ A d m i n "   - G r o u p C a t e g o r y   1   - G r o u p S c o p e   1   - D e s c r i p t i o n   " M e m b e r s   a r e   L o c a l   A d m i n i s t r a t o r s   o n   R D S   H o s t   C o m p u t e r s "   - P a t h   ( G e t - A D O r g a n i z a t i o n a l U n i t   - L D A P F i l t e r   " ( n a m e = S e c u r i t y   G r o u p s ) " ) . D i s t i n g u i s h e d N a m e } C a t c h { }  
 	 	 	 	 T r y { N e w - A D G r o u p   - N a m e   " G _ R D S _ H o s t s _ R D U "   - G r o u p C a t e g o r y   1   - G r o u p S c o p e   1   - D e s c r i p t i o n   " M e m b e r s   c a n   R D P   i n t o   R D S   H o s t s "   - P a t h   ( G e t - A D O r g a n i z a t i o n a l U n i t   - L D A P F i l t e r   " ( n a m e = S e c u r i t y   G r o u p s ) " ) . D i s t i n g u i s h e d N a m e } C a t c h { }  
 	 	 	 	 T r y { N e w - A D G r o u p   - N a m e   " G _ U s e r _ M a n a g e m e n t "   - G r o u p C a t e g o r y   1   - G r o u p S c o p e   1   - D e s c r i p t i o n   " M e m b e r s   c a n   c r e a t e   n e w   u s e r s   a n d   r e s e t   p a s s w o r d s   o n   s p e c i f i c   r e s o u r c e s "   - P a t h   ( G e t - A D O r g a n i z a t i o n a l U n i t   - L D A P F i l t e r   " ( n a m e = S e c u r i t y   G r o u p s ) " ) . D i s t i n g u i s h e d N a m e } C a t c h { }  
 	 	 	 	 T r y { N e w - A D G r o u p   - N a m e   " R D S   C o n n e c t i o n   B r o k e r s "   - G r o u p C a t e g o r y   1   - G r o u p S c o p e   1   - D e s c r i p t i o n   " M e m b e r s   c o n t a i n   R D S   C o n n e c t i o n   B r o k e r   S e r v e r s "   - P a t h   ( G e t - A D O r g a n i z a t i o n a l U n i t   - L D A P F i l t e r   " ( n a m e = S e c u r i t y   G r o u p s ) " ) . D i s t i n g u i s h e d N a m e } C a t c h { }  
 	 	 	 	  
 	 	 	  
 	 	 	 W r i t e - H o s t   " C r e a t i n g   A D   U s e r s "  
 	 	 	 T r y  
 	 	 	 {  
 	 	 	 	 $ D e f a u l t U s e r P a s s w o r d   =   "PASSWORD"   |   C o n v e r t T o - S e c u r e S t r i n g   - A s P l a i n T e x t   - F o r c e  
 	 	 	 	 N e w - A D U s e r   - N a m e   T C S   - D e s c r i p t i o n   " T C S   A c c o u n t "   - A c c o u n t P a s s w o r d   $ D e f a u l t U s e r P a s s w o r d   - P a t h   ( G e t - A D O r g a n i z a t i o n a l U n i t   - L D A P F i l t e r   " ( n a m e = U s e r s ) " ) . D i s t i n g u i s h e d N a m e     - P a s s w o r d N e v e r E x p i r e s   1   - E n a b l e d   1  
 	 	 	 	 A d d - A D G r o u p M e m b e r   - I d e n t i t y   " D o m a i n   A d m i n s "   - M e m b e r s   T C S  
 	 	 	 	 A d d - A D G r o u p M e m b e r   - I d e n t i t y   " E n t e r p r i s e   A d m i n s "   - M e m b e r s   T C S  
 	 	 	 	  
 	 	 	 	 N e w - A D U s e r   - N a m e   N O C   - D e s c r i p t i o n   " N O C   S u p p o r t "   - A c c o u n t P a s s w o r d   $ D e f a u l t U s e r P a s s w o r d   - P a t h   ( G e t - A D O r g a n i z a t i o n a l U n i t   - L D A P F i l t e r   " ( n a m e = U s e r s ) " ) . D i s t i n g u i s h e d N a m e     - P a s s w o r d N e v e r E x p i r e s   1   - E n a b l e d   1  
 	 	 	 	 A d d - A D G r o u p M e m b e r   - I d e n t i t y   " D o m a i n   A d m i n s "   - M e m b e r s   N O C  
 	 	 	 	  
 	 	 	 	 N e w - A D U s e r   - N a m e   H e l p D e s k   - D e s c r i p t i o n   " H e l p   D e s k   S u p p o r t "   - A c c o u n t P a s s w o r d   $ D e f a u l t U s e r P a s s w o r d   - P a t h   ( G e t - A D O r g a n i z a t i o n a l U n i t   - L D A P F i l t e r   " ( n a m e = U s e r s ) " ) . D i s t i n g u i s h e d N a m e     - P a s s w o r d N e v e r E x p i r e s   1   - E n a b l e d   1  
 	 	 	 	 A d d - A D G r o u p M e m b e r   - I d e n t i t y   " G _ R D S _ H o s t s _ A d m i n "   - M e m b e r s   H e l p D e s k  
 	 	 	 	  
 	 	 	 	 N e w - A D U s e r   - N a m e   T e s t U s e r   - D e s c r i p t i o n   " T e s t   U s e r "   - A c c o u n t P a s s w o r d   $ D e f a u l t U s e r P a s s w o r d   - P a t h   ( G e t - A D O r g a n i z a t i o n a l U n i t   - L D A P F i l t e r   " ( n a m e = R D S   U s e r s ) " ) . D i s t i n g u i s h e d N a m e     - P a s s w o r d N e v e r E x p i r e s   1   - E n a b l e d   1  
 	 	 	 	 A d d - A D G r o u p M e m b e r   - I d e n t i t y   " G _ R D S _ H o s t s _ R D U "   - M e m b e r s   T e s t U s e r  
 	 	 	 }  
 	 	 	 C a t c h { }  
 	 	 	  
 	 	 	 #   I m p o r t   &   L i n k   G r o u p   P o l i c i e s  
 	 	 	 	 #   S t a g e   G P O ' s   f r o m   S Y S V O L   t o   C : \ S t a g i n g  
 	 	 	 	  
 	 	 	 	 W r i t e - H o s t   " S t a g i n g   G P O ' s "  
 	 	 	 	 #   C r e a t e   U s e r S h o r t c u t s   D i r e c t o r y  
 	 	 	 	 I f   ( ! ( T e s t - P a t h   C : \ W i n d o w s \ S Y S V O L \ s y s v o l \ U s e r S h o r t c u t s   |   O u t - N u l l ) ) { N e w - I t e m   - I t e m T y p e   D i r e c t o r y   - F o r c e   - P a t h   C : \ W i n d o w s \ S Y S V O L \ s y s v o l \ U s e r S h o r t c u t s   |   O u t - N u l l }  
 	 	 	 	  
 	 	 	 	 $ L o c a l S t a g i n g G P O D i r   =   " C : \ S t a g i n g \ G P O s "  
 	 	 	 	  
 	 	 	 	 #   O r g a n i z a t i o n a l   U n i t   V a r i a b l e s  
 	 	 	 	 $ D N R D S H o s t s O U   =   ( G e t - A D O r g a n i z a t i o n a l U n i t   - L D A P F i l t e r   " ( n a m e = R D S   H o s t s ) " ) . D i s t i n g u i s h e d N a m e    
 	 	 	 	 $ D N U s e r A c c o u n t s O U   =   ( G e t - A D O r g a n i z a t i o n a l U n i t   - L D A P F i l t e r   " ( n a m e = U s e r   A c c o u n t s ) " ) . D i s t i n g u i s h e d N a m e  
 	 	 	 	 $ D N R D S U s e r s O U   =   ( G e t - A D O r g a n i z a t i o n a l U n i t   - L D A P F i l t e r   " ( n a m e = R D S   U s e r s ) " ) . D i s t i n g u i s h e d N a m e 	 	  
 	 	 	 	  
 	 	 	 	  
 	 	 	 	 #   S e t   L i s t   o f   G P O ' s   t o   B e   I m p o r t e d   t o   T h e i r   R e s p r c t i v e   O U   L o c a t i o n  
 	 	 	 	 $ R D S H o s t s G P O s   =   @ ( " A p p L o c k e r   +   S R P ' s " , " R D S   U s e r s   L o c k   D o w n " , " D i s a b l e   U A C " , " I E   S e t t i n g s " , " R D S   R e s o u r c e   R e d i r e c t i o n " , " R D S   L i c e n s i n g " , " R e s t r i c t e d   G r o u p   -   R D S   S e r v e r s " )  
 	 	 	 	 $ U s e r A c c o u n t s G P O s   =   @ ( " I E   L o w   S e c u r i t y " , " I E   S e t t i n g s " )  
 	 	 	 	 $ R D S U s e r s G P O s   =   @ ( " R D S   U s e r   P r o f i l e   S e t t i n g s " , " R D S   U s e r s   L o c k   D o w n " , " D i s a b l e   M S O   1 s t   P r o m p t s " )  
 	 	 	 	  
 	 	 	 	 W r i t e - H o s t   " I m p o r t i n g   &   L i n k i n g   G P O ' s "  
 	 	 	 	 F o r e a c h ( $ G P O N a m e   i n   $ R D S H o s t s G P O s )  
 	 	 	 	 {  
 	 	 	 	 	 W r i t e - H o s t   " ` t $ G P O N a m e "  
 	 	 	 	 	 I m p o r t - G P O   - B a c k u p G p o N a m e   $ G P O N a m e   - P a t h   " $ L o c a l S t a g i n g G P O D i r "   - T a r g e t N a m e   $ G P O N a m e   - S e r v e r   $ u s i n g : D C P R O M O C o m p u t e r n a m e   - C r e a t e I f N e e d e d   |   O u t - N u l l  
 	 	 	 	 	 N e w - G P L i n k   - N a m e   $ G P O N a m e   - S e r v e r   $ u s i n g : D C P R O M O C o m p u t e r n a m e   - T a r g e t   $ D N R D S H o s t s O U   - L i n k E n a b l e d   Y e s     - E r r o r A c t i o n   S i l e n t l y C o n t i n u e     |   O u t - N u l l  
 	 	 	 	 }    
 	 	 	 	  
 	 	 	 	 F o r e a c h ( $ G P O N a m e   i n   $ U s e r A c c o u n t s G P O s )  
 	 	 	 	 { 	 	 	  
 	 	 	 	 	 W r i t e - H o s t   " ` t $ G P O N a m e "  
 	 	 	 	 	 I m p o r t - G P O   - B a c k u p G p o N a m e   $ G P O N a m e   - P a t h   " $ L o c a l S t a g i n g G P O D i r "   - T a r g e t N a m e   $ G P O N a m e   - S e r v e r   $ u s i n g : D C P R O M O C o m p u t e r n a m e   - C r e a t e I f N e e d e d   - E r r o r A c t i o n   S i l e n t l y C o n t i n u e   |   O u t - N u l l  
 	 	 	 	 	 N e w - G P L i n k   - N a m e   $ G P O N a m e   - S e r v e r   $ u s i n g : D C P R O M O C o m p u t e r n a m e   - T a r g e t   $ D N U s e r A c c o u n t s O U   - L i n k E n a b l e d   Y e s   - E r r o r A c t i o n   S i l e n t l y C o n t i n u e   |   O u t - N u l l  
 	 	 	 	 }    
  
 	 	 	 	 F o r e a c h ( $ G P O N a m e   i n   $ R D S U s e r s G P O s )  
 	 	 	 	 { 	 	 	  
 	 	 	 	 	 W r i t e - H o s t   " ` t $ G P O N a m e "  
 	 	 	 	 	 I m p o r t - G P O   - B a c k u p G p o N a m e   $ G P O N a m e   - P a t h   " $ L o c a l S t a g i n g G P O D i r "   - T a r g e t N a m e   $ G P O N a m e   - S e r v e r   $ u s i n g : D C P R O M O C o m p u t e r n a m e   - C r e a t e I f N e e d e d   - E r r o r A c t i o n   S i l e n t l y C o n t i n u e   |   O u t - N u l l  
 	 	 	 	 	 N e w - G P L i n k   - N a m e   $ G P O N a m e   - S e r v e r   $ u s i n g : D C P R O M O C o m p u t e r n a m e   - T a r g e t   $ D N R D S U s e r s O U   - L i n k E n a b l e d   Y e s   - E r r o r A c t i o n   S i l e n t l y C o n t i n u e   |   O u t - N u l l  
 	 	 	 	 }    
 	 	 	  
 	 	 }  
 	 	  
 	 }  
 }  
  
  
  
  
 F u n c t i o n   G e t D o m a i n S e a r c h B a s e  
 	 {  
 	 	 P a r a m (  
 	 	 $ D o m a i n N a m e  
 	 	 )  
 	 	 #   C o n v e r t   S E C O N D . F I R S T . D O M A I N . C O M   T O   D C = S E C O N D , D C = F I R S T , D C = D O M A I N , D C = C O M  
 	 	 $ S p l i t D o m a i n N a m e   =   $ D o m a i n N a m e . S p l i t ( " . " )  
 	 	 [ I N T ] $ D o m a i n I n d e x C o u n t   =   $ S p l i t D o m a i n N a m e . c o u n t  
 	 	 $ D o m a i n S e a r c h B a s e   =   " "  
 	 	 f o r e a c h ( $ i   i n   $ S p l i t D o m a i n N a m e )  
 	 	 {  
  
 	 	 	 $ D o m a i n S e a r c h B a s e   + =   " D C = $ i "  
 	 	 	 i f ( $ D o m a i n I n d e x C o u n t   - g t   1 )  
 	 	 	 {  
 	 	 	 	 $ D o m a i n S e a r c h B a s e   + =   " , "  
 	 	 	 }  
 	 	 	 $ D o m a i n I n d e x C o u n t   =   $ D o m a i n I n d e x C o u n t   - 1    
 	 	 }  
 	 	 R E T U R N   $ D o m a i n S e a r c h B a s e  
 	 }  
  
  
  
  
 #   W A I T   F O R   C O M P U T E R   O N L I N E   ( R e s p o n d   t o   W M I   Q u e r y )  
 F u n c t i o n   W a i t C o m p u t e r O n l i n e  
 {  
 	 P a r a m (  
 	 $ C o m p u t e r N a m e   =   " " ,  
 	 $ W a i t S e r v i c e   =   $ n u l l ,  
 	 $ D o m a i n   =   $ t r u e  
 	 )  
 	  
 	 #   G e t   D o m a i n   A d m i n   C r e d e n t i a l s  
 	 $ D o m a i n A d m i n c r e d e n t i a l s   =   G e t D o m a i n A d m i n C r e d e n t i a l s   - D o m a i n N a m e   $ D o m a i n N a m e  
 	  
 	 #   G e t   L o c a l   A d m i n   C r e d e n t i a l s  
   	 $ L A d m i n c r e d e n t i a l s   =   G e t L A d m i n C r e d e n t i a l s   - C o m p u t e r N a m e   $ C o m p u t e r N a m e  
 	  
 	 W r i t e - H o s t   " W a i t i n g   f o r   $ C o m p u t e r N a m e   t o   c o m e   O n l i n e   /   D o m a i n :   $ D o m a i n   ` r ` r "  
 	  
 	 #   G e t   C r e d e n t i a l s   B a s e d   o n   D o m a i n   M e m b e r s h i p  
 	 I f ( $ D o m a i n   - e q   $ t r u e ) { $ C r e d e n t i a l   =   $ D o m a i n A d m i n c r e d e n t i a l s }  
 	 e l s e { $ C r e d e n t i a l   =   $ L A d m i n c r e d e n t i a l s }  
 	 	  
 	 D o  
 	 { 	  
 	 	 $ W a i t C o m p u t e r O n l i n e   =   $ ( T e s t - W S M a n   - C o m p u t e r N a m e   $ C o m p u t e r N a m e   - A u t h e n t i c a t i o n   D e f a u l t   - C r e d e n t i a l   $ C r e d e n t i a l   - E r r o r A c t i o n   S i l e n t l y C o n t i n u e ) . P r o d u c t V e r s i o n  
 	 	 i f ( $ W a i t C o m p u t e r O n l i n e   - i n o t m a t c h   " O S :   * " )  
 	 	 {  
 	 	 	 W r i t e - H o s t   " . "   - N o N e w l i n e  
 	 	 	 S t a r t - S l e e p   - S e c o n d s   1 5  
 	 	 }  
 	 }  
 	 U n t i l  
 	 (  
 	 	 $ W a i t C o m p u t e r O n l i n e   - i m a t c h   " O S :   * "  
 	 )  
 	 i f ( $ W a i t C o m p u t e r O n l i n e   - i m a t c h   " O S :   * " ) { W r i t e - H o s t   " ` r $ C o m p u t e r N a m e   i s   O n l i n e "   - F o r e g r o u n d C o l o r   D a r k G r e e n }  
 	 	  
 	  
 	 I f ( $ W a i t S e r v i c e   - i n e   $ n u l l )  
 	 {  
 	 	 W r i t e - H o s t   " W a i t i n g   f o r   S e r v i c e   $ W a i t S e r v i c e ` r ` r "  
 	 	 I n v o k e - C o m m a n d   - C o m p u t e r N a m e   $ C o m p u t e r N a m e   - C r e d e n t i a l   $ C r e d e n t i a l   - S c r i p t B l o c k   {  
 	 	 	 D o  
 	 	 	 {  
 	 	 	 	 $ S e r v i c e S t a t e   =   G e t - S e r v i c e   - C o m p u t e r N a m e   $ u s i n g : C o m p u t e r N a m e   - N a m e   $ u s i n g : W a i t S e r v i c e  
 	 	 	 	 I f ( $ S e r v i c e S t a t e . S t a t u s   - i n e   " R u n n i n g " )  
 	 	 	 	 {  
 	 	 	 	 	 W r i t e - H o s t   " . "   - N o N e w l i n e  
 	 	 	 	 	 S t a r t - S l e e p   - S e c o n d s   1 5  
 	 	 	 	 }  
 	 	 	 }  
 	 	 	 U n t i l  
 	 	 	 (  
 	 	 	 	 $ S e r v i c e S t a t e . S t a t u s   - i e q   " R u n n i n g "  
 	 	 	 )  
 	 	 	 I f ( $ S e r v i c e S t a t e . S t a t u s   - i e q   " R u n n i n g " )  
 	 	 	 {  
 	 	 	 	 W r i t e - H o s t   ` r $ u s i n g : W a i t S e r v i c e   i s   $ S e r v i c e S t a t e . S t a t u s   - F o r e g r o u n d C o l o r   D a r k G r e e n  
 	 	 	 }  
 	 	 }  
 	 }  
 	  
 }  
  
  
  
  
 #   W A I T   F O R   C O M P U T E R   O F F L I N E  
 F u n c t i o n   W a i t C o m p u t e r O f f l i n e  
 {  
 	 P a r a m (  
 	 $ C o m p u t e r N a m e   =   " " ,  
 	 $ D o m a i n   =   $ t r u e  
 	 )  
 	  
 	 #   G e t   D o m a i n   A d m i n   C r e d e n t i a l s  
 	 $ D o m a i n A d m i n c r e d e n t i a l s   =   G e t D o m a i n A d m i n C r e d e n t i a l s   - D o m a i n N a m e   $ D o m a i n N a m e  
 	  
 	 #   G e t   L o c a l   A d m i n   C r e d e n t i a l s  
   	 $ L A d m i n c r e d e n t i a l s   =   G e t L A d m i n C r e d e n t i a l s   - C o m p u t e r N a m e   $ C o m p u t e r N a m e  
 	  
 	 W r i t e - H o s t   " W a i t i n g   f o r   $ C o m p u t e r N a m e   t o   G o   O f f l i n e   /   D o m a i n :   $ D o m a i n   ` r ` r "  
 	  
 	 #   G e t   C r e d e n t i a l s   B a s e d   o n   D o m a i n   M e m b e r s h i p  
 	 I f ( $ D o m a i n   - e q   $ t r u e ) { $ C r e d e n t i a l   =   $ D o m a i n A d m i n c r e d e n t i a l s }  
 	 e l s e { $ C r e d e n t i a l   =   $ L A d m i n c r e d e n t i a l s }  
 	 	  
 	 D o  
 	 { 	  
 	 	 $ W a i t C o m p u t e r O f f l i n e   =   $ ( T e s t - W S M a n   - C o m p u t e r N a m e   $ C o m p u t e r N a m e   - A u t h e n t i c a t i o n   D e f a u l t   - C r e d e n t i a l   $ C r e d e n t i a l   - E r r o r A c t i o n   S i l e n t l y C o n t i n u e ) . P r o d u c t V e r s i o n  
 	 	 i f ( $ W a i t C o m p u t e r O f f l i n e   - i m a t c h   " O S :   * " )  
 	 	 {  
 	 	 	 W r i t e - H o s t   " . "   - N o N e w l i n e  
 	 	 	 S t a r t - S l e e p   - S e c o n d s   5  
 	 	 }  
 	 }  
 	 U n t i l  
 	 (  
 	 	 $ W a i t C o m p u t e r O f f l i n e   - i n o t m a t c h   " O S :   * "  
 	 )  
 	 i f ( $ W a i t C o m p u t e r O f f l i n e   - i n o t m a t c h   " O S :   * " ) { W r i t e - H o s t   " ` r $ C o m p u t e r N a m e   i s   O f f l i n e "   - F o r e g r o u n d C o l o r   D a r k G r e e n }  
 	  
 }  
  
  
  
  
  
  
 F u n c t i o n   G e t D o m a i n A d m i n C r e d e n t i a l s  
 {  
 	 P a r a m (  
 	 $ D o m a i n N a m e  
 	 )  
 	 #   S E T   D O M A I N   A D M I N   C R E D E N T I A L S   T O   P A S S   T O   O T H E R   F U N C T I O N S    
 	 $ D o m a i n A d m i n U s e r N a m e   =   " $ D o m a i n N a m e \ A d m i n i s t r a t o r "  
 	 $ D o m a i n A d m i n P w d   =   "PASSWORD"   |   C o n v e r t T o - S e c u r e S t r i n g   - A s P l a i n T e x t   - F o r c e  
 	 $ D o m a i n A d m i n c r e d e n t i a l s   =   N e w - O b j e c t   - T y p e N a m e   S y s t e m . M a n a g e m e n t . A u t o m a t i o n . P S C r e d e n t i a l   - A r g u m e n t L i s t   $ D o m a i n A d m i n U s e r N a m e , $ D o m a i n A d m i n P w d  
 	 R E T U R N   $ D o m a i n A d m i n c r e d e n t i a l s  
 }  
  
 F u n c t i o n   G e t L A d m i n C r e d e n t i a l s  
 {  
 	 P a r a m (  
 	 $ C o m p u t e r N a m e  
 	 )  
 	 #   S E T   L O C A L   A D M I N   C R E D E N T I A L S   T O   P A S S   T O   O T H E R   F U N C T I O N S    
 	 $ L A d m i n U s e r N a m e   =   " $ C o m p u t e r N a m e \ A d m i n i s t r a t o r "  
 	 $ L A d m i n P w d   =   "PASSWORD"   |   C o n v e r t T o - S e c u r e S t r i n g   - A s P l a i n T e x t   - F o r c e  
 	 $ L A d m i n c r e d e n t i a l s   =   N e w - O b j e c t   - T y p e N a m e   S y s t e m . M a n a g e m e n t . A u t o m a t i o n . P S C r e d e n t i a l   - A r g u m e n t L i s t   $ L A d m i n U s e r N a m e , $ L A d m i n P w d  
 	 R E T U R N   $ L A d m i n c r e d e n t i a l s  
 }  
  
  
  
 F u n c t i o n   G e n e r a t e U n a t t e n d F i l e  
 	 {  
 	 P a r a m (  
 	 $ C o m p u t e r N a m e ,  
 	 $ O S E d i t i o n ,  
 	 $ P r o d u c t K e y ,  
 	 $ S t a t i c I P ,  
 	 $ N e x t H o p A d d r e s s  
 	 )  
 	  
  
 	  
 	 #   S A V E   U N A T T E N D   F I L E   T O   A   S T A G E D   D I R E C T O R Y  
 	 $ S a v e U n a t t e n d P a t h   =   " $ R o o t W o r k i n g D i r \ _ S t a g e d - U n a t t e n d - F i l e s \ $ C o m p u t e r N a m e "  
 	 $ g l o b a l : U n a t t e n d F i l e   =   " $ S a v e U n a t t e n d P a t h \ u n a t t e n d . x m l "  
 	 i f   ( ! ( T e s t - P a t h   $ S a v e U n a t t e n d P a t h   |   O u t - N u l l ) ) { N e w - I t e m   - I t e m T y p e   D i r e c t o r y   - F o r c e   - P a t h   $ S a v e U n a t t e n d P a t h   |   O u t - N u l l }  
 	  
 	 #   D Y N A M I C A L L Y   G E N E R A T E   U N A T T E N D   F I L E  
 	 C l e a r - C o n t e n t   $ U n a t t e n d F i l e   - E r r o r A c t i o n   S i l e n t l y C o n t i n u e  
 	  
 	 $ B l o c k 1   =   ' < ? x m l   v e r s i o n = " 1 . 0 "   e n c o d i n g = " u t f - 8 " ? >  
 	 < u n a t t e n d   x m l n s = " u r n : s c h e m a s - m i c r o s o f t - c o m : u n a t t e n d " >  
 	         < s e t t i n g s   p a s s = " w i n d o w s P E " >  
 	                 < c o m p o n e n t   n a m e = " M i c r o s o f t - W i n d o w s - I n t e r n a t i o n a l - C o r e - W i n P E "   p r o c e s s o r A r c h i t e c t u r e = " a m d 6 4 "   p u b l i c K e y T o k e n = " 3 1 b f 3 8 5 6 a d 3 6 4 e 3 5 "   l a n g u a g e = " n e u t r a l "   v e r s i o n S c o p e = " n o n S x S "   x m l n s : w c m = " h t t p : / / s c h e m a s . m i c r o s o f t . c o m / W M I C o n f i g / 2 0 0 2 / S t a t e "   x m l n s : x s i = " h t t p : / / w w w . w 3 . o r g / 2 0 0 1 / X M L S c h e m a - i n s t a n c e " >  
 	                         < I n p u t L o c a l e > e n - U S < / I n p u t L o c a l e >  
 	                         < S y s t e m L o c a l e > e n - U S < / S y s t e m L o c a l e >  
 	                         < U I L a n g u a g e > e n - U S < / U I L a n g u a g e >  
 	                         < U s e r L o c a l e > e n - U S < / U s e r L o c a l e >  
 	                 < / c o m p o n e n t >  
 	                 < c o m p o n e n t   n a m e = " M i c r o s o f t - W i n d o w s - S e t u p "   p r o c e s s o r A r c h i t e c t u r e = " a m d 6 4 "   p u b l i c K e y T o k e n = " 3 1 b f 3 8 5 6 a d 3 6 4 e 3 5 "   l a n g u a g e = " n e u t r a l "   v e r s i o n S c o p e = " n o n S x S "   x m l n s : w c m = " h t t p : / / s c h e m a s . m i c r o s o f t . c o m / W M I C o n f i g / 2 0 0 2 / S t a t e "   x m l n s : x s i = " h t t p : / / w w w . w 3 . o r g / 2 0 0 1 / X M L S c h e m a - i n s t a n c e " > '  
 	 A d d - C o n t e n t   $ U n a t t e n d F i l e   - V a l u e   $ B l o c k 1  
 	  
 	  
 	 I f ( $ P r o d u c t K e y   - i n e   $ N u l l )  
 	 {  
 	 	 $ B l o c k P r o d u c t K e y   =   '  
 	 	 	 	 < U s e r D a t a >  
 	                                 < P r o d u c t K e y >  
 	                                         < K e y > ' + $ P r o d u c t K e y + ' < / K e y >  
 	                                         < W i l l S h o w U I > O n E r r o r < / W i l l S h o w U I >  
 	                                 < / P r o d u c t K e y >  
 	                                 < A c c e p t E u l a > t r u e < / A c c e p t E u l a >  
 	                         < / U s e r D a t a > '  
 	 	 A d d - C o n t e n t   $ U n a t t e n d F i l e   - V a l u e   $ B l o c k P r o d u c t K e y  
 	 }                        
 	  
 	 $ B l o c k I n s t a l l I m a g e   =   ' 	 	  
 	 	 	 	 < I m a g e I n s t a l l >  
 	                                 < O S I m a g e >  
 	                                         < I n s t a l l F r o m >  
 	                                                 < M e t a D a t a   w c m : a c t i o n = " a d d " >  
 	                                                         < K e y > / I M A G E / N A M E < / K e y >  
 	                                                         < V a l u e > ' + $ O S E d i t i o n + ' < / V a l u e >  
 	                                                 < / M e t a D a t a >  
 	                                         < / I n s t a l l F r o m >  
 	                                         < I n s t a l l T o >  
 	                                                 < D i s k I D > 0 < / D i s k I D >  
 	                                                 < P a r t i t i o n I D > 1 < / P a r t i t i o n I D >  
 	                                         < / I n s t a l l T o >  
 	                                 < / O S I m a g e >  
 	                         < / I m a g e I n s t a l l >  
 	                         < D i s k C o n f i g u r a t i o n >  
 	                                 < W i l l S h o w U I > O n E r r o r < / W i l l S h o w U I >  
 	                                 < D i s k   w c m : a c t i o n = " a d d " >  
 	                                         < C r e a t e P a r t i t i o n s >  
 	                                                 < C r e a t e P a r t i t i o n   w c m : a c t i o n = " a d d " >  
 	                                                         < O r d e r > 1 < / O r d e r >  
 	                                                         < S i z e > 1 0 5 0 0 < / S i z e >  
 	                                                         < T y p e > P r i m a r y < / T y p e >  
 	                                                 < / C r e a t e P a r t i t i o n >  
 	                                         < / C r e a t e P a r t i t i o n s >  
 	                                         < D i s k I D > 0 < / D i s k I D >  
 	                                         < W i l l W i p e D i s k > t r u e < / W i l l W i p e D i s k >  
 	                                         < M o d i f y P a r t i t i o n s >  
 	                                                 < M o d i f y P a r t i t i o n   w c m : a c t i o n = " a d d " >  
 	                                                         < A c t i v e > t r u e < / A c t i v e >  
 	                                                         < E x t e n d > t r u e < / E x t e n d >  
 	                                                         < F o r m a t > N T F S < / F o r m a t >  
 	                                                         < L e t t e r > C < / L e t t e r >  
 	                                                         < O r d e r > 1 < / O r d e r >  
 	                                                         < P a r t i t i o n I D > 1 < / P a r t i t i o n I D >  
 	                                                 < / M o d i f y P a r t i t i o n >  
 	                                         < / M o d i f y P a r t i t i o n s >  
 	                                 < / D i s k >  
 	                         < / D i s k C o n f i g u r a t i o n >  
 	                 < / c o m p o n e n t >  
 	         < / s e t t i n g s >  
 	         < s e t t i n g s   p a s s = " o o b e S y s t e m " >  
 	                 < c o m p o n e n t   n a m e = " M i c r o s o f t - W i n d o w s - S h e l l - S e t u p "   p r o c e s s o r A r c h i t e c t u r e = " a m d 6 4 "   p u b l i c K e y T o k e n = " 3 1 b f 3 8 5 6 a d 3 6 4 e 3 5 "   l a n g u a g e = " n e u t r a l "   v e r s i o n S c o p e = " n o n S x S "   x m l n s : w c m = " h t t p : / / s c h e m a s . m i c r o s o f t . c o m / W M I C o n f i g / 2 0 0 2 / S t a t e "   x m l n s : x s i = " h t t p : / / w w w . w 3 . o r g / 2 0 0 1 / X M L S c h e m a - i n s t a n c e " >  
 	                         < O O B E >  
 	                                 < H i d e E U L A P a g e > t r u e < / H i d e E U L A P a g e >  
 	                                 < N e t w o r k L o c a t i o n > W o r k < / N e t w o r k L o c a t i o n >  
 	                                 < P r o t e c t Y o u r P C > 1 < / P r o t e c t Y o u r P C >  
 	                                 < S k i p M a c h i n e O O B E > t r u e < / S k i p M a c h i n e O O B E >  
 	                                 < S k i p U s e r O O B E > t r u e < / S k i p U s e r O O B E >  
 	                         < / O O B E >  
 	                         < U s e r A c c o u n t s >  
 	                                 < A d m i n i s t r a t o r P a s s w o r d >  
 	                                         < V a l u e > V w B l A G w A Y w B v A G 0 A Z Q A x A D I A M w B B A G Q A b Q B p A G 4 A a Q B z A H Q A c g B h A H Q A b w B y A F A A Y Q B z A H M A d w B v A H I A Z A A = < / V a l u e >  
 	                                         < P l a i n T e x t > f a l s e < / P l a i n T e x t >  
 	                                 < / A d m i n i s t r a t o r P a s s w o r d >  
 	                         < / U s e r A c c o u n t s >  
 	                 < / c o m p o n e n t >  
 	         < / s e t t i n g s >  
 	         < s e t t i n g s   p a s s = " s p e c i a l i z e " >  
 	                 < c o m p o n e n t   n a m e = " M i c r o s o f t - W i n d o w s - T e r m i n a l S e r v i c e s - L o c a l S e s s i o n M a n a g e r "   p r o c e s s o r A r c h i t e c t u r e = " a m d 6 4 "   p u b l i c K e y T o k e n = " 3 1 b f 3 8 5 6 a d 3 6 4 e 3 5 "   l a n g u a g e = " n e u t r a l "   v e r s i o n S c o p e = " n o n S x S "   x m l n s : w c m = " h t t p : / / s c h e m a s . m i c r o s o f t . c o m / W M I C o n f i g / 2 0 0 2 / S t a t e "   x m l n s : x s i = " h t t p : / / w w w . w 3 . o r g / 2 0 0 1 / X M L S c h e m a - i n s t a n c e " >  
 	                         < f D e n y T S C o n n e c t i o n s > f a l s e < / f D e n y T S C o n n e c t i o n s >  
 	                 < / c o m p o n e n t >  
 	                 < c o m p o n e n t   n a m e = " N e t w o r k i n g - M P S S V C - S v c "   p r o c e s s o r A r c h i t e c t u r e = " a m d 6 4 "   p u b l i c K e y T o k e n = " 3 1 b f 3 8 5 6 a d 3 6 4 e 3 5 "   l a n g u a g e = " n e u t r a l "   v e r s i o n S c o p e = " n o n S x S "   x m l n s : w c m = " h t t p : / / s c h e m a s . m i c r o s o f t . c o m / W M I C o n f i g / 2 0 0 2 / S t a t e "   x m l n s : x s i = " h t t p : / / w w w . w 3 . o r g / 2 0 0 1 / X M L S c h e m a - i n s t a n c e " >  
 	                         < D o m a i n P r o f i l e _ E n a b l e F i r e w a l l > f a l s e < / D o m a i n P r o f i l e _ E n a b l e F i r e w a l l >  
 	                         < P r i v a t e P r o f i l e _ E n a b l e F i r e w a l l > f a l s e < / P r i v a t e P r o f i l e _ E n a b l e F i r e w a l l >  
 	                         < P u b l i c P r o f i l e _ E n a b l e F i r e w a l l > f a l s e < / P u b l i c P r o f i l e _ E n a b l e F i r e w a l l >  
 	                 < / c o m p o n e n t >  
 	                 < c o m p o n e n t   n a m e = " M i c r o s o f t - W i n d o w s - S h e l l - S e t u p "   p r o c e s s o r A r c h i t e c t u r e = " a m d 6 4 "   p u b l i c K e y T o k e n = " 3 1 b f 3 8 5 6 a d 3 6 4 e 3 5 "   l a n g u a g e = " n e u t r a l "   v e r s i o n S c o p e = " n o n S x S "   x m l n s : w c m = " h t t p : / / s c h e m a s . m i c r o s o f t . c o m / W M I C o n f i g / 2 0 0 2 / S t a t e "   x m l n s : x s i = " h t t p : / / w w w . w 3 . o r g / 2 0 0 1 / X M L S c h e m a - i n s t a n c e " >  
 	                         < C o m p u t e r N a m e > ' + $ C o m p u t e r N a m e + ' < / C o m p u t e r N a m e >  
 	                 < / c o m p o n e n t > '  
 	  
 	 A d d - C o n t e n t   $ U n a t t e n d F i l e   - V a l u e   $ B l o c k I n s t a l l I m a g e  
  
 	  
  
 	  
  
 	 I f ( $ S t a t i c I P   - i n e   " " )  
 	 {  
 	 	 #   I f   N e x t H o p A d d r e s s   P a r a m e t e r   i s   N u l l ,   S e t   t o   x . x . x . 1   d e r i v e d   f r o m   t h e   S t a t i c   I P  
 	 	 I f ( $ N e x t H o p A d d r e s s   - i e q   " " )  
 	 	 {  
 	 	 	 $ S t a t i c I P S p l i t   =   $ S t a t i c I P . S p l i t ( " . " )  
 	 	 	 $ N e x t H o p A d d r e s s   =   $ S t a t i c I P S p l i t [ 0 ] + " . " + $ S t a t i c I P S p l i t [ 1 ] + " . " + $ S t a t i c I P S p l i t [ 2 ] + " . " + " 1 "  
 	 	 }  
 	  
 	 	 $ B l o c k S t a t i c I P   =   '  
 	 	                 < c o m p o n e n t   n a m e = " M i c r o s o f t - W i n d o w s - T C P I P "   p r o c e s s o r A r c h i t e c t u r e = " a m d 6 4 "   p u b l i c K e y T o k e n = " 3 1 b f 3 8 5 6 a d 3 6 4 e 3 5 "   l a n g u a g e = " n e u t r a l "   v e r s i o n S c o p e = " n o n S x S "   x m l n s : w c m = " h t t p : / / s c h e m a s . m i c r o s o f t . c o m / W M I C o n f i g / 2 0 0 2 / S t a t e "   x m l n s : x s i = " h t t p : / / w w w . w 3 . o r g / 2 0 0 1 / X M L S c h e m a - i n s t a n c e " >  
 	 	                         < I n t e r f a c e s >  
 	 	                                 < I n t e r f a c e   w c m : a c t i o n = " a d d " >  
 	 	                                         < U n i c a s t I p A d d r e s s e s >  
 	 	                                                 < I p A d d r e s s   w c m : a c t i o n = " a d d "   w c m : k e y V a l u e = " 1 " > ' + $ S t a t i c I P + ' / 2 4 ' + ' < / I p A d d r e s s >  
 	 	                                         < / U n i c a s t I p A d d r e s s e s >  
 	 	                                         < I d e n t i f i e r > E t h e r n e t < / I d e n t i f i e r >  
 	 	                                         < I p v 4 S e t t i n g s >  
 	 	                                                 < D h c p E n a b l e d > f a l s e < / D h c p E n a b l e d >  
 	 	                                                 < R o u t e r D i s c o v e r y E n a b l e d > f a l s e < / R o u t e r D i s c o v e r y E n a b l e d >  
 	 	                                                 < M e t r i c > 1 0 < / M e t r i c >  
 	 	                                         < / I p v 4 S e t t i n g s >  
 	 	                                         < R o u t e s >  
 	 	                                                 < R o u t e   w c m : a c t i o n = " a d d " >  
 	 	                                                         < N e x t H o p A d d r e s s > ' + $ N e x t H o p A d d r e s s + ' < / N e x t H o p A d d r e s s >  
 	 	                                                         < I d e n t i f i e r > 1 < / I d e n t i f i e r >  
 	 	                                                         < M e t r i c > 1 0 < / M e t r i c >  
 	 	                                                         < P r e f i x > 0 . 0 . 0 . 0 / 0 < / P r e f i x >  
 	 	                                                 < / R o u t e >  
 	 	                                         < / R o u t e s >  
 	 	                                 < / I n t e r f a c e >  
 	 	                         < / I n t e r f a c e s >  
 	 	                 < / c o m p o n e n t > '  
  
 	 	 A d d - C o n t e n t   $ U n a t t e n d F i l e   - V a l u e   $ B l o c k S t a t i c I P  
 	 	  
 	 }  
 	  
 	  
 	 $ B l o c k S e t t i n g s   =   '  
 	 	 < / s e t t i n g s >  
 	         < s e t t i n g s   p a s s = " o f f l i n e S e r v i c i n g " >  
 	                 < c o m p o n e n t   n a m e = " M i c r o s o f t - W i n d o w s - L U A - S e t t i n g s "   p r o c e s s o r A r c h i t e c t u r e = " a m d 6 4 "   p u b l i c K e y T o k e n = " 3 1 b f 3 8 5 6 a d 3 6 4 e 3 5 "   l a n g u a g e = " n e u t r a l "   v e r s i o n S c o p e = " n o n S x S "   x m l n s : w c m = " h t t p : / / s c h e m a s . m i c r o s o f t . c o m / W M I C o n f i g / 2 0 0 2 / S t a t e "   x m l n s : x s i = " h t t p : / / w w w . w 3 . o r g / 2 0 0 1 / X M L S c h e m a - i n s t a n c e " >  
 	                         < E n a b l e L U A > f a l s e < / E n a b l e L U A >  
 	                 < / c o m p o n e n t >  
 	         < / s e t t i n g s >  
 	         < c p i : o f f l i n e I m a g e   c p i : s o u r c e = " w i m : c : / u s e r s / a d m i n i s t r a t o r . o t t e m l a p / d e s k t o p / i n s t a l l . w i m # W i n d o w s   S e r v e r   2 0 1 2   R 2   S E R V E R S T A N D A R D "   x m l n s : c p i = " u r n : s c h e m a s - m i c r o s o f t - c o m : c p i "   / >  
 	 < / u n a t t e n d > '  
 	  
 	 A d d - C o n t e n t   $ U n a t t e n d F i l e   - V a l u e   $ B l o c k S e t t i n g s  
  
 }  
  
  
 F u n c t i o n   X M L t o D a t a T a b l e  
 {  
 	 P a r a m (  
 	 $ P a t h ,  
 	 $ C u s t o m T a b l e N a m e ,  
 	 [ s w i t c h ] $ V a l i d a t e  
 	 )  
 	  
 	 $ X M L   =   [ x m l ] ( G e t - C o n t e n t   $ P a t h )  
  
 	 #   F o r e a c h   E n a b l e d   E n v i r o n m e n t  
 	 F o r e a c h ( $ X M L E n v i r o n m e n t   i n   $ X M L . D o c u m e n t E l e m e n t . E n v i r o n m e n t   |   ? { $ _ . E n a b l e d   - i e q   " T r u e " } )  
 	 {  
 	 	 W r i t e - H o s t   " E n v i r o n m e n t : "   $ X M L E n v i r o n m e n t . N a m e    
 	 	  
 	 	 #   C r e a t e   L i s t   o f   U n i q u e   C o l u m n   N a m e s  
 	 	 $ C o l u m n N a m e s   =   @ ( )  
 	 	 $ R o o t T a g s   =   $ X M L E n v i r o n m e n t . C h i l d N o d e s . N a m e   |   S e l e c t   - U n i q u e  
 	 	 F o r e a c h ( $ R o o t T a g   i n   $ R o o t T a g s )  
 	 	 {  
 	 	 	 $ C o l u m n N a m e s   + =   $ X M L E n v i r o n m e n t . $ R o o t T a g . C h i l d N o d e s . N a m e  
 	 	 }  
 	 	 $ C o l u m n N a m e s   + =   " S t a t u s "  
 	 	 $ C o l u m n N a m e s   =   $ C o l u m n N a m e s   |   S e l e c t   - U n i q u e  
  
 	 	 #   C r e a t e   T a b l e   w i t h   U n i q u e   C o l u m n   N a m e s  
 	 	 $ T a b l e N a m e   =   N e w - O b j e c t   S y s t e m . D a t a . D a t a T a b l e  
 	 	 F o r e a c h ( $ C o l u m n N a m e   i n   $ C o l u m n N a m e s )  
 	 	 {  
 	 	 	 $ C o l   =   N e w - O b j e c t   S y s t e m . D a t a . D a t a C o l u m n   $ C o l u m n N a m e , ( [ s t r i n g ] )  
 	 	 	 $ T a b l e N a m e . C o l u m n s . A d d ( $ C o l )  
 	 	 }  
 	 	  
 	 	  
 	 	 #   A D D   V M   S E T T I N G S   T O   T A B L E  
 	 	 F o r e a c h ( $ V M S e t t i n g   i n   $ X M L E n v i r o n m e n t . V M S e t t i n g s )  
 	 	 {  
 	 	 	 $ R o w   =   $ T a b l e N a m e . N e w R o w ( )  
 	 	 	 F o r e a c h ( $ E l e m e n t   i n   $ V M S e t t i n g . C h i l d N o d e s . N a m e )  
 	 	 	 {  
 	 	 	 	 $ R o w . $ E l e m e n t   =   $ V M S e t t i n g . $ E l e m e n t  
 	 	 	 }  
 	 	 	  
 	 	 	 $ T a b l e N a m e . R o w s . A d d ( $ r o w )  
 	 	  
 	 	  
 	 	 	 #   A D D   V M   D E F A U L T S   T O   T A B L E  
 	 	 	 F o r e a c h ( $ V M D e f a u l t   i n   $ X M L E n v i r o n m e n t . V M D e f a u l t s . C h i l d N o d e s . N a m e )  
 	 	 	 {  
 	 	 	 	 #   A d d   D e f a u l t   S e t t i n g   i f   I t   D o e s n ' t   E x i s t   F o r   E a c h   V M S e t t i n g  
 	 	 	 	 I f ( $ V M S e t t i n g . C h i l d N o d e s . N a m e   - i n o t c o n t a i n s   $ V M D e f a u l t )  
 	 	 	 	 {  
 	 	 	 	 	 $ R o w . $ V M D e f a u l t   =   $ X M L E n v i r o n m e n t . V M D e f a u l t s . $ V M D e f a u l t  
 	 	 	 	 }  
 	 	 	 }  
 	 	 	  
 	 	 	 #   A D D   G L O B A L   S E T T I N G S   T O   T A B L E  
 	 	 	 F o r e a c h ( $ E l e m e n t   i n   $ X M L E n v i r o n m e n t . G l o b a l . C h i l d N o d e s . N a m e )  
 	 	 	 {  
 	 	 	 	 $ R o w . $ E l e m e n t   =   $ X M L E n v i r o n m e n t . G l o b a l . $ E l e m e n t  
 	 	 	 }  
 	 	 }  
 	 	  
 	 	  
 	 	 S e t - V a r i a b l e   - N a m e   $ C u s t o m T a b l e N a m e   - S c o p e   G l o b a l   - V a l u e   $ T a b l e N a m e  
 	 	 $ G l o b a l : C o l u m n N a m e s   =   $ C o l u m n N a m e s  
 	 	  
 	 }  
 	  
 	 #   V a l i d a t e   M e t a   D a t a   T a b l e  
 	 I f ( $ V a l i d a t e . I s P r e s e n t   - i e q   " T r u e " )  
 	 {  
 	 	 # S e r v e r R o l e  
 	 	 $ V a l i d a t i o n R e s u l t   =   @ ( )  
 	 	 $ N o t N u l l   =   @ ( " C o m p u t e r N a m e " , " C o l l e c t i o n N a m e " , " H V R o o t D i r " , " V M S w i t c h " )  
 	 	 $ C a n B e N u l l   =   @ ( " P r o d u c t K e y " )  
 	 	 $ T r u e F a l s e   =   @ ( " R D S H A " )  
 	 	 $ T e s t P a t h   =   @ ( " O S I S O P a t h " )  
 	 	 $ S e r v e r R o l e s   =   @ ( " R D S W A " , " R D S C B " , " R D S G W " , " R D S S H " , " R D S S Q L " , " R D S L S " , " D C D N S " )  
 	 	 $ C o n t a i n s G B   =   @ ( " V M M e m o r y " , " V M V H D S i z e " )  
 	 	 $ I P C a n B e N u l l   =   $ ( " S t a t i c I P " , " N e x t H o p A d d r e s s " )  
  
 	 	 F o r e a c h ( $ T a b l e R o w   i n   $ M e t a D a t a T a b l e )  
 	 	 {  
 	 	 	 F o r e a c h ( $ C o l u m n   i n   $ C a n B e N u l l )  
 	 	 	 {  
 	 	 	 	 I f ( $ T a b l e R o w . $ C o l u m n   - i n e   " "   - a n d   $ T a b l e R o w . $ C o l u m n   - i n o t l i k e   " * - * - * - * - * " )  
 	 	 	 	 {  
 	 	 	 	 	 $ V a l i d a t i o n R e s u l t   + =   " E r r o r :   $ C o l u m n   [ M u s t   b e   E m p t y   o r   * - * - * - * - * ] "  
 	 	 	 	 }  
 	 	 	 }  
 	 	 	  
 	 	 	 F o r e a c h ( $ C o l u m n   i n   $ I P C a n B e N u l l )  
 	 	 	 {  
 	 	 	 	 I f ( $ T a b l e R o w . $ C o l u m n   - i n e   " "   - a n d   $ T a b l e R o w . $ C o l u m n   - i n o t l i k e   " * . * . * . * " )  
 	 	 	 	 {  
 	 	 	 	 	 $ V a l i d a t i o n R e s u l t   + =   " E r r o r :   $ C o l u m n   [ M u s t   b e   E m p t y   o r   * . * . * . * ] "  
 	 	 	 	 }  
 	 	 	 }  
 	 	 	  
 	 	 	 F o r e a c h ( $ C o l u m n   i n   $ N o t N u l l )  
 	 	 	 {  
 	 	 	 	 I f ( $ T a b l e R o w . $ C o l u m n   - i e q   " " )  
 	 	 	 	 {  
 	 	 	 	 	 $ V a l i d a t i o n R e s u l t   + =   " E r r o r :   $ C o l u m n   [ M u s t   C o n t a i n   a   V a l u e ] "  
 	 	 	 	 }  
 	 	 	  
 	 	 	 }  
 	 	 	  
 	 	 	 F o r e a c h ( $ C o l u m n   i n   $ T r u e F a l s e )  
 	 	 	 {  
 	 	 	 	 I f ( $ T a b l e R o w . $ C o l u m n   - i n e   " T r u e "   - a n d   $ T a b l e R o w . $ C o l u m n   - i n e   " F a l s e " )  
 	 	 	 	 {  
 	 	 	 	 	 $ V a l i d a t i o n R e s u l t   + =   " E r r o r :   $ C o l u m n   [ M u s t   B e   T r u e | F a l s e ] "  
 	 	 	 	 }  
 	 	 	  
 	 	 	 }  
 	 	 	  
 	 	 	 F o r e a c h ( $ P a t h   i n   $ T e s t P a t h )  
 	 	 	 {  
 	 	 	 	 I f ( ! ( T e s t - P a t h   " $ R o o t W o r k i n g D i r \ O S I m a g e s \ $ ( $ T a b l e R o w . $ P a t h ) " ) )  
 	 	 	 	 {  
 	 	 	 	 	 $ V a l i d a t i o n R e s u l t   + =   " E r r o r :   $ R o o t W o r k i n g D i r \ O S I m a g e s \ $ ( $ T a b l e R o w . $ P a t h )   [ P a t h   M u s t   E x i s t ] "  
 	 	 	 	 }  
 	 	 	 }  
 	 	 	  
 	 	 	  
 	 	 	 F o r e a c h ( $ C o l u m n   i n   $ C o n t a i n s G B )  
 	 	 	 {  
 	 	 	 	 I f ( $ T a b l e R o w . $ C o l u m n   - i n o t l i k e   " * G B * " )  
 	 	 	 	 {  
 	 	 	 	 	 $ V a l i d a t i o n R e s u l t   + =   " $ C o l u m n ` :   F a i l e d   V a l i d a t i o n   [ M u s t   B e   I n   G B ] "  
 	 	 	 	 }  
 	 	 	 } 	  
 	 	 	  
 	 	 	  
 	 	 # 	 I f ( $ T a b l e R o w . S e r v e r R o l e   - i n o t m a t c h   $ S e r v e r R o l e s )  
 	 	 # 	 {  
 	 	 # 	 	 $ V a l i d a t i o n R e s u l t   + =   " E r r o r :   $ S e r v e r R o l e "  
 	 	 # 	 }  
 	 	 	 	  
 	 	 	 I f ( $ T a b l e R o w . O S E d i t i o n   - i n o t m a t c h   " S e r v e r S t a n d a r d " )  
 	 	 	 {  
 	 	 	 	 $ V a l i d a t i o n R e s u l t   + =   " O S E d i t i o n :   F a i l e d   V a l i d a t i o n   [ S e r v e r S t a n d a r d ] "  
 	 	 	 }  
 	 	 	  
 	 	 	 I f ( $ T a b l e R o w . R D S D N S R R N a m e   - i n o t l i k e   " * . * "   - a n d   $ T a b l e R o w . R D S D N S R R N a m e   - i e q   " " )  
 	 	 	 {  
 	 	 	 	 $ V a l i d a t i o n R e s u l t   + =   " O S E d i t i o n :   F a i l e d   V a l i d a t i o n   [ M u s t   C o n t a i n   S t r i n g   o r   S t r i n g . D o m a i n ] "  
 	 	 	 }  
 	 	 	  
 	 	 	 I f ( $ T a b l e R o w . V M M e m o r y T y p e   - i n e   " S t a t i c "   - a n d   $ T a b l e R o w . V M M e m o r y T y p e   - i n e   " D y n a m i c " )  
 	 	 	 {  
 	 	 	 	 $ V a l i d a t i o n R e s u l t   + =   " V M M e m o r y T y p e :   F a i l e d   V a l i d a t i o n   [ S t a t i c | D y n a m i c ] "  
 	 	 	 }  
 	 	 	  
 	 	 	 I f ( [ i n t ] $ T a b l e R o w . V M P r o c e s s o r C o u n t   - l t   1 )  
 	 	 	 {  
 	 	 	 	 $ V a l i d a t i o n R e s u l t   + =   " V M P r o c e s s o r C o u n t :   F a i l e d   V a l i d a t i o n   [ M u s t   B e   [ I N T ]   G r e a t e r   T h a n   0 ] "  
 	 	 	 }  
 	 	 	  
 	 	 	 I f ( $ M e t a D a t a T a b l e . R o w s . S e r v e r R o l e   - i n o t c o n t a i n s   " R D S S Q L " )  
 	 	 	 {  
 	 	 	 	 $ V a l i d a t i o n R e s u l t   + =   " E r r o r :   S e r v e r   R o l e   R D S S Q L   M u s t   E x i s t   W h e n   R D S H A = T r u e "  
 	 	 	 }  
 	 	 	  
 	 	 	 #   F i n d   D u p l i c a t e   S t a t i c   I P ' s  
 	 	 	 I f ( ( $ M e t a D a t a T a b l e . R o w s . S t a t i c I P   |   G r o u p   |   %   {   $ h   =   @ { }   }   {   $ h [ $ _ . N a m e ]   =   $ _ . C o u n t   }   {   $ h   } ) . V a l u e s   - g t   1 )  
 	 	 	 {  
 	 	 	 	 $ V a l i d a t i o n R e s u l t   + =   " E r r o r :   D u p l i c a t e   S t a t i c   I P   A d d r e s s e s "  
 	 	 	 }  
 	 	 	  
 	 	 }  
  
  
 	 	 W r i t e - H o s t   " M e t a   D a t a   V a l i d a t i o n : "   - N o N e w l i n e  
  
 	 	 I f ( $ V a l i d a t i o n R e s u l t . C o u n t   - e q   0 )  
 	 	 {  
 	 	 	 W r i t e - H o s t   " S U C C E S S "   - F o r e g r o u n d C o l o r   D a r k G r e e n    
 	 	 }  
 	 	 E l s e  
 	 	 {  
 	 	 	 W r i t e - H o s t   " F A I L E D "   - F o r e g r o u n d C o l o r   R e d  
 	 	 	 $ V a l i d a t i o n R e s u l t   |   S e l e c t   - U n i q u e  
 	 	 	 W r i t e - H o s t   " A b o r t i n g . . . "   - F o r e g r o u n d C o l o r   R e d  
 	 	 	 E x i t  
 	 	 }  
 	 }  
 	  
 }  
  
 F u n c t i o n   P r e p H o s t  
 {  
 	 #   D i s a b l e   F i r e w a l l  
 	 I f ( ( G e t - N e t F i r e w a l l P r o f i l e ) . E n a b l e d   - i c o n t a i n s   " T r u e " )  
 	 {  
 	 	 W r i t e - H o s t   " D i s a b l i n g   F i r e w a l l   o n   L o c a l   C o m p u t e r "  
 	 	 G e t - N e t F i r e w a l l P r o f i l e   |   S e t - N e t F i r e w a l l P r o f i l e    E n a b l e d   F a l s e  
 	 }  
 	  
 	 #   R U N   A S   A d m i n i s t r a t o r   a n d   D i s a b l e   U A C  
 	 S e t - E x e c u t i o n P o l i c y   U n r e s t r i c t e d   - F o r c e  
 	 I f ( ( G e t - I t e m   w s m a n : \ l o c a l h o s t \ c l i e n t \ t r u s t e d h o s t s ) . V a l u e   - i n e   " * " ) { S e t - I t e m   w s m a n : \ l o c a l h o s t \ c l i e n t \ t r u s t e d h o s t s   *   - F o r c e }  
 	 I m p o r t - M o d u l e   H y p e r - V  
 	 S t a r t - P r o c e s s   p o w e r s h e l l   - V e r b   R u n A s   " S e t - I t e m P r o p e r t y   - P a t h   r e g i s t r y : : H K E Y _ L O C A L _ M A C H I N E \ S O F T W A R E \ M i c r o s o f t \ W i n d o w s \ C u r r e n t V e r s i o n \ P o l i c i e s \ S y s t e m   - N a m e   E n a b l e L U A   - V a l u e   0 "  
 }  
