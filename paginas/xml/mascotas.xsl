<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Listado de mascotas</title>
                <meta charset="UTF-8"/>
                                <link rel="stylesheet" href="../CSS//styles.css" />
            </head>
            <body>
                <div id="menu">
                    <img src="../../imagenes/logo/logo.png" height="80px" width="80px" />
                    <a href="../../index.html">Inicio</a>
                    <a href="../adopta.html">Adopta</a>
                    <a href="../historias.html">Historias de exito</a>
                    <a href="#">Fichas de mascotas</a>
                </div>

                <h1>Listado de mascotas</h1>
                
                 
                <xsl:apply-templates select="mascotas/mascota"/>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="mascota">
        <div class="mascota">
            <div class="tarjeta-menu">
            <h2>
                <xsl:value-of select="nombre"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of select="@sexo"/>
                <xsl:text>)</xsl:text>
            </h2>
                <p><strong>ID:</strong> <xsl:value-of select="@id"/></p>
                <p><strong>Chip:</strong> <xsl:value-of select="chip"/></p>
                <p><strong>Fecha de nacimiento:</strong> <xsl:value-of select="fechaNacimiento"/></p>
                <p><strong>Pedigree:</strong> 
                    <xsl:choose>
                        <xsl:when test="pedigree='true'">Sí</xsl:when>
                        <xsl:otherwise>No</xsl:otherwise>
                    </xsl:choose>
                </p>
                <p>
                    <strong>Peso:</strong> 
                    <xsl:value-of select="peso"/>
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="peso/@unidad"/>
                </p>
                <p><strong>Color:</strong> <xsl:value-of select="color"/></p>
                <p><strong>Tipo de cabello:</strong> <xsl:value-of select="@tipoCabello"/></p>



            <xsl:if test="propietario">
                <div class="bloque">
                    <h3>Datos del propietario</h3>
                    <p><strong>Nombre:</strong> <xsl:value-of select="propietario/nombre_propietario"/></p>
                    <p><strong>Apellidos:</strong> <xsl:value-of select="propietario/apellido"/></p>
                    <p><strong>Calle:</strong> <xsl:value-of select="propietario/calle"/></p>
                    <p><strong>Email:</strong> <xsl:value-of select="propietario/email"/></p>
                    <p><strong>Teléfono:</strong> <xsl:value-of select="propietario/telefono"/></p>
                </div>
            </xsl:if>

            <xsl:if test="vacunacion/vacuna">
                <div class="bloque">
                    <h3>Vacunación</h3>
                    <table>
                        <tr>
                            <th>Nombre vacuna</th>
                            <th>Laboratorio</th>
                            <th>Fecha administración</th>
                            <th>Próxima administración</th>
                        </tr>
                        <xsl:for-each select="vacunacion/vacuna">
                            <tr>
                                <td><xsl:value-of select="nombre"/></td>
                                <td><xsl:value-of select="@laboratorio"/></td>
                                <td><xsl:value-of select="fechaAdministracion"/></td>
                                <td>
                                    <xsl:choose>
                                        <xsl:when test="proximaAdministracion">
                                            <xsl:value-of select="proximaAdministracion"/>
                                        </xsl:when>
                                        <xsl:otherwise>-</xsl:otherwise>
                                    </xsl:choose>
                                </td>
                            </tr>
                        </xsl:for-each>
                    </table>
                </div>
            </xsl:if>

            <xsl:if test="visitas/visita">
                <div class="bloque">
                    <h3>Visitas veterinarias</h3>
                    <table>
                        <tr>
                            <th>ID visita</th>
                            <th>Fecha</th>
                            <th>Motivo</th>
                            <th>Diagnóstico / Tratamiento</th>
                            <th>Alta</th>
                        </tr>
                        <xsl:for-each select="visitas/visita">
                            <tr>
                                <td><xsl:value-of select="@id"/></td>
                                <td><xsl:value-of select="fecha"/></td>
                                <td><xsl:value-of select="motivo"/></td>
                                <td><xsl:value-of select="diagnosticoTratamiento"/></td>
                                <td>
                                    <xsl:choose>
                                        <xsl:when test="alta='true'">Sí</xsl:when>
                                        <xsl:otherwise>No</xsl:otherwise>
                                    </xsl:choose>
                                </td>
                            </tr>
                        </xsl:for-each>
                    </table>
                </div>
            </xsl:if>
</div>
        </div>
    </xsl:template>

</xsl:stylesheet>
