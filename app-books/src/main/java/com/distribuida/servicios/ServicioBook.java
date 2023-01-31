package com.distribuida.servicios;

import com.distribuida.db.Book;

import java.util.List;
import java.util.concurrent.ExecutionException;

public interface ServicioBook {
    List<Book> findAll() throws ExecutionException, InterruptedException;
    Book findById(int id) throws ExecutionException, InterruptedException;
    void insertar(Book book) throws ExecutionException, InterruptedException;
    void delete(int id) throws ExecutionException, InterruptedException;
    void modificar(int id, Book book) throws ExecutionException, InterruptedException;
}
