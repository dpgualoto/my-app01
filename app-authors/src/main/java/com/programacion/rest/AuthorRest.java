package com.programacion.rest;

import com.programacion.db.Author;
import com.programacion.servicios.AuthorServiceImpl;

import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;
import javax.transaction.Transactional;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.util.List;

@ApplicationScoped
@Path("/authors")
public class AuthorRest {
    @Inject
    private AuthorServiceImpl authorImpl;

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public List<Author> finAll(){
        return authorImpl.listAll();
    }

    @GET
    @Path("/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Author finById(@PathParam("id") long id){
        return authorImpl.findById(id);
    }

    @POST
    @Transactional
    @Consumes(MediaType.APPLICATION_JSON)
    public Response createdAuthor(Author author) {
        authorImpl.persist(author);
        return Response.status(Response.Status.CREATED).build();
    }

    @DELETE
    @Transactional
    @Path("/{id}")
    public Response deletedAuthor(@PathParam("id") long id) {
        authorImpl.deleteById(id);
        return Response.status((Response.Status.OK)).build();
    }
    @PUT
    @Transactional
    @Path("/{id}")
    @Consumes(MediaType.APPLICATION_JSON)
    public Response updateAuthor(@PathParam("id") long id, Author author) {
        Author entity = authorImpl.findById(id);
        entity.setLast_name(author.getLast_name());
        entity.setFirst_name(author.getFirst_name());
        return Response.status((Response.Status.OK)).build();
    }

}
