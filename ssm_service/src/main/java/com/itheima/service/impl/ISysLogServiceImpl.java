package com.itheima.service.impl;

import com.github.pagehelper.PageHelper;
import com.itheima.dao.ISysLogDao;
import com.itheima.domain.SysLog;
import com.itheima.service.ISysLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author LiZongXiao
 * @create 2020/6/25 22:05
 */
@Service
@Transactional
public class ISysLogServiceImpl implements ISysLogService {

    @Autowired
    ISysLogDao sysLogDao;

    /**
     * 查询全部日志，模糊查询
     * @param page
     * @param size
     * @param fuzzyName
     * @return
     * @throws Exception
     */
    @Override
    public List<SysLog> findAll(int page, int size, String fuzzyName) throws Exception {
        //分页
        PageHelper.startPage(page,size);
        return sysLogDao.findAll(fuzzyName);
    }
}
