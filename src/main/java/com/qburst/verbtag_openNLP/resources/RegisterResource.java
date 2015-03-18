package com.qburst.verbtag_openNLP.resources;

import com.qburst.verbtag_openNLP.POSVerb;
import com.qburst.verbtag_openNLP.Result;
import com.qburst.verbtag_openNLP.view.SearchView;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import java.io.IOException;

@Path("/")
@Produces(MediaType.TEXT_HTML)
public class RegisterResource {

    @GET
    public SearchView get() {
        return new SearchView(" ", " ");
    }

    @POST
    public SearchView post(@FormParam("field") String searchtext)
            throws IOException {

        Result result = POSVerb.POSTag(searchtext);
        return new SearchView(result.getVlist(), result.getRlist());
    }
}
