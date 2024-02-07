

document.addEventListener('DOMContentLoaded', function () {
    document.getElementById('logout').addEventListener('click', function () {
        logout();
    });
});


function logout() {
    var confirmation = window.confirm('¿Estás seguro de que quieres cerrar sesión?');

    if (confirmation) {
        localStorage.setItem('sesionActiva', 'false');
        window.location.replace('Login.jsp');

    }
}
function validarFormulario() {
            var password = document.getElementById("password").value;
            var confirmPassword = document.getElementById("confirmPassword").value;

            // Verificar si las contraseñas coinciden
            if (password !== confirmPassword) {
                alert("Las contraseñas no coinciden. Por favor, inténtalo de nuevo.");
                return false; // Detener el envío del formulario
            }

            // Continuar con el envío del formulario si las contraseñas coinciden
            
            return true;
             
        }
function confirmDelete() {
    var confirmation = window.confirm('¿Estás seguro de que quieres eliminar este Usuario?');

    if (confirmation) {
     return true;   
    }
    return false;
}   
 


