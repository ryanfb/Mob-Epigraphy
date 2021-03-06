<?xml version="1.0" encoding="UTF-8"?>
<!-- $Id: start-edition.xsl 1510 2008-08-14 15:27:51Z zau $ -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:t="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml"
   exclude-result-prefixes="t" version="1.0">
   <xsl:output method="xml" encoding="UTF-8"/>

   <xsl:include href="global-varsandparams.xsl"/>

   <!-- html related stylesheets, these may import tei{element} stylesheets if relevant eg. htm-teigap and teigap -->
   <xsl:include href="htm-teiab.xsl"/>
   <xsl:include href="htm-teiapp.xsl"/>
   <xsl:include href="htm-teidiv.xsl"/>
   <xsl:include href="htm-teidivedition.xsl"/>
   <xsl:include href="htm-teiforeign.xsl"/>
   <xsl:include href="htm-teifigure.xsl"/>
   <xsl:include href="htm-teig.xsl"/>
   <xsl:include href="htm-teigap.xsl"/>
   <xsl:include href="htm-teihead.xsl"/>
   <xsl:include href="htm-teihi.xsl"/>
   <xsl:include href="htm-teilb.xsl"/>
   <xsl:include href="htm-teilgandl.xsl"/>
   <xsl:include href="htm-teilistanditem.xsl"/>
   <xsl:include href="htm-teilistbiblandbibl.xsl"/>
   <xsl:include href="htm-teimilestone.xsl"/>
   <xsl:include href="htm-teinote.xsl"/>
   <xsl:include href="htm-teinum.xsl"/>
   <xsl:include href="htm-teip.xsl"/>
   <xsl:include href="htm-teiseg.xsl"/>
   <xsl:include href="htm-teispace.xsl"/>
   <xsl:include href="htm-teisupplied.xsl"/>
   <xsl:include href="htm-teiterm.xsl"/>
   <xsl:include href="htm-teiref.xsl"/>

   <!-- tei stylesheets that are also used by start-txt -->
   <xsl:include href="teiabbrandexpan.xsl"/>
   <xsl:include href="teiaddanddel.xsl"/>
   <xsl:include href="teicertainty.xsl"/>
   <xsl:include href="teichoice.xsl"/>
   <xsl:include href="teihandshift.xsl"/>
   <xsl:include href="teiheader.xsl"/>
   <xsl:include href="teimilestone.xsl"/>
   <xsl:include href="teiorig.xsl"/>
   <xsl:include href="teiq.xsl"/>
   <xsl:include href="teisicandcorr.xsl"/>
   <xsl:include href="teispace.xsl"/>
   <xsl:include href="teisupplied.xsl"/>
   <xsl:include href="teiunclear.xsl"/>

   <!-- html related stylesheets for named templates -->
   <xsl:include href="htm-tpl-cssandscripts.xsl"/>
   <xsl:include href="htm-tpl-apparatus.xsl"/>
   <xsl:include href="htm-tpl-lang.xsl"/>
   <xsl:include href="htm-tpl-metadata.xsl"/>
   <xsl:include href="htm-tpl-nav.xsl"/>
   <xsl:include href="htm-tpl-license.xsl"/>

   <!-- global named templates with no html, also used by start-txt -->
   <xsl:include href="tpl-reasonlost.xsl"/>
   <xsl:include href="tpl-certlow.xsl"/>
   <xsl:include href="tpl-text.xsl"/>


    <xsl:output encoding="UTF-8" method="xml"  doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"  doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" indent="no"/>
    
   <!-- HTML FILE -->
   <xsl:template match="/">
      <html>
         <head>
            <title>
               <xsl:choose>
                  <xsl:when test="$leiden-style = 'ddbdp'">
                     <xsl:choose>
                        <xsl:when test="//t:sourceDesc//t:bibl/text()">
                           <xsl:value-of select="//t:sourceDesc//t:bibl"/>
                        </xsl:when>
                        <xsl:otherwise>
                           <xsl:value-of select="//t:idno[@type='filename']"/>
                        </xsl:otherwise>
                     </xsl:choose>
                     <xsl:text> Greek Leiden Edition View</xsl:text>
                  </xsl:when>
                  <xsl:when test="//t:titleStmt/t:title/text()">
                     <xsl:if test="//t:idno[@type='filename']/text()">
                        <xsl:value-of select="//t:idno[@type='filename']"/>
                        <xsl:text>. </xsl:text>
                     </xsl:if>
                     <xsl:value-of select="//t:titleStmt/t:title"/>
                  </xsl:when>
                  <xsl:otherwise>
                     <xsl:text>EpiDoc Leiden View</xsl:text>
                  </xsl:otherwise>
               </xsl:choose>
            </title>
            <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
            <!-- Found in htm-tpl-cssandscripts.xsl -->
            <xsl:call-template name="css-script"/>
         </head>
         <body>

            <!-- Found in htm-tpl-nav.xsl -->
            <xsl:call-template name="topNavigation"/>


            <!-- Heading for a ddb or mob style file -->
             
            <xsl:choose>
                <xsl:when test="$leiden-style = 'ddbdp'">
               <h1>
                  <xsl:choose>
                     <xsl:when test="//t:sourceDesc//t:bibl/text()">
                        <xsl:value-of select="//t:sourceDesc//t:bibl"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:value-of select="//t:idno[@type='filename']"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </h1>
                </xsl:when>
                <xsl:when test="$meta-style = 'mob'">
                    
                    <h1><xsl:value-of select="//t:titleStmt/t:title"/></h1>
                    <p class="note">See <a href="http://horothesia.blogspot.com/search/label/mob-epigraphy">http://horothesia.blogspot.com/search/label/mob-epigraphy</a> for background on this project.</p>
                    <p>Edited by:</p> <ul><xsl:for-each select="//t:titleStmt/t:editor"><xsl:element name="li"><xsl:if test="@xml:id"><xsl:attribute name="id"><xsl:value-of select="@xml:id"/></xsl:attribute></xsl:if><xsl:value-of select="."/></xsl:element></xsl:for-each></ul>
                    
                    <p>Provenance:</p>
                    <ul><xsl:for-each select="//t:msDesc/t:history/t:provenance//t:event">
                        <li><xsl:for-each select="t:p"><xsl:value-of select="normalize-space(.)"/><br /></xsl:for-each></li>
                    </xsl:for-each></ul>
                </xsl:when>
            </xsl:choose>


            <!-- Found in htm-tpl-metadata.xsl -->

            <!-- could substitute //publicationsStmt/idno[@type='filename'] for //TEI.2/@id
               but it's commented out. -->
            <!-- Would need to change once combined 
        <xsl:if test="starts-with(//TEI.2/@id, 'hgv')">
          <xsl:call-template name="metadata"/>
        </xsl:if>-->


            <!-- Main text output -->
            <xsl:apply-templates/>

            <xsl:call-template name="license"/>

         </body>
      </html>
   </xsl:template>



</xsl:stylesheet>
