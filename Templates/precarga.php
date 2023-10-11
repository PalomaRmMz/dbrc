<div ID="waitDiv" style="position:absolute; top:200px; visibility:hidden; left: 0px;">
<table cellpadding="6" cellspacing="0" border="0" bgcolor="#99366F"   bordercolor="#FFFFFF">
<tr>
  <td align=center>
<font  color="#FFFFFF" face="Verdana" size="4">Cargando página  espere por favor .........</font></td>
</tr></table>
</div>
<SCRIPT>
<!---
var DHTML = (document.getElementById || document.all || document.layers);
function ap_getObj(name) {
if (document.getElementById)
{ return document.getElementById(name).style; }
else if (document.all)
{ return document.all[name].style; }
else if (document.layers)
{ return document.layers[name]; }
}
function ap_showWaitMessage(div,flag) {
if (!DHTML) return;
var x = ap_getObj(div); x.visibility = (flag) ? 'visible':'hidden'
if(! document.getElementById) if(document.layers) x.left=280/2; return true; } ap_showWaitMessage('waitDiv', 3);
//-->
</SCRIPT>