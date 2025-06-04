package com.baya.baya_project.Dao;

import java.util.List;

public interface DaoInterface<T> {
    public List<T> selectAll();

    public T selectById(String id);

    public T selectById(int id);



    public int insert(T t);

    public int update(T t);

    public int delete(String id);
}
