package com.mrd.framework.data;

import java.io.Serializable;

import com.mrd.framework.exception.service.NotYetImplementedException;
import com.mrd.framework.validation.EntityValidator;
import com.mrd.framework.validation.Validity;

/**
 * BaseService implementation for basic access to service
 * methods of crud operation on entity
 *
 *
 * @author: Y Kamesh Rao
 * @created: 3/25/12 10:41 PM
 * @company: &copy; 2012, Kaleidosoft Labs
 */
public abstract class BaseMongoServiceImpl<T extends Entity, ID extends Serializable> implements BaseService<T, ID> {
    protected BaseCrudRepository baseCrudRepository;
    protected Class<T> entityClass;

     public T insert(T object) throws Exception {
        return (T) baseCrudRepository.save(object);
    }


     public T update(T object) throws Exception {
        throw new NotYetImplementedException("Update not implemented in controller");
    }


     public void delete(T object) throws Exception {
        baseCrudRepository.delete(object);
    }


/*     public T findById(ID id) throws Exception {
        return (T) baseCrudRepository.findById(id);
    }*/


     public Validity validate(T object) {
        EntityValidator<T> entityValidator = new EntityValidator<T>();
        return entityValidator.validate(object, entityClass);
    }
}
