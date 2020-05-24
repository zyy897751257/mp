package com.zyy.mp.dao;

import com.zyy.mp.pojo.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import java.util.List;

@Mapper
public interface UserDao {

    @Select("SELECT * FROM dbo.t_user")
    List<User> getAllUser();

    @Select("SELECT * FROM dbo.t_user WHERE username = #{username}")
    User getUserByUsername(@Param("username") String username);

    @Select("<script>"
            + "select * from dbo.t_user where 1=1"
            + "<if test='user.id != null'>"
            + "and id like '%${user.id}%'"
            + "</if>"
            + "</script>")
    List<User> findUserList(@Param("user") User user);
}
