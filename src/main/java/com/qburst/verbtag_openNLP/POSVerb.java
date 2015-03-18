package com.qburst.verbtag_openNLP;

import opennlp.tools.cmdline.postag.POSModelLoader;
import opennlp.tools.postag.POSModel;
import opennlp.tools.postag.POSSample;
import opennlp.tools.postag.POSTaggerME;
import opennlp.tools.tokenize.WhitespaceTokenizer;
import opennlp.tools.util.InvalidFormatException;
import opennlp.tools.util.ObjectStream;
import opennlp.tools.util.PlainTextByLineStream;

import java.io.File;
import java.io.IOException;
import java.io.StringReader;
import java.util.ArrayList;
import java.util.Collections;

public class POSVerb {

    public static Result POSTag(String sample) throws IOException {
        String value;
        String line;
        String fileName = "en-pos-maxent.bin";

        ArrayList<String> vlist = new ArrayList<String>();
        ArrayList<String> slist = new ArrayList<String>();
        POSModel model = new POSModelLoader()
                .load(new File(fileName));
        POSTaggerME tagger = new POSTaggerME(model);

        ObjectStream<String> lineStream = new PlainTextByLineStream(
                new StringReader(sample));
        while ((line = lineStream.read()) != null) {

            String tokenizedSample[] = WhitespaceTokenizer.INSTANCE
                    .tokenize(line);
            String[] tags = tagger.tag(tokenizedSample);

            POSSample output = new POSSample(tokenizedSample, tags);
            String outputLine[] = WhitespaceTokenizer.INSTANCE.tokenize(output
                    .toString());

            for (String out : outputLine) {
                String[] split = out.split("_");
                if (split[1].equals("VBP") || split[1].equals("VBZ")
                        || split[1].equals("VB") || split[1].equals("VBN")
                        || split[1].equals("VBD") || split[1].equals("VBG")) {

                    vlist.add(split[0]);
                }
            }

            Collections.addAll(slist, tokenizedSample);
        }

        String verbs = vlist.toString();

        if (!vlist.isEmpty()) {
            value = checkStream(slist, vlist).toString();
        } else {
            value = "No verbs in the given sentance";
            verbs = value;
        }
        System.out.println("The verbs are : " + value);


        return new Result(verbs, value);
    }

    private static ArrayList<String> checkStream(ArrayList<String> slist,
                                                 ArrayList<String> vlist) throws InvalidFormatException, IOException {

        ArrayList<String> verbs = new ArrayList<String>();

        int slen = slist.size();
        int vlen = vlist.size();

        int k = 0;
        int g = 0;
        int m = 0;
        int pos = 0;
        for (int i = 0; i < slen; i++) {
            if (vlist.contains(slist.get(i))) {
                if (k == 0) {
                    k = 1;
                    pos = i;
                }
                m++;
                if (i == slen - 1) {
                    if (vlist.get(vlen - 1).equals(slist.get(slen - 1))) {
                        verbs.add(vlist.get(vlen - 1));
                    }
                }
            } else {
                if (m > 0) {
                    verbs.add(g, "");
                    for (int j = 0; j < m; j++) {
                        verbs.set(g, verbs.get(g).concat(slist.get(pos))
                                .concat(" "));
                        pos++;
                    }
                    g++;
                }
                k = 0;
                m = 0;
            }
        }
        System.out.println("verbs:" + verbs);
        System.out.println("vlist:" + vlist);
        System.out.println("slist:" + slist);

        if (vlist.equals(slist)) {
            return vlist;
        }

        return verbs;
    }
}
