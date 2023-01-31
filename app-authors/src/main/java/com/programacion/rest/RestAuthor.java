package com.programacion.rest;

import com.programacion.db.Author;
import com.programacion.servicios.AuthorRepository;

import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;
import javax.transaction.Transactional;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.util.List;

@ApplicationScoped
@Path("/authors")
public class RestAuthor {
    @Inject
    private AuthorRepository servicioAuthor;

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public List<Author> finAll(){
        return servicioAuthor.listAll();
    }

    @GET
    @Path("/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Author finById(@PathParam("id") long id){
        return servicioAuthor.findById(id);
    }

    @POST
    @Transactional
    @Consumes(MediaType.APPLICATION_JSON)
    public Response crearAuthor(Author author) {
        servicioAuthor.persist(author);
        return Response.status(Response.Status.CREATED).build();
    }

    @DELETE
    @Transactional
    @Path("/{id}")
    public Response borrarAuthor(@PathParam("id") long id) {
        servicioAuthor.deleteById(id);
        return Response.status((Response.Status.OK)).build();
    }
    @PUT
    @Transactional
    @Path("/{id}")
    @Consumes(MediaType.APPLICATION_JSON)
    public Response modificar( @PathParam("id") long id,Author author) {
        Author author1 = servicioAuthor.findById(id);
        author1.setLast_name(author.getLast_name());
        author1.setFirst_name(author.getFirst_name());
        return Response.status((Response.Status.OK)).build();
    }

}
