// ver pass
function togglePasswordVisibility(inputId, toggleId) {
  var inputElement = document.getElementById(inputId);
  var toggleElement = document.getElementById(toggleId);

  if (inputElement.type === "password") {
    inputElement.type = "text";
    toggleElement.classList.remove("fa-eye-slash");
    toggleElement.classList.add("fa-eye");
  } else {
    inputElement.type = "password";
    toggleElement.classList.remove("fa-eye");
    toggleElement.classList.add("fa-eye-slash");
  }
}

// generar pass
function generatePassword(inputId) {
  var inputElement = document.getElementById(inputId);

  const caracteres =
    "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
  let contraseña = "";

  for (let i = 0; i < 8; i++) {
    const caracterAleatorio = caracteres.charAt(
      Math.floor(Math.random() * caracteres.length)
    );
    contraseña += caracterAleatorio;
  }

  inputElement.value = contraseña;
}

// copiar pass
function copyToClipboard(inputId) {
  var inputElement = document.getElementById(inputId);

  if (inputElement) {
    var textToCopy = inputElement.value.trim();

    textToCopy = textToCopy
      .replace(/(\r\n|\n|\r)/gm, " ")
      .replace(/\s+/g, " ")
      .trim();

    if (textToCopy.length > 0) {
      var tempElement = document.createElement("textarea");
      tempElement.value = textToCopy;
      document.body.appendChild(tempElement);
      tempElement.select();

      try {
        document.execCommand("copy");
        alert("Contenido copiado al portapapeles: " + textToCopy);
      } catch (error) {
        console.error("Error al copiar al portapapeles: " + error);
      } finally {
        document.body.removeChild(tempElement);
      }
    } else {
      alert("El contenido está vacío o solo contiene espacios en blanco.");
    }
  } else {
    alert("No se pudo encontrar el elemento con el ID " + inputId);
  }
}
