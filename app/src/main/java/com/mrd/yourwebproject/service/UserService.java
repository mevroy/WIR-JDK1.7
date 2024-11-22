package com.mrd.yourwebproject.service;

import com.mrd.framework.data.BaseService;
import com.mrd.framework.exception.database.NotFoundException;
import com.mrd.yourwebproject.model.entity.User;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

/**
 * Service class to have business logic operation on User entity
 *
 * @author: Y Kamesh Rao
 * @created: 3/24/12 3:51 PM
 * @company: &copy; 2012, Kaleidosoft Labs
 */
public interface UserService extends BaseService<User, Long> {

    /**
     * Register a new user into the system
     *
     * @param user
     * @param request
     *
     * @return
     */
    public User registerUser(User user, HttpServletRequest request);


    /**
     * Login a new user into the system
     *
     * @param user
     * @param request
     *
     * @return
     */
    public User loginUser(User user, HttpServletRequest request);

    /**
     * Method to validate whether the given password
     * is same as users password stored in the system
     *
     * @param user
     * @param pass
     *
     * @return
     */
    public boolean isValidPass(User user, String pass);


    /**
     * Validates whether the given username already
     * exists in the system.
     *
     * @param username
     *
     * @return
     */
    public boolean isUsernameExists(String username);


    /**
     * Validates whether the given email already
     * exists in the system.
     *
     * @param email
     *
     * @return
     */
    public boolean isEmailExists(String email);


    /**
     * Validates whether the given serialNumber already
     * exists in the system as registered user.
     *
     * @param email
     *
     * @return
     */
    public boolean isUserRegistrationEntryExists(String serialNumber);

    /**
     * Validates whether the given serialNumber already
     * exists in the system as valid groupMember.
     *
     * @param email
     *
     * @return
     */
    public boolean isValidEmployee(String serialNumber);


    /**
     * Finds a user entity by the given username
     *
     * @param username
     * @return
     */
    public User findByUsername(String username) throws NotFoundException;
    
    public List<User> findUsersByGroupCode(String groupCode, boolean enableFilter);
    
    public User findByUsernameAndGroupCode(String username, String groupCode,boolean enableFilter) throws NotFoundException;
}
