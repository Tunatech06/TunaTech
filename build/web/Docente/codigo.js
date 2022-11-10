const contenedorQR = document.getElementById("contenedorQR");
const formulario = document.getElementById("form");
const contDescargar = document.getElementById("btnDescargar");

const QR = new QRCode(contenedorQR);


formulario.addEventListener('submit', (e) => {
    e.preventDefault();
    QR.makeCode(formulario.link.value);
});

//formulario.addEventListener('submit', (e) => {

//});
/**
let download_link = document.createElement("a");

const QR = new QRCode(contenedorQR, {
    width: 255,
    height: 255,
    colorDark: "#1e212a",
    colorLight: "#ffffff",
    correctLevel: QRCode.CorrectLevel.H,
});

//Genera el QR al principio
QR.makeCode("Made by TruperMax");

download_link.setAttribute("download", "qrcode.png");
download_link.innerHTML = `<i class="fa-solid fa-cloud-arrow-down"></i>`;

contenedor.appendChild(download_link);

let qr_code_img = document.querySelector("img");
let qr_code_canvas = document.querySelector("canvas");

if (qr_code_img.getAttribute("src") == null) {
    setTimeout(() => {
        download_link.setAttribute("href", `${qr_code_canvas.toDataURL()}`);
    }, 300);
} else {
    setTimeout(() => {
        download_link.setAttribute(
                "href",
                `${qr_code_img.getAttribute("src")}`
                );
    }, 300);
}

formulario.addEventListener('keyup', (e) => {

    //Genera el QR
    e.preventDefault();
    QR.makeCode(formulario.link.value);

    //Boton de descarga
    if (qr_code_img.getAttribute("src") == null) {
        setTimeout(() => {
            download_link.setAttribute("href", `${qr_code_canvas.toDataURL()}`);
        }, 300);
    } else {
        setTimeout(() => {
            download_link.setAttribute(
                    "href",
                    `${qr_code_img.getAttribute("src")}`
                    );
        }, 300);
    }
});**/


