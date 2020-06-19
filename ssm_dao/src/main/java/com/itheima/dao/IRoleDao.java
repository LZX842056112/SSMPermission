package com.itheima.dao;

import com.itheima.domain.Role;

import java.util.List;

/**
 * @author LiZongXiao
 * @create 2020/6/13 22:20
 */
public interface IRoleDao {
    /**
     * 角色详情
     * @param id
     * @return
     * @throws Exception
     */
    public Role findById(String id) throws Exception;

    /**
     * users_role表的角色删除
     * @param id
     * @throws Exception
     */
    public void deleteUsersRoleById(String id) throws Exception;

    /**
     * role_permission表的角色删除
     * @param id
     * @throws Exception
     */
    public void deleteRolePermissionById(String id) throws Exception;

    /**
     * 角色删除
     * @param id
     * @throws Exception
     */
    public void deleteById(String id) throws Exception;

    /**
     * 新建角色
     * @param role
     * @throws Exception
     */
    public void addRole(Role role) throws Exception;

    /**
     * 查询全部角色信息
     * @return
     * @throws Exception
     */
    public List<Role> findAll() throws Exception;

}
