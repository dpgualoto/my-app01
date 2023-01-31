package com.distribuida.config;

import io.helidon.config.Config;
import io.helidon.dbclient.DbClient;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.enterprise.inject.Produces;



@ApplicationScoped
public class BDconfig {


    @ApplicationScoped
    @Produces
    public DbClient dbClient(){
        Config config = Config.create();
        DbClient dbClient = DbClient.builder().config(config.get("db")).build();
        return dbClient;
    }
}
