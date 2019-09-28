package com.huaxin.onestopprocurementbackoffice.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;

import com.huaxin.onestopprocurementbackoffice.po.Orderdetails;
import com.huaxin.onestopprocurementbackoffice.po.OrderdetailsExample;

public interface OrderdetailsMapper {
    int countByExample(OrderdetailsExample example);

    int deleteByExample(OrderdetailsExample example);

    int insert(Orderdetails record);

    int insertSelective(Orderdetails record);

    List<Orderdetails> selectByExample(OrderdetailsExample example);

    int updateByExampleSelective(@Param("record") Orderdetails record, @Param("example") OrderdetailsExample example);

    int updateByExample(@Param("record") Orderdetails record, @Param("example") OrderdetailsExample example);
}