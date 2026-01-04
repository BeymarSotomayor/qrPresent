const video = document.getElementById("video");
const result = document.getElementById("result");

async function startCamera() {
    try {
        const stream = await navigator.mediaDevices.getUserMedia({
            video: {
                facingMode: { ideal: "environment" } // cámara trasera
            },
            audio: false
        });

        video.srcObject = stream;
        result.textContent = "Cámara activa. Escanee el QR... \n © 2026 QR Present";

    } catch (error) {
        console.error(error);
        result.textContent = "Permiso de cámara denegado.";
        alert("Debe permitir el acceso a la cámara para usar el escáner.");
    }
}

startCamera();
