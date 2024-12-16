<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">    
    <xsl:template match="/">
        <html>
            <body>
                <h2>Список читачів та книг</h2>
                <table border="1" align="center">
                    <tr bgcolor="#4CAF50">
                        <th>Номер</th> 
                        <th>Ім'я</th>
                        <th>Прізвище</th>
                        <th>Книга</th>
                        <th>Автор</th>
                        <th>Дата повернення</th>
                    </tr>
                    
                    <xsl:for-each select="readers/reader">
                        <xsl:variable name="firstName" select="first_name"/>
                        <xsl:variable name="lastName" select="last_name"/>
                        <xsl:variable name="readerNumber" select="position()"/> 
                        
                        <xsl:choose>
                            <xsl:when test="books/book_info">
                                <xsl:for-each select="books/book_info">
                                    <xsl:sort select="@returned" data-type="text" order="ascending"/>
                                    
                                    <tr>
                                        <xsl:if test="position() mod 2 = 0">
                                            <xsl:attribute name="bgcolor">#f2f2f2</xsl:attribute>
                                        </xsl:if>
                                        <xsl:if test="position() mod 2 != 0">
                                            <xsl:attribute name="bgcolor">#eaf3fc</xsl:attribute>
                                        </xsl:if>
                                        
                                        <td><xsl:value-of select="$readerNumber"/></td> 
                                        <td><xsl:value-of select="$firstName"/></td>
                                        <td><xsl:value-of select="$lastName"/></td>
                                        <td><xsl:value-of select="book_title"/></td>
                                        <td><xsl:value-of select="book_author"/></td>
                                        <td>
                                            <xsl:if test="@returned">
                                                <xsl:value-of select="@returned"/>
                                            </xsl:if>
                                            <xsl:if test="not(@returned)">
                                                <span style="color: #e63946; font-style: italic;">Не повернено</span>
                                            </xsl:if>
                                        </td>
                                    </tr>
                                </xsl:for-each>
                            </xsl:when>
                            <xsl:otherwise>
                                <tr bgcolor="#ffd6d6">
                                    <td><xsl:value-of select="$readerNumber"/></td>
                                    <td><xsl:value-of select="$firstName"/></td>
                                    <td><xsl:value-of select="$lastName"/></td>
                                    <td colspan="4"><i>Немає книг</i></td>
                                </tr>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
