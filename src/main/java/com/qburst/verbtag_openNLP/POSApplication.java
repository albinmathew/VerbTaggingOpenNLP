package com.qburst.verbtag_openNLP;

import com.qburst.verbtag_openNLP.resources.RegisterResource;
import io.dropwizard.Application;
import io.dropwizard.Configuration;
import io.dropwizard.assets.AssetsBundle;
import io.dropwizard.setup.Bootstrap;
import io.dropwizard.setup.Environment;
import io.dropwizard.views.ViewBundle;

public class POSApplication extends Application<Configuration> {

    ViewBundle view = new ViewBundle();
    AssetsBundle assetbundle = new AssetsBundle(
            "/com/qburst/verbtag_openNLP/view/", "/assets/");

    public static void main(String[] args) throws Exception {
        new POSApplication().run(args);

    }

    @Override
    public void initialize(Bootstrap<Configuration> bootstrap) {
        bootstrap.addBundle(view);
        bootstrap.addBundle(assetbundle);

    }

    @Override
    public void run(Configuration configuration, Environment environment)
            throws Exception {
        environment.jersey().register(new RegisterResource());

    }

}
