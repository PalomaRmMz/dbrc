<?php
	$nivel_dir="";
	require($nivel_dir.'config.php');
	require($nivel_dir.'db_type.php');
	require($nivel_dir.'utils/existeconexion.php');
	
?>
<html>
<head>
<? require($nivel_dir.'Templates/precarga.php');?>
<!-- TemplateBeginEditable name="doctitle" -->
<title>Promoci&oacute;n de Voto</title>
<!-- TemplateEndEditable --><meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="../utils/style.css" rel="stylesheet" type="text/css">
<!-- TemplateBeginEditable name="head" --><!-- TemplateEndEditable -->
</head>

<body >
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr  bgcolor="#000">
    <td valign="top" bgcolor="#99366F" height="12"><div align="center"><img src="../img/atencion.jpg" ></div></td>
  </tr>
  <tr>
    <td valign="top" height="13">&nbsp;</td>
  </tr>
  <tr height="100%"">
    <td valign="top"><!-- TemplateBeginEditable name="contenido" -->
    <form name="form1" method="post" action="">
      <table width="100%"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td>&nbsp;</td>
          <td height="30" valign="middle">&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td height="30" valign="middle"><div align="center" class="titulo">Titulos </div></td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
      </table>
    </form>
    <!-- TemplateEndEditable --></td>
  </tr>
  <tr bgcolor="#000" height="20">
      <td valign="top" bgcolor="#99366F" ><table width="100%"   border="0" cellpadding="0" cellspacing="0">
        <tr   >
          <td height="19" valign="baseline" bgcolor="#99366F" ><div align="center" class="pie"><?php
			if(!isset($_SESSION['usuario'])) echo "";
			else echo $_SESSION['nombrep'];?></div>            <div align="right" class="nombre"></div></td>
        </tr>
      </table></td>
  </tr>
</table>
</body>
<SCRIPT language=javascript>
<!-- 
ap_showWaitMessage('waitDiv', 0); 
//-->
</SCRIPT> 
</html>
