/*  1:   */ package modulos;
/*  2:   */ 
/*  3:   */ public class Sms
/*  4:   */ {
/*  5:   */   public static final int ERROR = 0;
/*  6:   */   public static final int SUCCESS = 1;
/*  7:   */   private int tipo;
/*  8:   */   private String mensaje;
/*  9:   */   /*  9:   */   
/* 10:   */   public Sms(int tipo, String mensaje)
/* 11:   */   {
/* 12:15 */     this.tipo = tipo;
/* 13:16 */     this.mensaje = mensaje;
/* 14:   */   }
/* 15:   */   
/* 16:   */   public int getTipo()
/* 17:   */   {
/* 18:20 */     return this.tipo;
/* 19:   */   }
/* 20:   */   
/* 21:   */   public void setTipo(int tipo)
/* 22:   */   {
/* 23:24 */     this.tipo = tipo;
/* 24:   */   }
/* 25:   */   
/* 26:   */   public String getMensaje()
/* 27:   */   {
/* 28:28 */     return this.mensaje;
/* 29:   */   }
/* 30:   */   
/* 31:   */   public void setMensaje(String mensaje)
/* 32:   */   {
/* 33:32 */     this.mensaje = mensaje;
/* 34:   */   }
/* 35:   */ }


/* Location:           E:\Documentos\Boor\Afilaciones Industriales\NetBeansProyects\afilacionesIndustriales\web\WEB-INF\classes\
 * Qualified Name:     ViewModules.Sms
 * JD-Core Version:    0.7.0.1
 */