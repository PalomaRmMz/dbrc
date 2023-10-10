<?php
	$nivel_dir="";
	require($nivel_dir.'config.php');
	require($nivel_dir.'db_type.php');
	require($nivel_dir.'utils/funcion.php');
	require($nivel_dir.'utils/existeconexion.php');
	
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<!-- TemplateBeginEditable name="doctitle" -->
<title>Promo Voto</title>
<!-- TemplateEndEditable -->
<!-- TemplateBeginEditable name="head" -->
<!-- TemplateEndEditable -->
<link href="../utils/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<table width="1050" height="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="marco">
  <tr height="100%">
    <td colspan="2" valign="top"><!-- TemplateBeginEditable name="contenido" -->
      <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#F3F3F3">
        <tr>
          <td height="30">&nbsp;</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
        </tr>
      </table>
    <!-- TemplateEndEditable --></td>
  </tr>
  <tr  class="etiqueta">
    <td width="389" height="18"  valign="bottom" bgcolor="#CCCCCC"><?php
			if(!isset($_SESSION['usuario'])) echo "";
			else echo $_SESSION['nombrep'];?></td>
    <td width="458"  valign="bottom" bgcolor="#CCCCCC"><div align="right" class="none">
      <?php echo fechahoy();
			?>
    </div></td>
  </tr>
  <tr>
    <td colspan="2" align="center" valign="top" bgcolor="#99356F" class="pie" height="15">&copy;COPYRIGHT 2016 Todos los derechos reservados Instituto Tlaxcalteca de Elecciones</td>
  </tr>
</table>
</body>
</html>
