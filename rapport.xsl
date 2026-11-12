<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" encoding="UTF-8" indent="yes"/>

    <xsl:template match="/rapport">
        <html>
            <head>
                <meta charset="UTF-8"/>
                <title>Rapport des mandats</title>
                <style>
                    body   { font-family: Arial, sans-serif; margin: 20px; }
                    table  { border-collapse: collapse; width: 100%; }
                    th, td { border: 1px solid #444; padding: 6px 10px; text-align: left; }
                    th     { background-color: #2c5282; color: white; }
                    tr:nth-child(even) { background-color: #f2f2f2; }
                    .recu     { color: green; font-weight: bold; }
                    .nonrecu  { color: red;   font-weight: bold; }
                </style>
            </head>
            <body>
                <h1>Rapport des mandats</h1>
                <table>
                    <tr>
                        <th rowspan="2">N° mandat</th>
                        <th rowspan="2">Date</th>
                        <th rowspan="2">Montant (DH)</th>
                        <th rowspan="2">État</th>
                        <th colspan="4">Expéditeur</th>
                        <th colspan="4">Destinataire</th>
                    </tr>
                    <tr>
                        <th>CIN</th><th>Nom</th><th>Prénom</th><th>Ville</th>
                        <th>CIN</th><th>Nom</th><th>Prénom</th><th>Ville</th>
                    </tr>
                    <xsl:apply-templates select="mandat"/>
                </table>
                <p>
                    Nombre de mandats : <xsl:value-of select="count(mandat)"/> —
                    Montant total : <xsl:value-of select="sum(mandat/@montant)"/> DH
                </p>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="mandat">
        <tr>
            <td><xsl:value-of select="@num"/></td>
            <td><xsl:value-of select="@date"/></td>
            <td><xsl:value-of select="@montant"/></td>
            <td>
                <xsl:attribute name="class">
                    <xsl:choose>
                        <xsl:when test="@etat='reçu'">recu</xsl:when>
                        <xsl:otherwise>nonrecu</xsl:otherwise>
                    </xsl:choose>
                </xsl:attribute>
                <xsl:value-of select="@etat"/>
            </td>
            <td><xsl:value-of select="expediteur/@cin"/></td>
            <td><xsl:value-of select="expediteur/@nom"/></td>
            <td><xsl:value-of select="expediteur/@prenom"/></td>
            <td><xsl:value-of select="expediteur/@ville"/></td>
            <td><xsl:value-of select="destinataire/@cin"/></td>
            <td><xsl:value-of select="destinataire/@nom"/></td>
            <td><xsl:value-of select="destinataire/@prenom"/></td>
            <td><xsl:value-of select="destinataire/@ville"/></td>
        </tr>
    </xsl:template>

</xsl:stylesheet>
