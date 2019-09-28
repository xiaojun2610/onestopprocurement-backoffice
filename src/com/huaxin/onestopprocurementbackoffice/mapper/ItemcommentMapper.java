package com.huaxin.onestopprocurementbackoffice.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;

import com.huaxin.onestopprocurementbackoffice.po.Itemcomment;
import com.huaxin.onestopprocurementbackoffice.po.ItemcommentExample;

public interface ItemcommentMapper {
    int countByExample(ItemcommentExample example);

    int deleteByExample(ItemcommentExample example);

    int deleteByPrimaryKey(Integer commentId);

    int insert(Itemcomment record);

    int insertSelective(Itemcomment record);

    List<Itemcomment> selectByExample(ItemcommentExample example);

    Itemcomment selectByPrimaryKey(Integer commentId);

    int updateByExampleSelective(@Param("record") Itemcomment record, @Param("example") ItemcommentExample example);

    int updateByExample(@Param("record") Itemcomment record, @Param("example") ItemcommentExample example);

    int updateByPrimaryKeySelective(Itemcomment record);

    int updateByPrimaryKey(Itemcomment record);
}