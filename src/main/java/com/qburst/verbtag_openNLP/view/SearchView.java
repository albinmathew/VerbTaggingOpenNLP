package com.qburst.verbtag_openNLP.view;

import io.dropwizard.views.View;

public class SearchView extends View {

    String results = "";
    String verbs = "";

    public SearchView(String text1, String text2) {
        super("search.ftl");
        this.results = text1;
        this.verbs = text2;
    }

    public String getVerbs() {
        return verbs;
    }

    public void setVerbs(String verbs) {
        this.verbs = verbs;
    }

    public String getResults() {
        return results;
    }

    public void setResults(String results) {
        this.results = results;
    }
}
