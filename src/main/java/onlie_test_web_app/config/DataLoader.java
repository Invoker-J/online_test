package onlie_test_web_app.config;

import jakarta.persistence.Persistence;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;


import static onlie_test_web_app.config.DBConfig.entityManagerFactory;
import static onlie_test_web_app.config.DBConfig.entityManager;


@WebListener
public class DataLoader implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        entityManagerFactory = Persistence.createEntityManagerFactory("online_test");
        entityManager = entityManagerFactory.createEntityManager();
        ServletContextListener.super.contextInitialized(sce);
    }

}

