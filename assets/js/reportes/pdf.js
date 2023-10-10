 function printInfoReportes(combinaciones) {
     texto = {
         tipo_eleccion: $("#tipo_eleccion_repo option:selected").text(),
         distrito: $("#distrito_repo option:selected").text(),
         partido: $("#partido_repo option:selected").text(),
         tipo_candidatura: $("#tipo_candidatura_repo option:selected").text(),
         estado: $("#estado_repo option:selected").text(),
         genero: $("#genero_repo option:selected").text(),
         municipio: $("#municipio_repo option:selected").text()
     }

     //Se agrega informacion para DataTable en español
     $.extend(true, $.fn.dataTable.defaults, {
         "language": {
             "decimal": ",",
             "thousands": ".",
             "info": "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
             "infoEmpty": "Mostrando registros del 0 al 0 de un total de 0 registros",
             "infoPostFix": "",
             "infoFiltered": "(filtrado de un total de _MAX_ registros)",
             "loadingRecords": "Cargando...",
             "lengthMenu": "Mostrar _MENU_ registros",
             "paginate": {
                 "first": "Primero",
                 "last": "Último",
                 "next": "Siguiente",
                 "previous": "Anterior"
             },
             "processing": "Procesando...",
             "search": "Buscar:",
             "searchPlaceholder": "Término de búsqueda",
             "zeroRecords": "No se encontraron resultados",
             "emptyTable": "Ningún dato disponible en esta tabla",
             "aria": {
                 "sortAscending": ": Activar para ordenar la columna de manera ascendente",
                 "sortDescending": ": Activar para ordenar la columna de manera descendente"
             },
             //only works for built-in buttons, not for custom buttons
             "buttons": {
                 "create": "Nuevo",
                 "edit": "Cambiar",
                 "remove": "Borrar",
                 "copy": "Copiar",
                 "csv": "fichero CSV",
                 "excel": "tabla Excel",
                 "pdf": "documento PDF",
                 "print": "Imprimir",
                 "colvis": "Visibilidad columnas",
                 "collection": "Colección",
                 "upload": "Seleccione fichero...."
             },
             "select": {
                 "rows": {
                     _: '%d filas seleccionadas',
                     0: 'clic fila para seleccionar',
                     1: 'una fila seleccionada'
                 }
             }
         }
     });

     $.ajax({
         url: "servicios/consultaRegistro/obtenerInfoReportes.php",
         type: "POST",
         data: combinaciones,
     }).done(function(respuesta) {
         try {
             respuesta = JSON.parse(respuesta);
             console.log(respuesta);
             if (respuesta[0].datos == 0) {
                 console.error("No se pudo conectar a la base de datos");
             } else if (respuesta[0].datos == 1) {
                 console.error("No hay registro en la base de datos");
                 $("#table_reportes").hide('slow');
                 swal("ALERTA", "No se encontraron registros con estos parámetros", "warning");
             } else {
                 var fila = "";
                 num = 1;

                 datos = respuesta.map((item, index) => {
                     var rObj = {};
                     rObj[`num`] = index + 1;
                     rObj[`nombre`] = item.nombre + ' ' + item.app + ' ' + item.apm;
                     rObj[`candidatura`] = item.candidatura;
                     rObj[`prosup`] = item.prosup;
                     rObj[`clave`] = item.clave;
                     rObj[`num_emision`] = item.num_emision;
                     rObj[`ocr`] = item.ocr;
                     rObj[`cic`] = item.cic;
                     rObj[`seccion`] = item.seccion;
                     rObj[`estado`] = item.estado;
                     rObj[`distrito`] = item.distrito;
                     rObj[`pp`] = item.pp;
                     rObj[`genero`] = item.genero;
                     rObj[`dia`] = item.dia;
                     rObj[`fecha_nacimiento`] = item.fecha_nacimiento;
                     rObj[`edad`] = item.edad;
                     rObj[`nombre_comunidad`] = item.nombre_comunidad;
                     return rObj;
                 });
                 console.log(datos);
                 $("#tablareportes").html(fila);
                 $("#table_reportes").show('slow');

                 let base64;

                 //urlOpenshift = 'http://registro-de-candidatura-proyector.apps.us-west-1.starter.openshift-online.com/assets/img/logoite.jpg';
                 // urlLocal = 'http://localhost/registro_de_candidatura/assets/img/logoite.jpg';
                 urlLocal = 'http://192.168.1.25/assets/img/logoite.jpg';

                 toDataURL(urlLocal, function(dataUrl) {
                     base64 = dataUrl;
                 })

                 if ($.fn.dataTable.isDataTable('#table_report')) {
                     datatable.destroy();
                 }

                 datatable = $("#table_report").DataTable({
                     "destroy": true,
                     "dom": '<"dt-buttons"Bf><"clear">lirtp',
                     "paging": true,
                     "data": datos,
                     "order": [
                         [0, 'asc']
                     ],
                     "columns": [

                         { "data": "num" },
                         { "data": "nombre" },
                         { "data": "candidatura" },
                         { "data": "prosup" },
                         { "data": "clave" },
                         { "data": "num_emision" },
                         { "data": "ocr" },
                         { "data": "cic" },
                         { "data": "seccion" },
                         { "data": "estado" },
                         { "data": "distrito" },
                         { "data": "nombre_comunidad" },
                         { "data": "pp" },
                         { "data": "fecha_nacimiento" },
                         { "data": "edad" },
                         { "data": "genero" },
                         { "data": "dia" }
                         
                     ],
                     "columnDefs": [{
                         "render": function(data, type, row) {
                             return "<td> <span class='badge badge-" + data + "'>" + data + "</span> </td>"
                         },
                         "targets": 9
                     }, {
                         "searchable": false,
                         "targets": 0,

                     }],
                     "buttons": [{
                         download: 'open',
                         text: 'Imprimir',
                         extend: 'pdfHtml5',
                         filename: 'dt_custom_pdf',
                         orientation: 'landscape', //portrait
                         pageSize: 'legal', //A3 , A5 , A6 , legal , letter
                         messageTop: {
                             text: `Partido Pólitico/Coalición/Independiente: ${texto.partido }\n` +
                                 `${  combinaciones.tipo_eleccion == "5" || "4" ? "Municipio" :"Distrito"} :   ${ combinaciones.tipo_eleccion == "5" ? texto.municipio : texto.distrito  }  ${ combinaciones.tipo_eleccion == "5" ?  '\t\t  Comunidad: ' + texto.distrito  : '' } \t\t      Tipo de Elección: ${texto.tipo_eleccion}    \t  ${ combinaciones.tipo_eleccion == "5" ? '\n Tipo de Candidatura:  ' + texto.tipo_candidatura+'\t\t' : 'Tipo de Candidatura:  ' + texto.tipo_candidatura + '\n' }\t` + `Estado: ${texto.estado}\t\t\t\t Género: ${texto.genero}`,
                             fontSize: 12
                         },
                         exportOptions: {
                             columns: ':visible',
                             search: 'applied',
                             order: 'applied'
                         },
                         customize: function(doc) {
                             //Remove the title created by datatTables
                             doc.content.splice(0, 1);
                             var logo = base64;
                             // A documentation reference can be found at
                             // https://github.com/bpampuch/pdfmake#getting-started
                             // Set page margins [left,top,right,bottom] or [horizontal,vertical]
                             doc.pageMargins = [20, 60, 20, 30];
                             // Set the font size fot the entire document
                             doc.defaultStyle.fontSize = 7;
                             // Set the fontsize for the table header
                             doc.styles.tableHeader.fontSize = 7;

                             doc['header'] = (function() {
                                 return {
                                     columns: [{
                                             image: logo,
                                             width: 100,
                                             margin: [150, 0, 0, 0]
                                         },
                                         {
                                             alignment: 'center',
                                             text: 'INSTITUTO TLAXCALTECA DE ELECCIONES',
                                             fontSize: 18,
                                             margin: [10, 10, 0, 0]
                                         }
                                     ],
                                     margin: [0, 0, 0, 50]
                                 }
                             });

                             doc.defaultStyle.fontSize = 9;
                             // Set the fontsize for the table header
                             doc.styles.tableHeader.fontSize = 14;
                             doc.styles.tableHeader = {
                                 fillColor: '#90057D',
                                 color: 'white',
                                 alignment: 'center'
                             }

                             // Data URL

                             var objLayout = {};
                             objLayout['hLineWidth'] = function(i) { return .5; };
                             objLayout['vLineWidth'] = function(i) { return .5; };
                             objLayout['hLineColor'] = function(i) { return '#aaa'; };
                             objLayout['vLineColor'] = function(i) { return '#aaa'; };
                             objLayout['paddingLeft'] = function(i) { return 4; };
                             objLayout['paddingTop'] = function(i) { return 10; };
                             objLayout['paddingRight'] = function(i) { return 4; };
                             doc.content[1].layout = objLayout;
                         }
                     }, {
                         extend: 'excel',
                         text: 'Descargar Excel',
                         title: 'Registro de candidaturas'
                     }]
                 });

                 num = 1;

                 datatable.on('order.dt search.dt', function() {
                     datatable.column(0, { search: 'applied', order: 'applied' }).nodes().each(function(cell, i) {
                         cell.innerHTML = i + 1;
                         datatable.cell(cell).invalidate('dom');
                     });
                 }).draw();

                 $("#table_report").css("width", "1280px");
             }
         } catch (e) {
             console.error(respuesta);
             console.error(e);
         }

     }).fail(function(jqXHR, textStatus, errorThrown) {
         if (console && console.log) {
             console.error("La solicitud a fallado: " + textStatus);
         }
     });
 }


 function toDataURL(url, callback) {
     var xhr = new XMLHttpRequest();
     xhr.onload = function() {
         var reader = new FileReader();
         reader.onloadend = function() {
             callback(reader.result);
         }
         reader.readAsDataURL(xhr.response);
     };
     xhr.open('GET', url);
     xhr.responseType = 'blob';
     xhr.send();
 }