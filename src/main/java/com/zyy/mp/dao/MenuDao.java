package com.zyy.mp.dao;

import com.zyy.mp.pojo.Menu;
import org.apache.ibatis.annotations.*;
import java.util.List;

@Mapper
public interface MenuDao {

    @Select("select * from t_menu where parentMenuId = 0")
    @Results(id = "menuMap", value = {
            @Result(id=true,column="id", property="id"),
            @Result(column="name", property="name"),
            @Result(column="linkUrl", property="linkUrl"),
            @Result(column = "path", property = "path"),
            @Result(column = "priority", property = "priority"),
            @Result(column = "description", property = "description"),
            @Result(column = "icon", property = "icon"),
            @Result(column = "path", property = "path"),
            @Result(column = "parentMenuId", property = "parentMenuId"),
            @Result(column="id", property="child",
                    many=@Many(
                            select="getMenusByParentId"
                    )
            )
    })
    List<Menu> getParentMenus();

    @Select("select * from t_menu where parentMenuId = #{parentId}")
    @ResultMap("menuMap")
    List<Menu> getMenusByParentId(@Param("parentId") Integer parentId);
}
