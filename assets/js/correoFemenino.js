$(document).ready(function() {
    //Validacion de Gobernador
    //Evalua input Genero
    $("#generoGob").click(function() {

        let elementCheck = $("#boxGob");
        let elementEmail = $("#email");

        let valor = $("#generoGob").val();

        if (valor == "FEMENINO") {

            elementCheck.show();

        } else {

            $("#checkGob").prop('checked', false);
            elementCheck.hide();
            $("#correoGob").val('');
            elementEmail.hide();
        }
    });

    //Evalua Checkbox
    $("#checkGob").on("click", function() {

        let elementEmail = $("#email");
        let elementCheck = $("#checkGob");

        if (elementCheck.is(':checked')) {

            elementEmail.show();
        } else {
            elementEmail.hide();
        }
    });

    //Validacion de Comunidad Propietario *******************************************************************************************
    //Evalua input Genero
    $("#reg-c-pro-gen").click(function() {

        let elementCheck = $("#boxComP");
        let elementEmail = $("#CemailComP");

        let valor = $("#reg-c-pro-gen").val();

        if (valor == "FEMENINO") {

            elementCheck.show();

        } else {

            $("#checkComP").prop('checked', false);
            elementCheck.hide();
            $("#IemailComP").val('');
            elementEmail.hide();
        }
       // console.log(valor);
    });

    //Evalua Checkbox
    $("#checkComP").on("click", function() {

        let elementEmail = $("#CemailComP");
        let elementCheck = $("#checkComP");

        if (elementCheck.is(':checked')) {

            elementEmail.css("display", "block");
            input.css("display", "block");
        } else {
            elementEmail.css("display", "none");
        }
    });

    //Validacion de Comunidad Suplente *******************************************************************************************
    //Evalua input Genero
    $("#reg-c-sup-gen").click(function() {

        let elementCheck = $("#boxComS");
        let elementEmail = $("#CemailComS");

        let valor = $("#reg-c-sup-gen").val();

        if (valor == "FEMENINO") {

            elementCheck.show();

        } else {

            $("#checkComP").prop('checked', false);
            elementCheck.hide();
            $("#IemailComuSup").val('');
            elementEmail.hide();
        }
       // console.log(valor);
    });

    $("#reg-c-sup-nombre").click(function() {

        let elementCheck = $("#boxComS");
        let elementEmail = $("#CemailComS");

        let valor = $("#reg-c-sup-gen").val();

        if (valor == "FEMENINO") {

            elementCheck.show();

        } else {

            $("#checkComP").prop('checked', false);
            elementCheck.hide();
            $("#IemailComuSup").val('');
            elementEmail.hide();
        }
      //  console.log(valor);
    });

    //Evalua Checkbox
    $("#checkComS").on("click", function() {

        let elementEmail = $("#CemailComS");
        let elementCheck = $("#checkComS");

        if (elementCheck.is(':checked')) {

            elementEmail.css("display", "block");
            input.css("display", "block");
        } else {
            elementEmail.css("display", "none");
        }
    });

    //Validacion de Ayuntamiento Propietario *******************************************************************************************
    //Evalua input Genero
    $("#reg-m-pro-gen").click(function() {

        let elementCheck = $("#boxAyuP");
        let elementEmail = $("#CemailAyuP");

        let valor = $("#reg-m-pro-gen").val();

        if (valor == "FEMENINO") {

            elementCheck.show();

        } else {

            $("#checkAyuP").prop('checked', false);
            elementCheck.hide();
            $("#IemailAyuP").val('');
            elementEmail.hide();
        }
      //  console.log(valor);
    });

    $("#reg-m-nombre").click(function() {

        let elementCheck = $("#boxAyuP");
        let elementEmail = $("#CemailAyuP");

        let valor = $("#reg-m-pro-gen").val();

        if (valor == "FEMENINO") {

            elementCheck.show();

        } else {

            $("#checkAyuP").prop('checked', false);
            elementCheck.hide();
            $("#IemailAyuP").val('');
            elementEmail.hide();
        }
       // console.log(valor);
    });

    //Evalua Checkbox
    $("#checkAyuP").on("click", function() {

        let elementEmail = $("#CemailAyuP");
        let elementCheck = $("#checkAyuP");
        let etiqueta = $("#eti");

        if (elementCheck.is(':checked')) {

            elementEmail.css("display", "block");
            input.css("display", "block");
        } else {
            elementEmail.css("display", "none");
        }
    });

    //Validacion de Ayuntamiento Suplente *******************************************************************************************
    //Evalua input Genero
    $("#reg-m-sup-gen").click(function() {

        let elementCheck = $("#boxAyuS");
        let elementEmail = $("#CemailAyuS");

        let valor = $("#reg-m-sup-gen").val();

        if (valor == "FEMENINO") {

            elementCheck.show();

        } else {

            $("#checkAyuS").prop('checked', false);
            elementCheck.hide();
            $("#CemailAyuS").val('');
            elementEmail.hide();
        }
      //  console.log(valor);
    });

    $("#reg-m-sup-nombre").click(function() {

        let elementCheck = $("#boxAyuS");
        let elementEmail = $("#CemailAyuS");

        let valor = $("#reg-m-sup-gen").val();

        if (valor == "FEMENINO") {

            elementCheck.show();

        } else {

            $("#checkAyuS").prop('checked', false);
            elementCheck.hide();
            $("#CemailAyuS").val('');
            elementEmail.hide();
        }
        //console.log(valor);
    });

    //Evalua Checkbox
    $("#checkAyuS").on("click", function() {

        let elementEmail = $("#CemailAyuS");
        let elementCheck = $("#checkAyuS");
        let input = $("#IemailAyuS");
     

        if (elementCheck.is(':checked')) {

            elementEmail.css("display", "block");
            input.css("display", "block");
        } else {
            elementEmail.css("display", "none");
        }
    });



    //Validacion de Diputado Propietario *******************************************************************************************
    //Evalua input Genero
    $("#reg-pro-genDip").click(function() {

        let elementCheck = $("#boxDipMP");
        let elementEmail = $("#CemailDipMP");

        let valor = $("#reg-pro-genDip").val();

        if (valor == "FEMENINO") {

            elementCheck.show();

        } else {

            $("#checkDipMA").prop('checked', false);
            elementCheck.hide();
            $("#IemailDipMA").val('');
            elementEmail.hide();
        }
       // console.log(valor);
    });

    $("#reg-pro-nombre").click(function() {

        let elementCheck = $("#boxDipMP");
        let elementEmail = $("#CemailDipMP");

        let valor = $("#reg-pro-genDip").val();

        if (valor == "FEMENINO") {

            elementCheck.show();

        } else {

            $("#checkDipMA").prop('checked', false);
            elementCheck.hide();
            $("#IemailDipMA").val('');
            elementEmail.hide();
        }
       // console.log(valor);
    });

    //Evalua Checkbox
    $("#checkDipMP").on("click", function() {

        let elementEmail = $("#CemailDipMP");
        let elementCheck = $("#checkDipMP");
        let etiqueta = $("#etiq");

        if (elementCheck.is(':checked')) {
            etiqueta.show();
            elementEmail.show();
        } else {
            elementEmail.hide();
        }
    });

    //Validacion de Diputado Suplente *******************************************************************************************
    //Evalua input Genero
    $("#reg-sup-gen").click(function() {

        let elementCheck = $("#boxDipMS");
        let elementEmail = $("#CemailDipMS");

        let valor = $("#reg-sup-gen").val();

        if (valor == "FEMENINO") {

            elementCheck.show();

        } else {

            $("#checkDipMS").prop('checked', false);
            elementCheck.hide();
            $("#CemailDipMS").val('');
            elementEmail.hide();
        }
       // console.log(valor);
    });

    $("#reg-sup-nombre").click(function() {

        let elementCheck = $("#boxDipMS");
        let elementEmail = $("#CemailDipMS");

        let valor = $("#reg-sup-gen").val();

        if (valor == "FEMENINO") {

            elementCheck.show();

        } else {

            $("#checkDipMS").prop('checked', false);
            elementCheck.hide();
            $("#CemailDipMS").val('');
            elementEmail.hide();
        }
       // console.log(valor);
    });

    //Evalua Checkbox
    $("#checkDipMS").on("click", function() {

        let elementEmail = $("#CemailDipMS");
        let elementCheck = $("#checkDipMS");

        if (elementCheck.is(':checked')) {

            elementEmail.show();
        } else {
            elementEmail.hide();
        }
    });

    //Validacion de SUSTITUCIONES *******************************************************************************************
    //Evalua input Genero
    $("#new-genero").click(function() {

        let elementCheck = $("#boxNew");
        let elementEmail = $("#CemailNew");

        let valor = $("#new-genero").val();

        if (valor == "FEMENINO") {

            elementCheck.show();

        } else {

            $("#checkNew").prop('checked', false);
            elementCheck.hide();
            $("#IemailNew").val('');
            elementEmail.hide();
        }
       // console.log(valor);
    });

    $("#new-nombre").click(function() {

        let elementCheck = $("#boxNew");
        let elementEmail = $("#CemailNew");

        let valor = $("#new-genero").val();

        if (valor == "FEMENINO") {

            elementCheck.show();

        } else {

            $("#checkNew").prop('checked', false);
            elementCheck.hide();
            $("#IemailNew").val('');
            elementEmail.hide();
        }
        //console.log(valor);
    });

    //Evalua Checkbox
    $("#checkNew").on("click", function() {

        let elementEmail = $("#CemailNew");
        let elementCheck = $("#checkNew");
        let etiqueta = $("#etiq");

        if (elementCheck.is(':checked')) {
            etiqueta.show();
            elementEmail.show();
        } else {
            elementEmail.hide();
        }
    });

});