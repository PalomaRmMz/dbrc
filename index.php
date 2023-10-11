<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Sistema de Registro 2021</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://kit.fontawesome.com/ed1b64eef4.js" crossorigin="anonymous">
    </script>
    <link rel="stylesheet" href="assets/css/colors.css">

    <link rel="stylesheet" type="text/css"
        href="https://cdn.datatables.net/v/bs4-4.1.1/dt-1.10.21/datatables.min.css" />
    <link rel="stylesheet" href="assets/css/style.css">
    <script src="assets/js/admin-pass.js" type="text/javascript"></script>

</head>


<body>
    <!-- Inicia Login -->
    <div class="login_container login">
        <div class="row w-50 rounded shadow" style="background-color: #ffffff;">
            <div class="col-md-6 p-3">
                <form method="post">
                    <label class="form-label">Nombre de Usuario:</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="fa-solid fa-user"></i></span>
                        <input type="text" class="form-control" name="username" id="username" required>
                    </div>

                    <label class="form-label mt-3">Contraseña: </label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="fa-solid fa-user"></i></span>
                        <input type="password" class="form-control" name="pass" id="pass" required>
                        <span class="input-group-text" style="cursor: pointer;"
                            onclick="togglePasswordVisibility('pass', 'toggle1')">
                            <i class="fa-solid fa-eye-slash" id="toggle1"></i>
                        </span>
                    </div>

                    <input type="submit" class="btn btn-success mt-3 mx-auto" value="Iniciar Sesión" id="init" />
                </form>
            </div>
            <div class="col-md d-flex justify-content-center align-items-center">
                <img class="img-fluid" src="./assets/img/logoite.png" alt="Instituto Tlaxcalteca de Elecciones" />
            </div>
        </div>
    </div>

    <div class="dashboard">
        <div class="topbar">
            <div class="top-navbar">
                <div class="topbar-logo"></div>
                <form class="form-search" method="post" id="consul01">
                    <input class="form-control form-control-dark" type="text" name="" id="busqueda"
                        placeholder="&#xF002; Consulta de Registro (Clave de Elector)"
                        style="font-family:Arial, FontAwesome" autocomplete="off" maxlength="18" minlength="18">
                    <input class="pass-btn" type="submit">
                </form>
                <div class="drop-menu">
                    <span class="user-registrado dropdown-toggle" id="nombreCapturista">Oscar Morales </span>
                    <div class="dropdown-menu">
                        <ul class="menu-inside">
                            <li class="ite-link" data-page="historial" id="menuHistorial">
                                <a> <i class="fa fa-history"></i> Historial </a>
                            </li>
                            <li class="ite-link" data-page="usuarios" id="menuUsuarios">
                                <a> <i class="fa fa-users"></i> Usuarios </a>
                            </li>
                            <li>
                                <a data-toggle="modal" data-target="#modal-suspender"> <i class="fa fa-clock-o"></i>
                                    Suspender </a>
                            </li>
                            <li class="ite-link" data-page="exit" id="exit-btn">
                                <a> <i class="fa fa-times-circle"></i> Salir </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- Barra de menu -->
        <nav class="navbar navbar-dark sticky-top bg-ite flex-md-nowrap p-0">
            <div class="sidebar">
                <nav class="sidebar-nav active">
                    <ul class="in">
                        <li class="menu-item ite-link" data-page="gobernatura" id="menuGobernador">
                            <a>
                                <i class="fa fa-user-plus" aria-hidden="true"></i><span> Registro Gubernatura</span>
                            </a>
                        </li>
                        <li class="menu-item ite-link" data-page="registro" id="menuRegistro">
                            <a>
                                <i class="fa fa-user-plus" aria-hidden="true"></i><span> Registro Diputaciones</span>
                            </a>
                        </li>
                        <li class="menu-item ite-link" data-page="ayuntamiento" id="menuayuntamiento">
                            <a>
                                <i class="fa fa-user-plus" aria-hidden="true"></i><span> Registro Ayuntamientos</span>
                            </a>
                        </li>
                        <li class="menu-item ite-link" data-page="comunidad" id="menucomunidad">
                            <a>
                                <i class="fa fa-user-plus" aria-hidden="true"></i><span> Registro de Presidencias de
                                    Comunidad</span>
                            </a>
                        </li>
                        <li class="menu-item ite-link" data-page="subsanacion" id="menuSubsanacion">
                            <a>
                                <i class="fa fa-pencil" aria-hidden="true"></i><span> Subsanación</span>
                            </a>
                        </li>
                        <li class="menu-item ite-link" data-page="sustitucion" id="menuSustitucion">
                            <a>
                                <i class="fa fa-refresh" aria-hidden="true"></i><span> Sustitución</span>
                            </a>
                        </li>
                        <li class="menu-item ite-link" data-page="cancelacion" id="menuCancelacion">
                            <a>
                                <i class="fa fa-times-circle-o" aria-hidden="true"></i><span> Renuncia</span>
                            </a>
                        </li>
                        <li class="menu-item ite-link" data-page="reportes" id="menuReportes">
                            <a>
                                <i class="fa fa-print" aria-hidden="true"></i><span> Reportes</span>
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
        </nav>
        <!-- 
        *********************************************************    
        *********************************************************
        *********************************************************
            termina menu
        *********************************************************
        *********************************************************
        *********************************************************
        *********************************************************
        -->

        <!-- Inicio Gobernador-->
        <div class="contenido-pagina gobernatura">
            <div id="cont-gubernatura">
                <?php include("Templates/formulario.html"); ?>
            </div>
        </div>
        <!-- Fin Gobernador-->


        <div class="contenido-pagina registro">
            <div class="envol-div">
                <div class="titulo-pagina reg-titulo">
                    <i class="icon fa fa-user-plus"></i>
                    <div>
                        <h4>Añadir nueva candidatura a diputación</h4>
                        <p>Agregue la información solicitada para añadir una candidatura.</p>
                    </div>
                </div>

                <div>
                    <form action="" id="form-prueba" class="form-estilo row adduser-form">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="form-control-label">Tipo de elección <span
                                        class="tx-danger">*</span></label>
                                <select class="form-control" id="reg-tipoEleccion">
                                    <option value="0">Selecciona una opción</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="form-control-label">Distrito <span class="tx-danger">*</span></label>
                                <select class="form-control" id="reg-distritos" disabled>
                                </select>
                            </div>
                        </div>
                        <!-- Segunda fila -->
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="form-control-label">Partido Político / Coalición / Independiente<span
                                        class="tx-danger">*</span></label>
                                <select required class="form-control" id="reg-partidos-politicos" disabled>
                                </select>
                            </div>
                        </div>
                        <!-- otra fila -->
                        <div class="col-md-6" id="area-prelacion">
                            <div class="form-group">
                                <label class="form-control-label">Orden de prelación <span
                                        class="tx-danger">*</span></label>
                                <select class="form-control" id="reg-prelacion">
                                    <option value="">Selecciona una opción</option>
                                    <option value="01">01</option>
                                    <option value="02">02</option>
                                    <option value="03">03</option>
                                    <option value="04">04</option>
                                    <option value="05">05</option>
                                    <option value="06">06</option>
                                    <option value="07">07</option>
                                    <option value="08">08</option>
                                    <option value="09">09</option>
                                    <option value="10">10</option>
                                </select>
                            </div>
                        </div>
                    </form>
                </div>


                <div id="rdContainer">
                    <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active btnPro" id="pills-propietario-tab" data-toggle="pill"
                                href="#pills-propietario" role="tab" aria-controls="pills-home"
                                aria-selected="true">Propietario/a</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link btnSup" id="pills-suplente-tab" data-toggle="pill" href="#pills-suplente"
                                role="tab" aria-controls="pills-profile" aria-selected="false">Suplente</a>
                        </li>
                    </ul>

                    <div class="tab-content" id="pills-tabContent">
                        <div class="tab-pane fade show active" id="pills-propietario" role="tabpanel"
                            aria-labelledby="pills-propietario-tab">
                            <div class="row reg-pro formPro" id="RDPropietario">
                                <!-- Propietario -->
                                <div class="split-form">
                                    <form id="registroPropietario" method="post">
                                        <div class="marg-form">
                                            <h5 class="titulo"><i class="icon fa fa-user"></i> Propietario </h5>
                                            <div class="form-group">
                                                <label class="form-control-label">Nombre(s)<span
                                                        class="tx-danger">*</span></label>
                                                <input class="form-control" type="text" id="reg-pro-nombre"
                                                    onkeypress="return  restriccionNombre(event)">
                                            </div>
                                            <div class="form-group">
                                                <label class="form-control-label">Apellido Paterno<span
                                                        class="tx-danger"></span></label>
                                                <input class="form-control" type="text" id="reg-pro-ap">
                                            </div>
                                            <div class="form-group">
                                                <label class="form-control-label">Apellido Materno <span
                                                        class="tx-danger">*</span></label>
                                                <input class="form-control" type="text" id="reg-pro-am"
                                                    onkeypress="return  restriccionNombre(event)">
                                            </div>
                                            <div class="form-group">
                                                <label class="form-control-label">Fecha de Nacimiento <span
                                                        class="tx-danger">*</span></label>
                                                <input class="form-control" type="date" id="reg-pro-fecn"
                                                    min="1950-01-01" max="2003-02-27" maxlength="8">
                                            </div>
                                            <div class="form-group">
                                                <label class="form-control-label">Género <span
                                                        class="tx-danger">*</span></label>
                                                <select class="form-control rdGeneroP" id="reg-pro-genDip">
                                                    <option value="">Selecciona una opción</option>
                                                    <option value="MASCULINO">Masculino</option>
                                                    <option value="FEMENINO">Femenino</option>

                                                </select>
                                            </div>

                                            <div class="form-check" style="display: none;" id="boxDipMP">
                                                <input class="form-check-input doc-checkbox" type="checkbox"
                                                    id="checkDipMP">
                                                <label class="form-check-label form-control-label">
                                                    ¿Desea recibir informacion acerca de la paridad de genero?
                                                </label>
                                            </div>



                                            <div class="form-group" id="CemailDipMP" style="display: none;">
                                                <label class="form-control-label" id="etiq">Correo Electrónico</label>
                                                <input class="form-control" type="email" id="IemailDipMA" name="email"
                                                    placeholder="usuario@dominio.com" size="30">
                                            </div>
                                            <div class="form-group">
                                                <label class="form-control-label">Lugar de Nacimiento <span
                                                        class="tx-danger">*</span></label>
                                                <select required class="form-control estados" id="reg-pro-sitenac">
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label class="form-control-label">Clave de Elector <span
                                                        class="tx-danger">*</span></label>
                                                <input class="form-control" type="text" maxlength="18" minlength="18"
                                                    onkeypress="return  restriccion(event)"
                                                    placeholder="ABCD123456FDCVGBHC" id="reg-pro-claveElector">
                                            </div>
                                            <div class="form-group">
                                                <label class="form-control-label">CURP <span
                                                        class="tx-danger">*</span></label>
                                                <input class="form-control" type="text" maxlength="18" minlength="18"
                                                    placeholder="MECC020123HDFNRR04" id="reg-pro-curp"
                                                    onkeypress="return  restriccion(event)">
                                            </div>

                                            <!--nuevo campos ha agregar-->
                                            <div class="form-group">
                                                <label class="form-control-label">Número de emisión de la credencial
                                                    para votar<span class="tx-danger">*</span></label>
                                                <input type="text" class="form-control tiempo_residencia"
                                                    id="reg-pro-num_emision" name="reg-num_emision"
                                                    placeholder="Número de emisión de la credencial"
                                                    onkeypress="return  soloNumeros(event)" maxlength="4" minlength="1">
                                            </div>

                                            <div class="form-group">
                                                <label class="form-control-label">OCR<span
                                                        class="tx-danger">*</span></label>
                                                <input type="text" class="form-control tiempo_residencia"
                                                    id="reg-pro-ocr" name="OCR" placeholder="OCR"
                                                    onkeypress="return soloNumeros(event)" maxlength="13" minlength="1">
                                            </div>

                                            <div class="form-group">
                                                <label class="form-control-label">CIC (Código de Identificación de
                                                    Credencial para Votar)<span class="tx-danger"></span></label>
                                                <input class="form-control" name="CIC" type="text" maxlength="15"
                                                    minlength="15"
                                                    placeholder="Código de identificación de Credencial para Votar "
                                                    id="reg-pro-CIC">
                                            </div>

                                            <div class="form-group">
                                                <label class="form-control-label">Sección<span
                                                        class="tx-danger">*</span></label>
                                                <input type="text" class="form-control tiempo_residencia"
                                                    id="reg-pro-seccion" name="seccion" placeholder="Sección"
                                                    onkeypress="return soloNumeros(event)" maxlength="4" minlength="1">
                                            </div>
                                            <!--fin de los nuevos campos-->




                                            <div class="form-group">
                                                <label class="form-control-label">Tiempo de Residencia <span
                                                        class="tx-danger">*</span></label>
                                                <div class="input-group">
                                                    <label class="form-control-label d-none">Tiempo de Residencia <span
                                                            class="tx-danger">*</span></label>
                                                    <input type="text" class="form-control tiempo_residencia"
                                                        id="reg-pro-timeres" name="tiempo"
                                                        onkeypress="return  restriccionTime(event)" maxlength="2"
                                                        minlength="1">
                                                    <div class="input-group-append">
                                                        <span class="input-group-text">AÑOS</span>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="form-control-label">Sobrenombre</label>
                                                <input class="form-control" type="text" id="reg-pro-sobrenombre"
                                                    onkeypress="return  restriccionNombre(event)">
                                            </div>


                                            <div class="form-group fadeIn">
                                                <input type="checkbox" id="cboPoliticaDP">
                                                <label for="cboPoliticaDP" style="color:#868ba1;font-size: 16px;">He
                                                    leído y acepto la <a href="#">
                                                        Política de Privacidad <span class="tx-danger">*</span>
                                                    </a></label>
                                            </div>

                                        </div>
                                        <div class="justify-content-center btn-formulario">
                                            <button type="button" name="button" class="btn btn-secondary"
                                                id="eraseFDP">Cancelar</button>
                                            <button type="button" name="button" class="btn btn-primary"
                                                id="addAndContinue">Registrar Propietario</button>
                                        </div>
                                    </form>
                                </div>

                                <!-- Documentación del propietario  -->
                                <div class="split-form">
                                    <div class="marg-form">
                                        <h5 class="titulo"><i class="icon fa fa-file"></i> Documentación del Propietario
                                        </h5>
                                        <form method="POST" id="docPropietario">
                                            <div class="form-check">
                                                <input class="form-check-input doc-checkbox" type="checkbox"
                                                    id="pro-snr">
                                                <label class="form-check-label form-control-label" for="defaultCheck1">
                                                    Documento emitido por el SNR del INE.
                                                </label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input doc-checkbox" type="checkbox"
                                                    id="pro-regcan">
                                                <label class="form-check-label form-control-label" for="defaultCheck2">
                                                    Solicitud de Registro de Candidatura.
                                                </label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input doc-checkbox" type="checkbox"
                                                    id="pro-cred">
                                                <label class="form-check-label form-control-label" for="defaultCheck5">
                                                    Credencial para votar vigente.
                                                </label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input doc-checkbox" type="checkbox"
                                                    id="pro-actnac">
                                                <label class="form-check-label form-control-label" for="defaultCheck3">
                                                    Copia certificada del Acta de Nacimiento.
                                                </label>
                                            </div>
                                            <div class="form-check">
                                                <label class="form-check-label form-control-label">Copia certificada del
                                                    Acta de Nacimiento del padre o madre Tlaxcalteca</label>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" name="proCopiaMPT"
                                                        id="d-can1" value="SI">
                                                    <label class="form-check-label form-control-label"
                                                        for="d-can1">Si</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" name="proCopiaMPT"
                                                        id="d-can2" value="NO">
                                                    <label class="form-check-label form-control-label"
                                                        for="d-can2">No</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" name="proCopiaMPT"
                                                        id="d-can3" value="NO APLICA" checked="checked">
                                                    <label class="form-check-label form-control-label" for="d-can3">No
                                                        aplica</label>
                                                </div>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input doc-checkbox" type="checkbox"
                                                    id="pro-radicacion">
                                                <label class="form-check-label form-control-label" for="defaultCheck8">
                                                    Constancia de radicación.
                                                </label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input doc-checkbox" type="checkbox"
                                                    id="pro-aceptacion">
                                                <label class="form-check-label form-control-label" for="defaultCheck6">
                                                    Constancia de aceptación de la postulación.
                                                </label>
                                            </div>
                                            <div class="form-check">
                                                <label class="form-check-label form-control-label">Constancia de
                                                    separación del cargo de la función pública.</label>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input doc-checkbox" type="radio"
                                                        name="proSeparacionCargo" value="SI">
                                                    <label class="form-check-label form-control-label">Si</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input doc-checkbox" type="radio"
                                                        name="proSeparacionCargo" value="NO">
                                                    <label class="form-check-label form-control-label">No</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input doc-checkbox" type="radio"
                                                        name="proSeparacionCargo" value="NO APLICA" checked="checked">
                                                    <label class="form-check-label form-control-label">No aplica</label>
                                                </div>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input doc-checkbox" type="checkbox"
                                                    id="pro-inhabilitado">
                                                <label class="form-check-label form-control-label" for="defaultCheck10">
                                                    Escrito bajo protesta de decir verdad, que no se encuentra
                                                    inhabilitado para ocupar un cargo público y que no se cuenta con
                                                    antecedentes penales.
                                                </label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input doc-checkbox" type="checkbox"
                                                    id="pro-antpen">
                                                <label class="form-check-label form-control-label" for="defaultCheck9">
                                                    Carta de antecendentes no penales.
                                                </label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input doc-checkbox" type="checkbox"
                                                    id="pro-me">
                                                <label class="form-check-label form-control-label" for="defaultCheck11">
                                                    Manifestación de partido político.
                                                </label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input doc-checkbox" type="checkbox"
                                                    id="pro-ce">
                                                <label class="form-check-label form-control-label" for="defaultCheck12">
                                                    Informe de capacidad económica.
                                                </label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input doc-checkbox" type="checkbox"
                                                    id="pro-cp">
                                                <label class="form-check-label form-control-label" for="defaultCheck13">
                                                    Cédula de identificación fiscal.
                                                </label>
                                            </div>


                                            <!--cambios de ultima hora-->
                                            <div class="form-check">
                                                <input class="form-check-input doc-checkbox" type="checkbox"
                                                    id="doc-carta-3-dp">
                                                <label class="form-check-label form-control-label" for="doc-carta-3-dp">
                                                    CARTA 3 DE 3
                                                </label>
                                            </div>

                                            <div class="form-check">
                                                <label class="form-check-label form-control-label">CARTA
                                                    REELECCIÓN</label>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" name="cartaEleccion-dp"
                                                        id="cartaEleccion-dp-can1" value="SI">
                                                    <label class="form-check-label form-control-label"
                                                        for="cartaEleccion-dp-can1">Si</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" name="cartaEleccion-dp"
                                                        id="cartaEleccion-dp-can2" value="NO">
                                                    <label class="form-check-label form-control-label"
                                                        for="cartaEleccion-dp-can2">No</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" name="cartaEleccion-dp"
                                                        id="cartaEleccion-dp-can3" value="NO APLICA" checked="checked">
                                                    <label class="form-check-label form-control-label"
                                                        for="cartaEleccion-dp-can3">No aplica</label>
                                                </div>
                                            </div>


                                            <div class="form-check">
                                                <label class="form-check-label form-control-label">CONSTANCIA DE
                                                    AUTORIZACIÓN DEL ÓRGANO PARTIDISTA EN CASO DE RELECCIÓN</label>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio"
                                                        name="constAutOrganoPartidista-dp"
                                                        id="constAutOrganoPartidista-dp-can1" value="SI">
                                                    <label class="form-check-label form-control-label"
                                                        for="constAutOrganoPartidista-dp-can1">Si</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio"
                                                        name="constAutOrganoPartidista-dp"
                                                        id="constAutOrganoPartidista-dp-can2" value="NO">
                                                    <label class="form-check-label form-control-label"
                                                        for="constAutOrganoPartidista-dp-can2">No</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio"
                                                        name="constAutOrganoPartidista-dp"
                                                        id="constAutOrganoPartidista-dp-can3" value="NO APLICA"
                                                        checked="checked">
                                                    <label class="form-check-label form-control-label"
                                                        for="constAutOrganoPartidista-dp-can3">No aplica</label>
                                                </div>
                                            </div>

                                            <div class="form-check">
                                                <label class="form-check-label form-control-label">MANIFESTACIÓN DE
                                                    AUTOADSCRIPCIÓN INDÍGENA</label>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio"
                                                        name="manifestacionIndigena-dp"
                                                        id="manifestacionIndigena-dp-can1" value="SI">
                                                    <label class="form-check-label form-control-label"
                                                        for="manifestacionIndigena-dp-can1">Si</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio"
                                                        name="manifestacionIndigena-dp"
                                                        id="manifestacionIndigena-dp-can2" value="NO">
                                                    <label class="form-check-label form-control-label"
                                                        for="manifestacionIndigena-dp-can2">No</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio"
                                                        name="manifestacionIndigena-dp"
                                                        id="manifestacionIndigena-dp-can3" value="NO APLICA"
                                                        checked="checked">
                                                    <label class="form-check-label form-control-label"
                                                        for="manifestacionIndigena-dp-can3">No aplica</label>
                                                </div>
                                            </div>


                                            <div class="form-check">
                                                <label class="form-check-label form-control-label">CONSTANCIAS QUE
                                                    ACREDITEN EL VÍNCULO COMUNITARIO</label>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio"
                                                        name="consVinculoComuni-dp" id="consVinculoComuni-dp-can1"
                                                        value="SI">
                                                    <label class="form-check-label form-control-label"
                                                        for="consVinculoComuni-dp-can1">Si</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio"
                                                        name="consVinculoComuni-dp" id="consVinculoComuni-dp-can2"
                                                        value="NO">
                                                    <label class="form-check-label form-control-label"
                                                        for="consVinculoComuni-dp-can2">No</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio"
                                                        name="consVinculoComuni-dp" id="consVinculoComuni-dp-can3"
                                                        value="NO APLICA" checked="checked">
                                                    <label class="form-check-label form-control-label"
                                                        for="consVinculoComuni-dp-can3">No aplica</label>
                                                </div>
                                            </div>
                                            <!--fin cambios de ultima hora-->


                                        </form>
                                    </div>
                                    <!-- marg-form -->
                                </div>

                            </div>
                            <!-- row -->
                        </div>
                        <div class="tab-pane fade" id="pills-suplente" role="tabpanel"
                            aria-labelledby="pills-suplente-tab">
                            <div class="row reg-sup">
                                <!-- Suplente -->
                                <div class="split-form">
                                    <form method="post" id="registroSuplente">
                                        <div class="marg-form">

                                            <h5 class="titulo"><i class="icon fa fa-user"></i> Suplente</h5>
                                            <div class="form-group">
                                                <label class="form-control-label">Nombre(s)<span
                                                        class="tx-danger">*</span></label>
                                                <input class="form-control" type="text" id="reg-sup-nombre"
                                                    onkeypress="return  restriccionNombre(event)">
                                            </div>
                                            <div class="form-group">
                                                <label class="form-control-label">Apellido Paterno<span
                                                        class="tx-danger">*</span></label>
                                                <input class="form-control" type="text" id="reg-sup-ap">
                                            </div>
                                            <div class="form-group">
                                                <label class="form-control-label">Apellido Materno <span
                                                        class="tx-danger">*</span></label>
                                                <input class="form-control" type="text" id="reg-sup-am"
                                                    onkeypress="return  restriccionNombre(event)">
                                            </div>
                                            <div class="form-group">
                                                <label class="form-control-label">Fecha de Nacimiento <span
                                                        class="tx-danger">*</span></label>
                                                <input class="form-control" type="date" id="reg-sup-fecn"
                                                    min="1950-01-01" max="2003-02-27" maxlength="8">
                                            </div>
                                            <div class="form-group">
                                                <label class="form-control-label">Género <span
                                                        class="tx-danger">*</span></label>
                                                <select class="form-control rdGeneroS" id="reg-sup-gen">
                                                    <option value="">Selecciona una opción</option>
                                                    <option value="MASCULINO">Masculino</option>
                                                    <option value="FEMENINO">Femenino</option>
                                                </select>
                                            </div>
                                            <div class="form-check" style="display: none;" id="boxDipMS">
                                                <input class="form-check-input doc-checkbox" type="checkbox"
                                                    id="checkDipMS">
                                                <label class="form-check-label form-control-label">
                                                    ¿Desea recibir informacion acerca de la paridad de genero?
                                                </label>
                                            </div>



                                            <div class="form-group" id="CemailDipMS" style="display: none;">
                                                <label class="form-control-label" id="etiq">Correo Electrónico</label>
                                                <input class="form-control" type="email" id="IemailDipMAS" name="email"
                                                    placeholder="usuario@dominio.com" size="30">
                                            </div>
                                            <div class="form-group">
                                                <label class="form-control-label">Lugar de Nacimiento <span
                                                        class="tx-danger">*</span></label>
                                                <select required class="form-control estado"
                                                    id="reg-sup-sitenac"></select>
                                            </div>
                                            <div class="form-group">
                                                <label class="form-control-label">Clave de Elector <span
                                                        class="tx-danger">*</span></label>
                                                <input class="form-control" type="text" maxlength="18" minlength="18"
                                                    onkeypress="return  restriccion(event)"
                                                    placeholder="ABCD123456FDCVGBHC" id="reg-sup-claveElector">
                                            </div>
                                            <div class="form-group">
                                                <label class="form-control-label">CURP <span
                                                        class="tx-danger">*</span></label>
                                                <input class="form-control" type="text" maxlength="18" minlength="18"
                                                    placeholder="MECC020123HDFNRR04" id="reg-sup-curp"
                                                    onkeypress="return  restriccion(event)">
                                            </div>




                                            <!--nuevo campos ha agregar-->
                                            <div class="form-group">
                                                <label class="form-control-label">Número de emisión de la credencial
                                                    para votar<span class="tx-danger">*</span></label>
                                                <input type="text" class="form-control tiempo_residencia"
                                                    id="reg-sup-num_emision" name="reg-sup-num_emision"
                                                    placeholder="Número de emisión de la credencial"
                                                    onkeypress="return  soloNumeros(event)" maxlength="4" minlength="1">
                                            </div>

                                            <div class="form-group">
                                                <label class="form-control-label">OCR<span
                                                        class="tx-danger">*</span></label>
                                                <input type="text" class="form-control tiempo_residencia"
                                                    id="reg-sup-ocr" name="OCR" placeholder="OCR"
                                                    onkeypress="return soloNumeros(event)" maxlength="13" minlength="1">
                                            </div>

                                            <div class="form-group">
                                                <label class="form-control-label">CIC (Código de Identificación de
                                                    Credencial para Votar)<span class="tx-danger"></span></label>
                                                <input class="form-control" name="CIC" type="text" maxlength="15"
                                                    minlength="15"
                                                    placeholder="Código de identificación de Credencial para Votar "
                                                    id="reg-sup-CIC">
                                            </div>

                                            <div class="form-group">
                                                <label class="form-control-label">Sección<span
                                                        class="tx-danger">*</span></label>
                                                <input type="text" class="form-control tiempo_residencia"
                                                    id="reg-sup-seccion" name="seccion" placeholder="Sección"
                                                    onkeypress="return soloNumeros(event)" maxlength="4" minlength="1">
                                            </div>
                                            <!--fin de los nuevos campos-->






                                            <div class="form-group">
                                                <label class="form-control-label">Tiempo de Residencia <span
                                                        class="tx-danger">*</span></label>
                                                <div class="input-group-prepend">
                                                    <label class="form-control-label d-none">Tiempo de Residencia <span
                                                            class="tx-danger">*</span></label>
                                                    <input class="form-control tiempo_residencia" type="text"
                                                        id="reg-sup-timeres" aria-describedby="inputGroupPrepend"
                                                        onkeypress="return  restriccionTime(event)" maxlength="2"
                                                        minlength="1">
                                                    <span class="input-group-text" id="inputGroupPrepend">Años</span>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="form-control-label">Sobrenombre</label>
                                                <input class="form-control" type="text" id="reg-sup-sobrenombre"
                                                    onkeypress="return  restriccionNombre(event)">
                                            </div>
                                            <div class="form-group fadeIn">
                                                <input type="checkbox" id="cboPoliticaDS">
                                                <label for="cboPoliticaDS" style="color:#868ba1;font-size: 16px;">He
                                                    leído y acepto la <a href="#">
                                                        Política de Privacidad <span class="tx-danger">*</span>
                                                    </a></label>
                                            </div>
                                        </div>
                                        <div class="justify-content-center btn-formulario">
                                            <button type="button" name="button" class="btn btn-secondary"
                                                id="eraseFDS">Cancelar</button>
                                            <button type="button" name="button" class="btn btn-primary"
                                                id="addCandidatura">Registrar Suplente</button>
                                        </div>
                                    </form>
                                </div>
                                <!-- Documentación de suplente  -->
                                <div class="split-form">
                                    <div class="marg-form">
                                        <h5 class="titulo"><i class="icon fa fa-file"></i> Documentación del Suplente
                                        </h5>
                                        <form id="docSuplente" method="post">
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" id="doc-snr-sup">
                                                <label class="form-check-label form-control-label" for="defaultCheck1">
                                                    Documento emitido por el SNR del INE.
                                                </label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" id="doc-regcan-sup">
                                                <label class="form-check-label form-control-label" for="defaultCheck2">
                                                    Solicitud de Registro.
                                                </label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" id="doc-cred-sup">
                                                <label class="form-check-label form-control-label" for="defaultCheck5">
                                                    Credencial para votar.
                                                </label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" id="doc-actnac-sup">
                                                <label class="form-check-label form-control-label" for="defaultCheck3">
                                                    Copia certificada del Acta de Nacimiento.
                                                </label>
                                            </div>
                                            <div class="form-check">
                                                <label class="form-check-label form-control-label">Copia certificada del
                                                    Acta de Nacimiento del padre o madre Tlaxcalteca</label>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" name="copiaMPTsup"
                                                        id="d-canS1" value="SI">
                                                    <label class="form-check-label form-control-label"
                                                        for="d-canS1">Si</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" name="copiaMPTsup"
                                                        id="d-canS2" value="NO">
                                                    <label class="form-check-label form-control-label"
                                                        for="d-canS2">No</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" name="copiaMPTsup"
                                                        id="d-canS3" value="NO APLICA" checked="checked">
                                                    <label class="form-check-label form-control-label" for="d-canS3">No
                                                        aplica</label>
                                                </div>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" id="doc-radicacion-sup">
                                                <label class="form-check-label form-control-label" for="defaultCheck8">
                                                    Constancia de radicación.
                                                </label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" id="doc-aceptacion-sup">
                                                <label class="form-check-label form-control-label" for="defaultCheck6">
                                                    Constancia de aceptación de la postulación.
                                                </label>
                                            </div>
                                            <div class="form-check">
                                                <label class="form-check-label form-control-label">Constancia de
                                                    separación del cargo o la función pública.</label>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio"
                                                        name="separacionCargoSup" value="SI">
                                                    <label class="form-check-label form-control-label">Si</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio"
                                                        name="separacionCargoSup" value="NO">
                                                    <label class="form-check-label form-control-label">No</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio"
                                                        name="separacionCargoSup" value="NO APLICA" checked="checked">
                                                    <label class="form-check-label form-control-label">No aplica</label>
                                                </div>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox"
                                                    id="doc-inhabilitado-sup">
                                                <label class="form-check-label form-control-label" for="defaultCheck10">
                                                    Escrito bajo protesta de decir verdad, que no se encuentra
                                                    inhabilitado para ocupar un cargo público y que no se cuenta con
                                                    antecedentes penales.
                                                </label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" id="doc-antpen-sup">
                                                <label class="form-check-label form-control-label" for="defaultCheck9">
                                                    Constancia de no antecendentes penales.
                                                </label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" id="doc-me-sup">
                                                <label class="form-check-label form-control-label" for="defaultCheck11">
                                                    Manifestación de partido político.
                                                </label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" id="doc-ce-sup">
                                                <label class="form-check-label form-control-label" for="defaultCheck12">
                                                    Informe de capacidad económica.
                                                </label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" id="doc-cp-sup">
                                                <label class="form-check-label form-control-label" for="defaultCheck13">
                                                    Cédula de identificación fiscal.
                                                </label>
                                            </div>





                                            <!--cambios de ultima hora-->
                                            <div class="form-check">
                                                <input class="form-check-input doc-checkbox" type="checkbox"
                                                    id="doc-carta-3-ds">
                                                <label class="form-check-label form-control-label" for="doc-carta-3-ds">
                                                    CARTA 3 DE 3
                                                </label>
                                            </div>

                                            <div class="form-check">
                                                <label class="form-check-label form-control-label">CARTA
                                                    REELECCIÓN</label>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" name="cartaEleccion-ds"
                                                        id="cartaEleccion-ds-can1" value="SI">
                                                    <label class="form-check-label form-control-label"
                                                        for="cartaEleccion-ds-can1">Si</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" name="cartaEleccion-ds"
                                                        id="cartaEleccion-ds-can2" value="NO">
                                                    <label class="form-check-label form-control-label"
                                                        for="cartaEleccion-ds-can2">No</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" name="cartaEleccion-ds"
                                                        id="cartaEleccion-ds-can3" value="NO APLICA" checked="checked">
                                                    <label class="form-check-label form-control-label"
                                                        for="cartaEleccion-ds-can3">No aplica</label>
                                                </div>
                                            </div>


                                            <div class="form-check">
                                                <label class="form-check-label form-control-label">CONSTANCIA DE
                                                    AUTORIZACIÓN DEL ÓRGANO PARTIDISTA EN CASO DE RELECCIÓN</label>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio"
                                                        name="constAutOrganoPartidista-ds"
                                                        id="constAutOrganoPartidista-ds-can1" value="SI">
                                                    <label class="form-check-label form-control-label"
                                                        for="constAutOrganoPartidista-ds-can1">Si</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio"
                                                        name="constAutOrganoPartidista-ds"
                                                        id="constAutOrganoPartidista-ds-can2" value="NO">
                                                    <label class="form-check-label form-control-label"
                                                        for="constAutOrganoPartidista-ds-can2">No</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio"
                                                        name="constAutOrganoPartidista-ds"
                                                        id="constAutOrganoPartidista-ds-can3" value="NO APLICA"
                                                        checked="checked">
                                                    <label class="form-check-label form-control-label"
                                                        for="constAutOrganoPartidista-ds-can3">No aplica</label>
                                                </div>
                                            </div>

                                            <div class="form-check">
                                                <label class="form-check-label form-control-label">MANIFESTACIÓN DE
                                                    AUTOADSCRIPCIÓN INDÍGENA</label>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio"
                                                        name="manifestacionIndigena-ds"
                                                        id="manifestacionIndigena-ds-can1" value="SI">
                                                    <label class="form-check-label form-control-label"
                                                        for="manifestacionIndigena-ds-can1">Si</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio"
                                                        name="manifestacionIndigena-ds"
                                                        id="manifestacionIndigena-ds-can2" value="NO">
                                                    <label class="form-check-label form-control-label"
                                                        for="manifestacionIndigena-ds-can2">No</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio"
                                                        name="manifestacionIndigena-ds"
                                                        id="manifestacionIndigena-ds-can3" value="NO APLICA"
                                                        checked="checked">
                                                    <label class="form-check-label form-control-label"
                                                        for="manifestacionIndigena-ds-can3">No aplica</label>
                                                </div>
                                            </div>


                                            <div class="form-check">
                                                <label class="form-check-label form-control-label">CONSTANCIAS QUE
                                                    ACREDITEN EL VÍNCULO COMUNITARIO</label>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio"
                                                        name="consVinculoComuni-ds" id="consVinculoComuni-ds-can1"
                                                        value="SI">
                                                    <label class="form-check-label form-control-label"
                                                        for="consVinculoComuni-ds-can1">Si</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio"
                                                        name="consVinculoComuni-ds" id="consVinculoComuni-ds-can2"
                                                        value="NO">
                                                    <label class="form-check-label form-control-label"
                                                        for="consVinculoComuni-ds-can2">No</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio"
                                                        name="consVinculoComuni-ds" id="consVinculoComuni-ds-can3"
                                                        value="NO APLICA" checked="checked">
                                                    <label class="form-check-label form-control-label"
                                                        for="consVinculoComuni-ds-can3">No aplica</label>
                                                </div>
                                            </div>
                                            <!--fin cambios de ultima hora-->





                                        </form>
                                    </div>
                                    <!-- marg-form -->
                                </div>

                            </div>
                            <!-- .row -->
                        </div>
                    </div>
                </div>


            </div>
            <!-- envol-div -->
        </div>

        <!--Inicio registro de ayuntamientos-->
        <div class="contenido-pagina ayuntamiento">
            <div id="cont-gubernatura">
                <?php include("Templates/formularioMunicipio.html"); ?>
            </div>
        </div>
        <!--Fin Paginas de ayuntamiento-->

        <!--Inicio pagina Comunidades -->
        <div class="contenido-pagina comunidad">
            <div id="cont-comunidad">
                <?php include("Templates/formularioComunidad.html"); ?>
            </div>
        </div>
        <!--Fin pagina comunidades  -->


        <div class="contenido-pagina subsanacion">
            <div class="envol-div">
                <div class="titulo-pagina">
                    <i class="icon fa fa-user"></i>
                    <div>
                        <h4>Subsanar información de la Candidatura</h4>
                        <p>Coloque la clave de elector del propietario o suplente de la candidatura al que se le va a
                            completar/modificar información.</p>
                    </div>
                </div>
                <div class="form-group row justify-content-center form-sust">
                    <form class="row" method="post">
                        <label for="clave-elector-original" class="col-lg-2 col-form-label">Clave Elector</label>
                        <div class="col-lg-6">
                            <input type="text" class="form-control" placeholder="ABCD123456FDCVGBHC"
                                id="busqueda-subsanar" autocomplete="off" maxlength="18" minlength="18">
                        </div>
                        <button type="submit" class="btn btn-primary col-lg-2 btn-candsub" id="search_subsanacion"><i
                                class="fa fa-search"></i> Buscar</button>
                    </form>
                </div>
                <!-- Subsanacion Representacion proporcional -->
                <div id="edit-subsanacion">
                    <?php include("Templates/modalSubsanacion.html"); ?>
                </div>
                <!--Subsanacion Representacion Proporcional -->
            </div>
        </div>


        <div class="contenido-pagina sustitucion">
            <div class="envol-div">
                <div class="titulo-pagina">
                    <i class="icon fa fa-user"></i>
                    <div>
                        <h4>Candidatura a Sustituir</h4>
                        <p>Coloque la clave de elector del propietario o suplente de la candidatura a sustituir.</p>
                    </div>
                </div>
                <div class="form-group row justify-content-center form-sust">
                    <form class="row" method="post">
                        <label for="clave-elector-original" class="col-lg-2 col-form-label">Clave Elector</label>
                        <div class="col-lg-6">
                            <input type="text" class="form-control" placeholder="ABCD123456FDCVGBHC"
                                id="busqueda-sustituir" autocomplete="off" maxlength="18" minlength="18">
                        </div>
                        <button type="submit" class="btn btn-primary col-lg-2 btn-sust"><i class="fa fa-search"></i>
                            Buscar</button>
                    </form>
                </div>

                <div class="infoc-sustitucion">

                    <!-- Informacion Prelacion -->
                    <div class="row no-gutters cand-exist candidato-plurinominal">
                        <div class="col-md-2">
                            <div class="form-group">
                                <label class="form-control-label">Nombre(s)</label>
                                <div class="sus-nombre"></div>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="form-group">
                                <label class="form-control-label">Apellido Paterno</label>
                                <div class="sus-ap"></div>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="form-group">
                                <label class="form-control-label">Apellido Materno</label>
                                <div class="sus-am"></div>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="form-group">
                                <label class="form-control-label">Tipo de Candidatura</label>
                                <div class="sus-candidatura"></div>
                            </div>
                        </div>


                        <div class="col-md-4">
                            <div class="form-group">
                                <label class="form-control-label">CURP</label>
                                <div class="sus-curp"></div>
                            </div>
                        </div>


                        <!--INICIO DE NUEVOS CAMPOS-->

                        <div class="col-md-4">
                            <div class="form-group">
                                <label class="form-control-label">NÚMERO DE EMISIÓN</label>
                                <div class="sus-candidato_num_emision-rp"></div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label class="form-control-label">OCR</label>
                                <div class="sus-candidato_ocr-rp"></div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label class="form-control-label">CIC</label>
                                <div class="sus-candidato_cic-rp"></div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label class="form-control-label">SECCIÓN</label>
                                <div class="sus-candidato_seccion-rp"></div>
                            </div>
                        </div>

                        <!--FIN NUEVOS CAMPOS-->


                        <!-- Segunda fila -->
                        <div class="col-md-2 sus-comunidad">
                            <div class="form-group">
                                <label class="form-control-label">Tipo de Elección</label>
                                <div id="sus-comunidad"></div>
                            </div>
                        </div>
                        <div class="col-md-4 sus-prelacion">
                            <div class="form-group">
                                <label class="form-control-label">Prelación</label>
                                <div id="sus-prelacion"></div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label class="form-control-label">Partido Político</label>
                                <div class="sus-pp"></div>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="form-group">
                                <label class="form-control-label">Género</label>
                                <div class="sus-genero"></div>
                            </div>
                        </div>
                    </div>


                    <!-- Comienza titulo secundario -->
                    <div class="titulo-secundario title-sust">
                        <i class="icon fa fa-user-plus"></i>
                        <div>
                            <h4>Candidatura Nueva</h4>
                            <p>Coloque la información de la nueva candidatura.</p>
                        </div>
                    </div>
                    <!-- Ahora formulario para agregar informacion del nuevo candidato -->
                    <div class="form-estilo row form-sust">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="form-control-label">Fecha de Sustitución <span
                                        class="tx-danger">*</span></label>
                                <div id="fechaSustitucion"></div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="form-control-label">Motivo de Sustitución <span
                                        class="tx-danger">*</span></label>
                                <select class="form-control" id="motivoSustitucion">
                                    <option value="">Selecciona una opción</option>
                                    <option value="INAHBILITACION">Inhabilitación</option>
                                    <option value="INCAPACIDAD">Incapacidad</option>
                                    <option value="RENUNCIA">Renuncia</option>
                                    <option value="FALLECIMIENTO">Fallecimiento</option>
                                </select>
                            </div>
                        </div>
                        <!-- Segunda fila -->
                        <div class="split-form">
                            <div class="marg-form">
                                <form id="infoSustitucion" method="post">
                                    <div class="form-group">
                                        <label class="form-control-label">Nombre(s) <span
                                                class="tx-danger">*</span></label>
                                        <input class="form-control" onkeypress="return  restriccionNombre(event)"
                                            type="text" id="new-nombre">
                                    </div>
                                    <div class="form-group">
                                        <label class="form-control-label">Apellido Paterno <span
                                                class="tx-danger">*</span></label>
                                        <input class="form-control" onkeypress="return  restriccionNombre(event)"
                                            type="text" id="new-ap">
                                    </div>
                                    <div class="form-group">
                                        <label class="form-control-label">Apellido Materno <span
                                                class="tx-danger">*</span></label>
                                        <input class="form-control" onkeypress="return  restriccionNombre(event)"
                                            type="text" id="new-am">
                                    </div>
                                    <div class="form-group">
                                        <label class="form-control-label">Tipo de candidatura <span
                                                class="tx-danger">*</span></label>
                                        <div class="new-type" id="new-type"></div>
                                        <input type="text" class="d-none" value="" id="id-new-type">
                                    </div>
                                    <div class="form-group">
                                        <label class="form-control-label">Partido Político <span
                                                class="tx-danger">*</span></label>
                                        <div class="new-pp" id="new-pp"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-control-label">Distrito <span
                                                class="tx-danger">*</span></label>
                                        <div class="new-distrito" id="new-distrito"></div>
                                    </div>
                                    <div class="form-group prelacion-campo">
                                        <label class="form-control-label">Prelación <span
                                                class="tx-danger">*</span></label>
                                        <div id="new-prelacion"></div>
                                    </div>

                                    <div class="form-group">
                                        <label class="form-control-label">Fecha de nacimiento <span
                                                class="tx-danger">*</span></label>
                                        <input class="form-control" type="date" min="1950-01-01" max="2003-02-27"
                                            id="new-fecnac">
                                    </div>
                                    <div class="form-group">
                                        <label class="form-control-label">Género <span
                                                class="tx-danger">*</span></label>
                                        <select class="form-control" id="new-genero">
                                            <option value="">Selecciona una opción</option>
                                            <option value="MASCULINO">Masculino</option>
                                            <option value="FEMENINO">Femenino</option>
                                        </select>
                                    </div>
                                    <div class="form-check" style="display: none;" id="boxNew">
                                        <input class="form-check-input doc-checkbox" type="checkbox" id="checkNew">
                                        <label class="form-check-label form-control-label">
                                            ¿Desea recibir informacion acerca de la paridad de genero?
                                        </label>
                                    </div>

                                    <div class="form-group" id="CemailNew" style="display: none;">
                                        <label class="form-control-label" id="etiq">Correo Electrónico</label>
                                        <input class="form-control" type="email" id="IemailNew" name="email"
                                            placeholder="usuario@dominio.com" size="30">
                                    </div>
                                    <div class="form-group">
                                        <label class="form-control-label">Lugar de Nacimiento <span
                                                class="tx-danger">*</span></label>
                                        <select required class="form-control estados" id="sustitucion-sitenac"></select>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-control-label">Clave de Elector <span
                                                class="tx-danger">*</span></label>
                                        <input class="form-control" type="text" placeholder="ABCD123456FDCVGBHC"
                                            id="new-claveelector" maxlength="18" minlength="18"
                                            onkeypress="return  restriccion(event)">
                                    </div>


                                    <div class="form-group">
                                        <label class="form-control-label">Curp <span class="tx-danger">*</span></label>
                                        <input class="form-control" type="text" id="new-curp"
                                            onkeypress="return  restriccion(event)" maxlength="18" minlength="18"
                                            onkeypress="return  restriccion(event)">
                                    </div>




                                    <!--INICIO NUEVOS CAMPSO-->

                                    <div class="form-group">
                                        <label class="form-control-label">Número de emisión de la credencial para votar
                                            <span class="tx-danger">*</span></label>
                                        <input class="form-control" type="text" id="new-candidato_num_emision"
                                            maxlength="4" minlength="1" onkeypress="return  soloNumeros(event)">
                                    </div>
                                    <div class="form-group">
                                        <label class="form-control-label">OCR<span class="tx-danger">*</span></label>
                                        <input class="form-control" type="text" id="new-candidato_ocr" maxlength="13"
                                            minlength="1" onkeypress="return  soloNumeros(event)">
                                    </div>
                                    <div class="form-group">
                                        <label class="form-control-label">CIC (Código de Identificación de Credencial
                                            para Votar) <span class="tx-danger"></span></label>
                                        <input class="form-control" type="text" id="new-candidato_cic" maxlength="15"
                                            minlength="15">
                                    </div>
                                    <div class="form-group">
                                        <label class="form-control-label">Sección<span
                                                class="tx-danger">*</span></label>
                                        <input class="form-control" type="text" id="new-candidato_seccion" maxlength="4"
                                            minlength="1" onkeypress="return soloNumeros(event)">
                                    </div>
                                    <!--FIN DE LOS NUEVOS CAMPOS-->




                                    <div class="form-group">
                                        <label class="form-control-label">Tiempo de Residencia <span
                                                class="tx-danger">*</span></label>
                                        <div class="input-group-prepend">
                                            <input class="form-control" type="text" id="new-time"
                                                onkeypress="return  restriccionTime(event)" maxlength="2" minlength="1">
                                            <div class="input-group-text">AÑOS</div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="form-control-label">Sobrenombre</label>
                                        <input class="form-control" type="text" id="new-alias"
                                            onkeypress="return  restriccionNombre(event)">
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="split-form secondone">
                            <div class="marg-form">
                                <form id="docSustitucion" method="post">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="doc-snr-new">
                                        <label class="form-check-label form-control-label" for="doc-snr-new">
                                            Documento emitido por el SNR del INE.
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="doc-regcan-new">
                                        <label class="form-check-label form-control-label" for="doc-regcan-new">
                                            Solicitud de Registro.
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="doc-cred-new">
                                        <label class="form-check-label form-control-label" for="doc-cred-new">
                                            Credencial para votar.
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="doc-actnac-new">
                                        <label class="form-check-label form-control-label" for="doc-actnac-new">
                                            Copia certificada del Acta de Nacimiento.
                                        </label>
                                    </div>
                                    <!-- <div class="form-check">
                                        <label class="form-check-label form-control-label">Copia certificada del Acta de Nacimiento del padre o madre Tlaxcalteca</label>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="s-can1" id="s-can1" value="SI">
                                            <label class="form-check-label form-control-label" for="s-can1">Si</label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="s-can1" id="s-can2" value="NO">
                                            <label class="form-check-label form-control-label" for="s-can2">No</label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="s-can1" id="s-can3" value="NO APLICA" checked="checked">
                                            <label class="form-check-label form-control-label" for="s-can3">No aplica</label>
                                        </div>
                                    </div> -->
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="doc-radicacion-new">
                                        <label class="form-check-label form-control-label" for="doc-radicacion-new">
                                            Constancia de radicación.
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="doc-aceptacion-new">
                                        <label class="form-check-label form-control-label" for="doc-aceptacion-new">
                                            Constancia de aceptación de la postulación.
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <label class="form-check-label form-control-label">Constancia de separación del
                                            cargo o la función pública.</label>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="separacionCargonew"
                                                value="SI">
                                            <label class="form-check-label form-control-label"> Si</label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="separacionCargonew"
                                                value="NO">
                                            <label class="form-check-label form-control-label"> No</label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="separacionCargonew"
                                                value="NO APLICA" checked="checked">
                                            <label class="form-check-label form-control-label"> No aplica</label>
                                        </div>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="doc-inhabilitado-new">
                                        <label class="form-check-label form-control-label" for="doc-inhabilitado-new">
                                            Escrito bajo protesta de decir verdad, que no se encuentra inhabilitado para
                                            ocupar un cargo público y que no se cuenta con antecedentes penales.
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="doc-antpen-new">
                                        <label class="form-check-label form-control-label" for="doc-antpen-new">
                                            Constancia de no antecendentes penales.
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="doc-me-new">
                                        <label class="form-check-label form-control-label" for="doc-me-new">
                                            Manifestación de partido político.
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="doc-ce-new">
                                        <label class="form-check-label form-control-label" for="doc-ce-new">
                                            Informe de capacidad económica.
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="doc-cp-new">
                                        <label class="form-check-label form-control-label" for="doc-cp-new">
                                            Cédula de identificación fiscal.
                                        </label>
                                    </div>



                                    <!--INICIO NUEVOS CAMPOS DE ULTIMA HORA-->
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="doc-carta-3-new">
                                        <label class="form-check-label form-control-label" for="doc-carta-3-new">
                                            CARTA 3 DE 3
                                        </label>
                                    </div>

                                    <!-- <div class="form-check">
                                        <label class="form-check-label form-control-label">CARTA REELECCIÓN.</label>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="cartaEleccionnew"  value="SI">
                                            <label class="form-check-label form-control-label"> Si</label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="cartaEleccionnew"  value="NO">
                                            <label class="form-check-label form-control-label"> No</label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="cartaEleccionnew"  value="NO APLICA" checked="checked">
                                            <label class="form-check-label form-control-label"  > No aplica</label>
                                        </div>
                                    </div>

                                    <div class="form-check">
                                        <label class="form-check-label form-control-label">CONSTANCIA DE AUTORIZACIÓN DEL ÓRGANO PARTIDISTA EN CASO DE RELECCIÓN.</label>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="constAutOrganoPartidistanew"  value="SI">
                                            <label class="form-check-label form-control-label"> Si</label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="constAutOrganoPartidistanew"  value="NO">
                                            <label class="form-check-label form-control-label"> No</label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="constAutOrganoPartidistanew"  value="NO APLICA" checked="checked">
                                            <label class="form-check-label form-control-label"  > No aplica</label>
                                        </div>
                                    </div>
                                    <div class="form-check">
                                        <label class="form-check-label form-control-label">MANIFESTACIÓN DE AUTOADSCRIPCIÓN INDÍGENA.</label>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="manifestacionIndigenanew"  value="SI">
                                            <label class="form-check-label form-control-label"> Si</label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="manifestacionIndigenanew"  value="NO">
                                            <label class="form-check-label form-control-label"> No</label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="manifestacionIndigenanew"  value="NO APLICA" checked="checked">
                                            <label class="form-check-label form-control-label"  > No aplica</label>
                                        </div>
                                    </div>
                                    <div class="form-check">
                                        <label class="form-check-label form-control-label">CONSTANCIAS QUE ACREDITEN EL VÍNCULO COMUNITARIO.</label>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="consVinculoComuninew"  value="SI">
                                            <label class="form-check-label form-control-label"> Si</label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="consVinculoComuninew"  value="NO">
                                            <label class="form-check-label form-control-label"> No</label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="consVinculoComuninew"  value="NO APLICA" checked="checked">
                                            <label class="form-check-label form-control-label"  > No aplica</label>
                                        </div>
                                    </div> -->


                                    <!--FIN CAMPOS DE ULTIMA HORA-->
                                </form>
                            </div>
                        </div>
                        <div class="justify-content-center btn-formulario">
                            <button type="button" name="button" class="btn btn-secondary"
                                id="sustitucion-cancelar">Cancelar</button>
                            <button type="button" name="button" class="btn btn-primary"
                                id="sustitucion-finalizar">Finalizar y Guardar</button>
                        </div>
                    </div>
                </div>
            </div>
            <input type="text" class="d-none" id="id-tipo-sustitucion">
        </div>




        <div class="contenido-pagina cancelacion">
            <div class="envol-div">
                <div class="titulo-pagina">
                    <i class="icon fa fa-times-circle-o"></i>
                    <div>
                        <h4>Renuncia</h4>
                        <p>Coloque la clave de elector del propietario o suplente que va a renunciar a su candidatura.
                        </p>
                    </div>
                </div>
                <div class="form-group row justify-content-center form-sust">
                    <form class="row" method="post">
                        <label for="clave-elector-original" class="col-lg-2 col-form-label">Clave Elector</label>
                        <div class="col-lg-6">
                            <input type="text" class="form-control" placeholder="ABCD123456FDCVGBHC"
                                id="busqueda-renuncia" autocomplete="off" maxlength="18" minlength="18">
                        </div>
                        <button type="submit" class="btn btn-primary col-lg-2 btn-canc"><i class="fa fa-search"></i>
                            Buscar</button>
                    </form>
                </div>


                <!-- informacion del candidato -->
                <div class="infoc-cancelacion">
                    <div class="row no-gutters cand-exist">
                        <div class="col-md-2">
                            <div class="form-group">
                                <label class="form-control-label">Nombre(s)</label>
                                <div class="form-control-plaintext" id="sus-nombre-r"></div>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="form-group">
                                <label class="form-control-label">Apellido Paterno</label>
                                <div class="form-control-plaintext" id="sus-ap-r"></div>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="form-group">
                                <label class="form-control-label">Apellido Materno</label>
                                <div class="form-control-plaintext" id="sus-am-r"></div>
                            </div>
                        </div>
                        <div class="col-md-2 sus-candidatura-r">
                            <div class="form-group">
                                <label class="form-control-label">Tipo de Candidatura</label>
                                <div class="form-control-plaintext" id="sus-candidatura-r"></div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label class="form-control-label">CURP</label>
                                <div class="form-control-plaintext" id="sus-curp-r"></div>
                            </div>
                        </div>
                        <!-- Segunda fila -->
                        <div class="col-md-2">
                            <div class="form-group">
                                <label class="form-control-label">Tipo de Elección</label>
                                <div class="form-control-plaintext" id="sus-comunidad-r"></div>
                            </div>
                        </div>
                        <div class="col-md-4 sus-distrito-r">
                            <div class="form-group">
                                <label class="form-control-label">Distrito</label>
                                <div class="form-control-plaintext" id="sus-distrito-r"></div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label class="form-control-label">Partido Político</label>
                                <div class="form-control-plaintext" id="sus-pp-r"></div>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="form-group">
                                <label class="form-control-label">Género</label>
                                <div class="form-control-plaintext" id="sus-genero-r"></div>
                            </div>
                        </div>


                        <div class="col-md-4">
                            <div class="form-group">
                                <label class="form-control-label">Número de emisión de la credencial para votar</label>
                                <div class="form-control-plaintext" id="sus-num_emision-r"></div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label class="form-control-label">OCR</label>
                                <div class="form-control-plaintext" id="sus-ocr-r"></div>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="form-group">
                                <label class="form-control-label">CIC</label>
                                <div class="form-control-plaintext" id="sus-cic-r"></div>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="form-group">
                                <label class="form-control-label">SECCIÓN</label>
                                <div class="form-control-plaintext" id="sus-seccion-r"></div>
                            </div>
                        </div>


                    </div>
                    <!-- Fin del formulario  -->
                    <div class="form-group row justify-content-center form-sust">
                        <div class="col-sm-3">
                            <div class="form-group">
                                <label class="form-control-label">Fecha de Renuncia</label>
                                <div id="fechaRenuncia"></div>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="form-group">
                                <label class="form-control-label">Motivo de Renuncia</label>
                                <select class="form-control" id="motivoRenuncia">
                                    <option value="">Selecciona una opción</option>
                                    <option value="INAHBILITACION">Inhabilitación</option>
                                    <option value="INCAPACIDAD">Incapacidad</option>
                                    <option value="RENUNCIA">Renuncia</option>
                                    <option value="FALLECIMIENTO">Fallecimiento</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-sm-6 vertical-btn">
                            <button type="button" name="button" class="btn btn-secondary"
                                id="cancelar-renuncia">Deshacer</button>
                            <button type="button" name="button" class="btn btn-primary btn-rm eliminar-candidatura"
                                id="renunciar-candidatura">Cancelar Candidatura</button>
                        </div>
                    </div>
                    <input type="text" class="d-none" id="codigo-renuncia" value="">
                    <input type="text" class="d-none" id="id-reg-renuncia" value="">
                </div>
            </div>
        </div>

        <div class="contenido-pagina historial">
            <div class="envol-div row">
                <div class="col-lg-4">
                    <div class="card">
                        <div class="card-body">
                            <h2 class="card-title"><i class="fa fa-history"></i> Historial</h2>
                        </div>
                        <div class="card-body">
                            <form id="search-form-nule">
                                <div class="form-group">
                                    <label>Fecha de Captura </label>
                                    <input type="date" class="form-control" min="2018-03-01" max="2018-03-31"
                                        id="historial-date">
                                </div>
                                <div class="form-group">
                                    <label>Nombre de Usuario </label>
                                    <input type="text" class="form-control" id="historial-usuario">
                                </div>
                                <div class="form-group">
                                    <label>Estado</label>
                                    <select class="form-control" id="historial-estado">
                                        <option value="">Selecciona una opción</option>
                                        <option value="Registro">Registro</option>
                                        <option value="Subsanacion">Subsanación</option>
                                        <option value="Sustitucion">Sustitución</option>
                                        <option value="Renuncia">Renuncia</option>
                                    </select>
                                </div>
                            </form>
                        </div>
                        <div class="card-body">
                            <button type="button" class="btn btn-primary" id="busqueda-historial"><i
                                    class="fa fa-search"></i> Buscar</button>
                        </div>
                    </div>
                </div>
                <div class="tarjetas col-lg-8" id="tarjetas-historial">
                    <!-- tarjerta -->
                </div>
                <!-- tarjetas -->
            </div>
            <!-- envol-div historial -->
        </div>
        <!-- historial -->

        <div class="contenido-pagina usuarios">
            <div class="envol-div">
                <!-- cabecera: titulo de pagina -->
                <div class="d-flex">
                    <div class="col-8 titulo-pagina">
                        <i class=" icon fa fa-users d-inline-block"></i>
                        <div class="d-inline-block">
                            <h4>Usuarios</h4>
                            <p>Administre la información de los usuarios que pueden hacer captura.</p>
                        </div>
                    </div>

                    <div class="col-4 justify-content-end  d-flex flex-row align-items-center">
                        <div><button type="button" class=" btn btn-secondary btn-sm update-user"> <i
                                    class="fa fa-refresh" aria-hidden="true"></i> Actualizar</button></div>
                        <div class="ml-2"><button type="button" class="btn btn-primary btn-sm add-user"> <i
                                    class="fa fa-user-plus" aria-hidden="true"></i> Añadir Usuario</button></div>
                    </div>

                </div>
                <!-- siguiente la tabla -->
                <div class="table-responsive table-hover">
                    <table class="table enmedio">
                        <thead>
                            <tr>
                                <th>Nombre de usuario</th>
                                <th>Usuario</th>
                                <th>Contraseña</th>
                                <th>Estado</th>
                                <th>Permisos</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody id="tablaUsuarios">
                            <tr>
                                <td>nombre-usuario</td>
                                <td>nombre-completo</td>
                                <td>******</td>
                                <td> <span class="badge badge-success">Activo</span> </td>
                                <td>Supervisor</td>
                                <td> <button type="button" class="btn btn-primary btn-sm edit-user"> <i
                                            class="fa fa-pencil-square-o" aria-hidden="true"></i> Editar</button>
                                    <button type="button" class="btn btn-secondary btn-sm eliminar-usuario"> <i
                                            class="fa fa-times-circle" aria-hidden="true"></i> Eliminar</button>
                                    <!-- <button type="button" class="btn btn-dark btn-sm reset-user">Reset</button> -->
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <div class="contenido-pagina reportes ">
            <div class="envol-div">
                <!-- titulo de la pagina  -->
                <div class="titulo-pagina">
                    <i class="icon fa fa-print"></i>
                    <div>
                        <h4>Reportes</h4>
                        <p>Administre la información de las candidaturas.</p>
                    </div>
                </div>
                <!-- Parte de arriba  -->

                <div class="form-estilo row adduser-form">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label class="form-control-label">Tipo de Elección</label>
                            <select class="form-control" id="tipo_eleccion_repo">
                                <option value=''>Todos</option>"
                            </select>
                        </div>
                    </div>

                    <div class="col-md-4 d-none" id="slt_report_municipio">
                        <div class="form-group">

                            <label class="form-control-label" id="l_municipio_repo">Municipio <span
                                    class="tx-danger">*</span></label>
                            <select class="form-control" id="municipio_repo" disabled>
                                <option value='Todos'>Todos</option>
                            </select>

                        </div>
                    </div>

                    <div class="col-md-4" id="slt_report_distrito">
                        <div class="form-group">

                            <label class="form-control-label" id="l_distrito_repo">Distrito <span
                                    class="tx-danger">*</span></label>
                            <select class="form-control" id="distrito_repo" disabled>
                                <option value='Todos'>Todos</option>
                            </select>

                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label class="form-control-label">Partido Político / Coalición / Independiente </label>
                            <select required class="form-control" id="partido_repo" disabled>
                                <option value='Todos'>Todos</option>
                            </select>
                        </div>
                    </div>
                    <!-- Segunda fila -->
                    <div class="col-md-4">
                        <div class="form-group">
                            <label class="form-control-label">Tipo de Candidatura </label>
                            <select class="form-control" id="tipo_candidatura_repo">
                                <option value="Todos">Todos</option>
                                <option value="PROPIETARIO">Propietario</option>
                                <option value="SUPLENTE">Suplente</option>
                            </select>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="form-group">
                            <label class="form-control-label">Estado </label>
                            <select class="form-control" id="estado_repo">
                                <option value="Todos">Todos</option>
                                <option value="Completo">Completo</option>
                                <option value="Incompleto">Incompleto</option>
                                <option value="Sustitucion">Sustitución</option>
                                <option value="Renuncia">Renuncia</option>
                            </select>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="form-group">
                            <label class="form-control-label">Género</label>
                            <select class="form-control" id="genero_repo">
                                <option value="Todos">Todos</option>
                                <option value="MASCULINO">MASCULINO</option>
                                <option value="FEMENINO">FEMENINO</option>
                            </select>
                        </div>
                    </div>

                    <!-- termina fila extra -->
                </div>
                <div class="row align-items-center">
                    <div class="btn-reporte">
                        <button type="button" id="search_reportes" class="btn btn-primary btn-sm"><i
                                class="fa fa-search"></i> Consultar</button>
                        <!-- <button type="button" class="btn btn-secondary btn-sm" id="print_report"><i class="fa fa-print"></i> Imprimir</button> -->
                        <button type="button" class="btn btn-secondary btn-sm" id="print_diary"><i
                                class="fa fa-file-pdf-o "></i> Reporte diario</button>
                    </div>
                </div>
                <!-- Finaliza la parte de arriba -->
                <!-- siguiente la tabla -->

                <!-- termina la tabla-->
            </div>
            <div>
                <div class="" id="table_reportes" style="display: none;width: 1280px!important">
                    <div class="envol-div">
                        <table class="table table-responsive table-bordered enmedio table-hover" id="table_report"
                            style="width: 1132px!important;">
                            <thead>
                                <tr>
                                    <th>No</th>
                                    <th>Nombre</th>
                                    <th>Tipo de Elección</th>
                                    <th>Tipo de Candidatura</th>
                                    <th>Clave de Elector</th>
                                    <th>Número de emisión</th>
                                    <th>OCR</th>
                                    <th>CIC</th>
                                    <th>Sección</th>
                                    <th>Estado</th>
                                    <th>Distrito/Municipio</th>
                                    <th>Comunidad</th>
                                    <th>Partido Político</th>
                                    <th>Fecha de nacimiento</th>
                                    <th>Edad</th>
                                    <th>Género</th>
                                    <th>Fecha</th>

                                </tr>
                            </thead>
                            <tbody id="tablareportes">
                                <tr class="candidato-info">
                                    <td>ERROR</td>
                                    <td>ERROR</td>
                                    <td>ERROR</td>
                                    <td>ERROR</td>
                                    <td>ERROR</td>
                                    <td>ERROR</td>
                                    <td>ERROR</td>
                                    <td> <span class="badge badge-success">ERROR</span> </td>
                                    <td>ERROR</td>
                                    <td>ERROR</td>
                                    <td>ERROR</td>
                                    <td>ERROR</td>
                                    <td>ERROR</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <!-- modal - salida -->
    <div class="modal fade" id="modal-suspender" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title"> Suspender</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="form-group row">
                            <label for="staticEmail" class="col-sm-2 col-form-label">Motivo</label>
                            <div class="col-sm-10">
                                <select class="custom-select mr-sm-2" id="it">
                                    <option selected value="">Selecciona una opción</option>
                                    <option value="DESCANSO">Descanso</option>
                                    <option value="COMIDA">Comida</option>
                                    <option value="PROBLEMAS TECNICOS">Problemas Técnicos</option>
                                </select>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                    <button type="button" class="btn btn-primary exit-btn" id="suspenderSesion">Salir</button>
                </div>
            </div>
        </div>
    </div>





    <!-- modal - salida -->
    <div class="modal fade" id="dosclavesSubsanacion" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title titulo-modal"> Selecciona el registro </h5>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Tipo de Elección </label>
                            <div class="col-sm-8">
                                <select class="custom-select mr-sm-2" id="search-tipo-sub">
                                </select>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>


                    <button type="button" class="btn btn-primary exit-btn d-none"
                        id="subsanacionDosclaves">Buscar</button>
                    <button type="button" class="btn btn-primary exit-btn d-none" id="renunciaSlt">Buscar</button>
                    <button type="button" class="btn btn-primary exit-btn d-none"
                        id="seleccionar-dosclaves">Buscar</button>
                </div>
            </div>
        </div>
        <input type="text" disabled class="d-none" id="modal-subsanacion">
    </div>



    <!-- modal - salida -->
    <div class="modal fade" id="modalSustitucion" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title titulo-modal"> Selecciona el registro </h5>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Tipo de Elección </label>
                            <div class="col-sm-8">
                                <select class="custom-select mr-sm-2" id="eleccionSustitucion">
                                </select>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                    <button type="button" class="btn btn-primary exit-btn" id="btn-slt-sus">Buscar</button>
                </div>
            </div>
        </div>
        <input type="text" disabled class="d-none" id="id-reg-sus">
    </div>



    <!-- Modal date -->
    <div class="modal fade" id="modal-date" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title titulo-modal"> Selecciona el registro </h5>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label">Fecha de Reporte </label>
                            <div class="col-sm-8">
                                <input type="date" class="form-control" min="2018-03-16" max="2025-03-26"
                                    id="reporte-date">
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                    <button type="button" class="btn btn-primary exit-btn" id="seleccionar-date">Buscar</button>
                </div>
            </div>
        </div>
    </div>

    <!-- modal docs -->

    <div class="modal fade" id="modal-docs" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="docs-title"><i class="fa fa-file-o"></i> Documentación</h5>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="doc-snr-modal">
                            <label class="form-check-label" for="defaultCheck1">
                                Documento emitido por el SNR del INE.
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="doc-regcan-modal">
                            <label class="form-check-label" for="defaultCheck2">
                                Solicitud de Registro de Candidatura.
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="doc-cred-modal">
                            <label class="form-check-label" for="defaultCheck5">
                                Credencial para votar vigente.
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="doc-actnac-modal">
                            <label class="form-check-label" for="defaultCheck3">
                                Copia certificada del Acta de Nacimiento.
                            </label>
                        </div>
                        <!-- <div class="form-check">
                            <label class="form-check-label">Copia certificada del Acta de Nacimiento del padre o madre Tlaxcalteca</label> <br>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="actaSubsanacion"  value="SI">
                                <label class="form-check-label" >Si</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="actaSubsanacion"  value="NO">
                                <label class="form-check-label" >No</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="actaSubsanacion"  value="NO APLICA" checked="checked">
                                <label class="form-check-label" >No Aplica</label>
                            </div>
                        </div> -->
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="doc-radicacion-modal">
                            <label class="form-check-label" for="defaultCheck8">
                                Constancia de radicación.
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="doc-aceptacion-modal">
                            <label class="form-check-label" for="defaultCheck6">
                                Constancia de aceptación de la postulación.
                            </label>
                        </div>
                        <div class="form-check">
                            <label class="form-check-label">Constancia de Separación de cargo publico</label> <br>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="subsanacionSep" value="SI">
                                <label class="form-check-label">Si</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="subsanacionSep" value="NO">
                                <label class="form-check-label">No</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="subsanacionSep" value="NO APLICA"
                                    checked="checked">
                                <label class="form-check-label">No Aplica</label>
                            </div>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="doc-inhabilitado-modal">
                            <label class="form-check-label" for="defaultCheck10">
                                Escrito bajo protesta de decir la verdad de que no se encuentra inahbilitado para ocupar
                                un cargo público.
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="doc-antpen-modal">
                            <label class="form-check-label" for="defaultCheck9">
                                Carta de no antecedentes penales.
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="doc-me-modal">
                            <label class="form-check-label" for="defaultCheck11">
                                Manifestación de partido político.
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="doc-ce-modal">
                            <label class="form-check-label" for="defaultCheck11">
                                Informe de capacidad económica.
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="doc-rfc-modal">
                            <label class="form-check-label" for="defaultCheck11">
                                Cédula de identificación fiscal.
                            </label>
                        </div>


                        <!-- Nuevos campos de ultima hora-->
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="doc-carta-3-modal">
                            <label class="form-check-label" for="defaultCheck11">
                                CARTA 3 DE 3.
                            </label>
                        </div>


                        <!-- <div class="form-check">
                            <label class="form-check-label">CARTA REELECCIÓN</label> <br>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="cartaEleccion-modal"  value="SI">
                                <label class="form-check-label" >Si</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="cartaEleccion-modal"  value="NO">
                                <label class="form-check-label" >No</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="cartaEleccion-modal"  value="NO APLICA" checked="checked">
                                <label class="form-check-label" >No Aplica</label>
                            </div>
                        </div> -->

                        <!-- <div class="form-check">
                            <label class="form-check-label">CONSTANCIA DE AUTORIZACIÓN DEL ÓRGANO PARTIDISTA EN CASO DE RELECCIÓN</label> <br>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="constAutOrganoPartidista-modal"  value="SI">
                                <label class="form-check-label" >Si</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="constAutOrganoPartidista-modal"  value="NO">
                                <label class="form-check-label" >No</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="constAutOrganoPartidista-modal"  value="NO APLICA" checked="checked">
                                <label class="form-check-label" >No Aplica</label>
                            </div>
                        </div>
                        <div class="form-check">
                            <label class="form-check-label">MANIFESTACIÓN DE AUTOADSCRIPCIÓN INDÍGENA</label> <br>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="manifestacionIndigena-modal"  value="SI">
                                <label class="form-check-label" >Si</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="manifestacionIndigena-modal"  value="NO">
                                <label class="form-check-label" >No</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="manifestacionIndigena-modal"  value="NO APLICA" checked="checked">
                                <label class="form-check-label" >No Aplica</label>
                            </div>
                        </div>
                        
                        <div class="form-check">
                            <label class="form-check-label">CONSTANCIAS QUE ACREDITEN EL VÍNCULO COMUNITARIO</label> <br>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="consVinculoComuni-modal"  value="SI">
                                <label class="form-check-label" >Si</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="consVinculoComuni-modal"  value="NO">
                                <label class="form-check-label" >No</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="consVinculoComuni-modal"  value="NO APLICA" checked="checked">
                                <label class="form-check-label" >No Aplica</label>
                            </div>
                        </div> -->

                        <!-- FIN Nuevos campos de ultima hora-->

                    </form>
                </div>
                <div class="modal-footer btn-formulario">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                    <button type="button" class="btn btn-primary btn-update-modal">Finalizar</button>
                </div>
            </div>
        </div>
    </div>

    <div id="modal">
        <?php include("Templates/modalDocumentos.html"); ?>
    </div>

    <!-- Modal para mostrar documentacion -->
    <div class="modal fade" id="modalFaltantesSup" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title  text-center"><i class="fa fa-file"></i> Documentos Faltantes</h5>
                </div>
                <div class="modal-body">
                    <div class="listasFaltantes"></div>
                    <br>
                    <small class="text-center">Los aspirantes a candidaturas tendrán hasta 48 hrs para subsanar la
                        información y documentos faltantes. </small>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                    <button type="button" class="btn btn-primary" id="sureFinish"> Seguir</button>
                </div>
            </div>
        </div>
    </div>





    <!-- Modal para mostrar documentacion faltantes en  Sustitucion -->
    <div class="modal fade" id="modalFaltantesSus" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title  text-center"><i class="fa fa-file"></i> Documentos Faltantes</h5>
                </div>
                <div class="modal-body">
                    <div class="listasFaltantes"></div>
                    <br>
                    <small class="text-center">Los aspirantes a candidaturas tendrán hasta 48 hrs para subsanar la
                        información y documentos faltantes. </small>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                    <button type="button" class="btn btn-primary" id="finalizarSustitucion"> Seguir</button>
                </div>
            </div>
        </div>
    </div>







    <!-- Modal para editar/añadir usuario -->
    <div class="modal fade" id="modal-adminuser" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title modal-dialog-centered titulo-adminuser" id="modal-adminuser">Añadir / Usuario
                    </h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form method="post" id="add-user">
                        <div class="form-group">
                            <label class="form-control-label">Nombre(s) <span class="tx-danger">*</span></label>
                            <input type="text" class="form-control" id="user-name"
                                onkeypress="return  restriccionNombre(event)">
                        </div>
                        <div class="form-group">
                            <label class="form-control-label">Apellido Paterno <span class="tx-danger">*</span></label>
                            <input type="text" class="form-control" id="user-app"
                                onkeypress="return  restriccionNombre(event)">
                        </div>
                        <div class="form-group">
                            <label class="form-control-label">Apellido Materno <span class="tx-danger">*</span></label>
                            <input type="text" class="form-control" id="user-apm"
                                onkeypress="return  restriccionNombre(event)">
                        </div>
                        <div class="form-group">
                            <label class="form-control-label">Usuario <span class="tx-danger">*</span></label>
                            <input type="text" class="form-control" id="user-username"
                                onkeypress="return  restriccion(event)" maxlength="20">
                        </div>

                        <div class="form-group d-none fadeIn" id="cboContraseña">
                            <label for="cbxCampioPass" style="color:#868ba1;font-size: 16px;">Cambiar contraseña</label>
                            <input type="checkbox" id="cbxCampioPass">
                        </div>

                        <div class="form-group" id="passCambio">
                            <label class="form-control-label">Contraseña <span class="tx-danger">*</span></label>
                            <input type="text" class="form-control" id="user-password"
                                onkeypress="return  restriccion(event)" maxlength="20">
                        </div>
                        <div class="form-group">
                            <label class="form-control-label">Rol <span class="tx-danger">*</span></label>
                            <select class="form-control" id="user-rol">
                                <option value="">Selecciona una opción</option>
                                <option value="Administrador">Administrador</option>
                                <option value="Supervisor">Supervisor</option>
                                <option value="Subsanacion">Subsanación</option>
                                <option value="Capturista">Capturista</option>
                            </select>
                        </div>
                    </form>
                </div>
                <div class="modal-footer justify-content-center" id="btns-save">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                    <button type="button" class="btn btn-primary" id="btn_nuevoUsuario">Guardar Cambios</button>
                </div>
            </div>
        </div>
    </div>
    <!-- modal con informacion del usuario -->
    <div class="modal fade" id="modal-candidatura" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title"><i class="fa fa-user"></i> Candidatura </h5>
                </div>
                <div class="modal-body">
                    <div class="row cabecera-modal">
                        <div class="col-md-4">
                            <p>Capturista: </p> <label class="name-captura"> </label>
                        </div>

                        <div class="col-md-4">
                            <p>Última Acción: </p> <label class="type-captura"> </label>
                        </div>

                        <div class="col-md-4">
                            <p>Fecha subsanación: </p> <label class="date-sub"> </label>
                        </div>
                    </div>
                    <nav>
                        <div class="nav nav-tabs" id="nav-tab" role="tablist">
                            <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home"
                                role="tab" aria-controls="nav-home" aria-selected="true">Información</a>
                            <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile"
                                role="tab" aria-controls="nav-profile" aria-selected="false">Documentación</a>
                            <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-historial"
                                role="tab" aria-controls="nav-historial" aria-selected="false">Historial</a>
                        </div>
                    </nav>
                    <div class="tab-content" id="nav-tabContent">
                        <div class="tab-pane fade show active" id="nav-home" role="tabpanel"
                            aria-labelledby="nav-home-tab">
                            <div class="row no-gutters cand-exist">
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label class="form-control-label">Tipo de Elección</label>
                                        <label class="candidatura-consulta" id="cand_prop">PROPIETARIO</label>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label class="form-control-label">Nombre(s)</label>
                                        <label id="cand_nombre"></label>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label class="form-control-label">Apellido Paterno</label>
                                        <label id="cand_ap_paterno"></label>
                                    </div>
                                </div>
                                <div class="col-md-3 ">
                                    <div class="form-group">
                                        <label class="form-control-label">Apellido Materno</label>
                                        <label id="cand_ap_materno"></label>
                                    </div>
                                </div>
                                <!-- Segunda fila -->
                                <div class="col-md-4 cand_distrito">
                                    <div class="form-group">
                                        <label class="form-control-label">Distrito <span
                                                class="tx-danger">*</span></label>
                                        <label id="cand_distrito"></label>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label class="form-control-label">Partido Político</label>
                                        <label id="cand_partido_politico"></label>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label class="form-control-label">Estado</label>
                                        <label id="cand_estado"></label>
                                    </div>
                                </div>
                                <!-- Tercera fila -->
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label class="form-control-label">Curp</label>
                                        <label id="cand_curp"></label>
                                    </div>
                                </div>
                                <div class="col-md-4 tip_candidatura">
                                    <div class="form-group">
                                        <label class="form-control-label">Tipo Candidatura</label>
                                        <label id="tip_candidatura"></label>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label class="form-control-label">Clave Elector</label>
                                        <label id="cand_clave_elector"> </label>
                                    </div>
                                </div>
                            </div>
                            <!-- fin formulario del DIF -->
                        </div>
                        <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
                            <div class="form-check disabled">
                                <input class="form-check-input" type="checkbox" id="doc-1" value="option3" disabled>
                                <label class="form-check-label" for="doc-1">
                                    1.- Documento emitido por el SNR del INE.
                                </label>
                            </div>
                            <div class="form-check disabled">
                                <input class="form-check-input" type="checkbox" id="doc-2" value="option3" disabled>
                                <label class="form-check-label" for="doc-2">
                                    2.- Solicitud de registro.
                                </label>
                            </div>
                            <div class="form-check disabled">
                                <input class="form-check-input" type="checkbox" id="doc-5" value="option3" disabled>
                                <label class="form-check-label" for="doc-5">
                                    3.- Credencial para votar.
                                </label>
                            </div>
                            <div class="form-check disabled">
                                <input class="form-check-input" type="checkbox" id="doc-3" value="option3" disabled>
                                <label class="form-check-label" for="doc-3">
                                    4.- Copia certificada del acta de nacimiento.
                                </label>
                            </div>
                            <div class="form-check disabled">
                                <label class="form-check-label">5.- Copia certificada del Acta de Nacimiento del padre o
                                    madre Tlaxcalteca</label> <br>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="actaConsulta" value="SI"
                                        disabled="">
                                    <label class="form-check-label">Si</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="actaConsulta" value="NO"
                                        disabled="">
                                    <label class="form-check-label">No</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="actaConsulta" value="NO APLICA"
                                        disabled="">
                                    <label class="form-check-label">No Aplica</label>
                                </div>
                            </div>
                            <div class="form-check disabled">
                                <input class="form-check-input" type="checkbox" id="doc-6" value="option3" disabled>
                                <label class="form-check-label" for="doc-6">
                                    6.- Constancia de radicación.
                                </label>
                            </div>
                            <div class="form-check disabled">
                                <input class="form-check-input" type="checkbox" id="doc-4" value="option3" disabled>
                                <label class="form-check-label" for="doc-4">
                                    7.- Constancia de aceptación de la postulación.
                                </label>
                            </div>
                            <div class="form-check disabled">
                                <label class="form-check-label">8.- Constancia de Separación de cargo publico</label>
                                <br>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="consultaSep" value="SI"
                                        disabled="">
                                    <label class="form-check-label">Si</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="consultaSep" value="NO"
                                        disabled="">
                                    <label class="form-check-label">No</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="consultaSep" value="NO APLICA"
                                        disabled="">
                                    <label class="form-check-label">No Aplica</label>
                                </div>
                            </div>
                            <div class="form-check disabled">
                                <input class="form-check-input" type="checkbox" id="doc-8" value="option3" checked
                                    disabled>
                                <label class="form-check-label" for="doc-9">
                                    9.- Escrito bajo protesta de decir verdad que no se encuentra inhabilitado parqa
                                    ocupar un cargo público y que no se cuenta con antecedentes penales.
                                </label>
                            </div>
                            <div class="form-check disabled">
                                <input class="form-check-input" type="checkbox" id="doc-9" value="option3" checked
                                    disabled>
                                <label class="form-check-label" for="doc-9">
                                    10.- Carta de no antecedentes penales.
                                </label>
                            </div>
                            <div class="form-check disabled">
                                <input class="form-check-input" type="checkbox" id="doc-10" value="option3" checked
                                    disabled>
                                <label class="form-check-label" for="doc-8">
                                    11.- Manifestación de partido político.
                                </label>
                            </div>
                            <div class="form-check disabled">
                                <input class="form-check-input" type="checkbox" id="doc-11" value="option3" checked
                                    disabled>
                                <label class="form-check-label" for="doc-10">
                                    12.- Informe de capacidad económica.
                                </label>
                            </div>
                            <div class="form-check disabled">
                                <input class="form-check-input" type="checkbox" id="doc-12" value="option3" checked
                                    disabled>
                                <label class="form-check-label" for="doc-11">
                                    13.- Cédula de identificación fiscal.
                                </label>
                            </div>


                            <!-- INICIO DE CAMBIOS DE ULTIMA HORA-->

                            <div class="form-check disabled">
                                <input class="form-check-input" type="checkbox" id="doc-carta-3-info" value="option3"
                                    disabled>
                                <label class="form-check-label" for="doc-4">
                                    14.- CARTA 3 DE 3.
                                </label>
                            </div>
                            <div class="form-check disabled">
                                <label class="form-check-label">15.- CARTA REELECCIÓN</label> <br>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="cartaEleccion-info" value="SI"
                                        disabled="">
                                    <label class="form-check-label">Si</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="cartaEleccion-info" value="NO"
                                        disabled="">
                                    <label class="form-check-label">No</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="cartaEleccion-info"
                                        value="NO APLICA" disabled="">
                                    <label class="form-check-label">No Aplica</label>
                                </div>
                            </div>

                            <div class="form-check disabled">
                                <label class="form-check-label">16.- CONSTANCIA DE AUTORIZACIÓN DEL ÓRGANO PARTIDISTA EN
                                    CASO DE RELECCIÓN</label> <br>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="constAutOrganoPartidista-info"
                                        value="SI" disabled="">
                                    <label class="form-check-label">Si</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="constAutOrganoPartidista-info"
                                        value="NO" disabled="">
                                    <label class="form-check-label">No</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="constAutOrganoPartidista-info"
                                        value="NO APLICA" disabled="">
                                    <label class="form-check-label">No Aplica</label>
                                </div>
                            </div>

                            <div class="form-check disabled">
                                <label class="form-check-label">17.- MANIFESTACIÓN DE AUTOADSCRIPCIÓN INDÍGENA</label>
                                <br>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="manifestacionIndigena-info"
                                        value="SI" disabled="">
                                    <label class="form-check-label">Si</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="manifestacionIndigena-info"
                                        value="NO" disabled="">
                                    <label class="form-check-label">No</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="manifestacionIndigena-info"
                                        value="NO APLICA" disabled="">
                                    <label class="form-check-label">No Aplica</label>
                                </div>
                            </div>

                            <div class="form-check disabled">
                                <label class="form-check-label">18.- CONSTANCIAS QUE ACREDITEN EL VÍNCULO
                                    COMUNITARIO</label> <br>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="consVinculoComuni-info"
                                        value="SI" disabled="">
                                    <label class="form-check-label">Si</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="consVinculoComuni-info"
                                        value="NO" disabled="">
                                    <label class="form-check-label">No</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="consVinculoComuni-info"
                                        value="NO APLICA" disabled="">
                                    <label class="form-check-label">No Aplica</label>
                                </div>
                            </div>
                            <!--FIN DE CAMBIOS DE ULTIMA HORA-->

                            <!-- Termina formulario -->
                        </div>
                        <div class="tab-pane fade" id="nav-historial" role="tabpanel" aria-labelledby="nav-profile-tab">
                            <div class="actividad-box" id="actividad-box">
                                <div class='fecha-actividad'> <span>14-Marzo-2018</span> </div>
                                <div class="card-body">
                                    <div class="actividad-descripcion">
                                        <h5>Oscar Morales <span> 19:24 p.m.</span></h5>
                                        <h6 class="text-muted">Cancelación de candidatura. </h6>
                                    </div>
                                </div>
                                <!-- finish card body -->
                            </div>
                        </div>
                    </div>
                    <!-- nav tab -->
                </div>
                <div class="modal-footer foot-modal">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                    <a type="button" class="btn btn-primary" id="imprimir-reporte"><i class="fa fa-print"></i>
                        Re-imprimir Reportes</a>


                </div>
            </div>
        </div>
    </div>
    <!-- Termina el modal -->


    <script src="assets/js/jquery/jquery-3.5.1.js"> </script>
    <script type="text/javascript" src="assets/js/jquery/pdfmake.min.js"></script>
    <script type="text/javascript" src="assets/js/jquery/vfs_fonts.js"></script>
    <script type="text/javascript" src="assets/js/jquery/datatables.min.js"></script>


    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous">
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/node-uuid/1.4.7/uuid.min.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="assets/js/sweetalert/sweetalert.min.js"></script>
    <!-- -->
    <script>
    function restriccion(e) {

        key = e.keyCode || e.which;
        tecla = String.fromCharCode(key).toLowerCase();
        letras = " abcdefghijklmnopqrstuvwxyz0123456789";
        especiales = "8-37-39-46";

        tecla_especial = false
        for (var i in especiales) {
            if (key == especiales[i]) {
                tecla_especial = true;
                break;
            }
        }

        if (letras.indexOf(tecla) == -1 && !tecla_especial) {
            return false;
        }
    }

    function restriccionNombre(e) {
        key = e.keyCode || e.which;
        tecla = String.fromCharCode(key).toLowerCase();
        letras = " áéíóúabcdefghijklmnñopqrstuvwxyz.";
        especiales = "8-37-39-46";

        tecla_especial = false
        for (var i in especiales) {
            if (key == especiales[i]) {
                tecla_especial = true;
                break;
            }
        }

        if (letras.indexOf(tecla) == -1 && !tecla_especial) {
            return false;
        }
    }

    function restriccionTime(e) {
        letras = " 0123456789";
        especiales = "8-37-39-46";
        key = e.keyCode || e.which;
        tecla = String.fromCharCode(key).toLowerCase();

        let numero = e.srcElement.value;

        if (letras.indexOf(tecla)) {
            numero += tecla;
            if (numero > 70) {
                e.srcElement.value = 70;
            }
        }


        tecla_especial = false
        for (var i in especiales) {
            if (key == especiales[i]) {
                tecla_especial = true;
                break;
            }
        }

        if (letras.indexOf(tecla) == -1 && !tecla_especial) {
            return false;
        }

    }

    function checkLength(el) {
        if (el.value.length != 18) {
            swal("Error", "La clave de elector debe contener 18 dígitos", "error");
        }
    };
    </script>
    <!-- funcionamiento general -->
    <script src='assets/js/constantes.js'></script>
    <script src='assets/js/limpiadores.js'></script>
    <script src="assets/js/functions.js" type="text/javascript"></script>

    <script src="assets/js/signup.js" type="text/javascript"></script>
    <script src="assets/js/adminUsuarios.js" type="text/javascript"></script>
    <script src="assets/js/diputados.js" type="text/javascript"></script>
    <script src="assets/js/subsanacion/subsanacion.js" type="text/javascript"></script>
    <script src="assets/js/buscadorRegistro.js" type="text/javascript"></script>
    <script src="assets/js/renuncia/renuncia.js" type="text/javascript"></script>
    <script src="assets/js/sustitucion.js" type="text/javascript"></script>
    <script src="assets/js/registrar.js" type="text/javascript"></script>
    <script src="assets/js/gubernatura.js" type="text/javascript"></script>
    <script src="assets/js/municipal.js" type="text/javascript"></script>
    <script src="assets/js/comunidad.js" type="text/javascript"></script>
    <script src="assets/js/correoFemenino.js" type="text/javascript"></script>


    <!-- Reportes Miguel  -->
    <script src="assets/js/reportes/reportes.js " type="text/javascript "></script>
    <!-- Historial Criss -->
    <script src="assets/js/historial.js " type="text/javascript "></script>
</body>

</html>