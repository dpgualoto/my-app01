package com.distribuida.rest;

import com.distribuida.db.Book;
import com.distribuida.servicios.ServicioBook;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;


import java.util.List;
import java.util.concurrent.ExecutionException;

@ApplicationScoped
@Path("/books")
public class RestBook {
    @Inject
    private ServicioBook servicioBook;

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public List<Book> finAll() throws ExecutionException, InterruptedException {
        return servicioBook.findAll();
    }

    @GET
    @Path("/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Book finById(@PathParam("id") int id) throws ExecutionException, InterruptedException {
        return servicioBook.findById(id);
    }

    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    public Response crearAuthor(Book book) throws ExecutionException, InterruptedException {
        servicioBook.insertar(book);
        return Response.status(Response.Status.CREATED).build();
    }

    @DELETE
    @Path("/{id}")
    public Response borrarAuthor(@PathParam("id") int id) throws ExecutionException, InterruptedException {
        servicioBook.delete(id);
        return Response.status((Response.Status.OK)).build();
    }
    @PUT
    @Path("/{id}")
    @Consumes(MediaType.APPLICATION_JSON)
    public Response modificar(@PathParam("id") int id, Book book) throws ExecutionException, InterruptedException {
        servicioBook.modificar(id,book);
        return Response.status((Response.Status.OK)).build();
    }
}
