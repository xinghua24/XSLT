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
