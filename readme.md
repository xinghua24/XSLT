# XSLT Basics
This project demonstrates how to transform XML file using XSLT.

Java code used to run Xslt transformation:
```java
package com.example.xslt;

import javax.xml.transform.Source;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;
import java.io.ByteArrayOutputStream;
import java.nio.file.Files;
import java.nio.file.Path;

public class XsltApplication {

    public void transformUsingXslt(String inputXmlFilePath, String xsltFilePath) {
        try {
            Source input = new StreamSource(Files.newInputStream(Path.of(inputXmlFilePath)));
            Source xslt = new StreamSource(Files.newInputStream(Path.of(xsltFilePath)));

            ByteArrayOutputStream bos = new ByteArrayOutputStream();

            TransformerFactory factory = new net.sf.saxon.TransformerFactoryImpl();
            Transformer transformer = factory.newTransformer(xslt);
            transformer.transform(input, new StreamResult(bos));

            System.out.println(bos);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        XsltApplication application = new XsltApplication();
        application.transformUsingXslt("sample-input.xml", "transform.xslt");
    }
}
```

Example [sample-input.xml file](input.xml) and [transform.xslt file](transform.xslt) are from https://www.w3schools.com/xml/xsl_examples.asp

transform.xslt transforms the file and output HTML file that contains CDs that are over $10.
```xml
                    <xsl:for-each select="catalog/cd">
                        <xsl:if test="price>10">
                            <tr>
                                <td><xsl:value-of select="title"/></td>
                                <td><xsl:value-of select="artist"/></td>
                                <td><xsl:value-of select="price"/></td>
                            </tr>
                        </xsl:if>
                    </xsl:for-each>
```

# For more on XSLT
* XPath Examples: https://www.w3schools.com/xml/xpath_examples.asp
* XPath Syntax Reference: https://www.saxonica.com/html/documentation12/expressions/index.html
* XSLT tutorial: https://www.w3schools.com/xml/xsl_intro.asp
* XSLT Elements Reference: https://www.saxonica.com/html/documentation12/xsl-elements/index.html
* XSLT Functions Reference: https://www.saxonica.com/html/documentation12/functions/index.html