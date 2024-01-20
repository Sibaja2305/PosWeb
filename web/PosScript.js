

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


