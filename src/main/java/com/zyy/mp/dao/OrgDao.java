package com.zyy.mp.dao;

import com.zyy.mp.pojo.Org;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface OrgDao {

    @Select("SELECT * FROM dbo.t_org")
    List<Org> findAll();

    @Select("SELECT * FROM dbo.t_org t WHERE t.org_code = #{orgCode}")
    Org findOne(String orgCode);

    @Update({
            "<script>",
            "UPDATE dbo.t_org",
            "SET status = #{param1}",
            "WHERE id IN",
            "<foreach collection='ids' item='id' open='(' separator=',' close=')'>",
            "#{id}",
            "</foreach>",
            "</script>"
    })
    void updateStatus(int status, @Param("ids") Integer[] ids);

    @Insert("INSERT INTO dbo.t_org (org_code,org_name,org_level,telephone,org_address,principal,org_status)"
            + " VALUES(#{orgCode},#{orgName},#{orgLevel},#{telephone},#{orgAddress},#{principal},#{orgStatus})")
    void addOrg(Org org);

    @Update("UPDATE dbo.t_org SET org_code = #{orgCode},org_name = #{orgName}, org_level = #{orgLevel},"
            + " telephone = #{telephone}, org_address = #{orgAddress}, principal = #{principal}, org_status = #{orgStatus}"
            + " WHERE id = #{id}")
    void updateOrg(Org org);
}
