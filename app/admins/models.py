from django.db import models

class Asistencia(models.Model):
    codigo_qr = models.CharField(max_length=255)
    fecha = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.codigo_qr