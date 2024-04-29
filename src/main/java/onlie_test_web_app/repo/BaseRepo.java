package onlie_test_web_app.repo;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;

import static onlie_test_web_app.config.DBConfig.entityManager;

public class BaseRepo<T, I> {

    public Class<T> persistenceClass;
    @SuppressWarnings("unchecked")
    public BaseRepo() {
        Type type = getClass().getGenericSuperclass();
        ParameterizedType paramType = (ParameterizedType) type;
        this.persistenceClass = (Class<T>) paramType.getActualTypeArguments()[0];
    }

    public List<T> findAll() {
        return entityManager.createQuery("from " + persistenceClass.getSimpleName(), persistenceClass).getResultList();
    }

    public void deleteById(I id) {
        begin();
        entityManager.remove(entityManager.find(persistenceClass, id));
        commit();
    }

    public T findById(I id) {
        return entityManager.find(persistenceClass, id);
    }

    public void save(T t) {
        begin();
        entityManager.persist(t);
        commit();
    }

    public void begin() {
        entityManager.getTransaction().begin();
    }

    public void commit() {
        entityManager.getTransaction().commit();
    }
}
