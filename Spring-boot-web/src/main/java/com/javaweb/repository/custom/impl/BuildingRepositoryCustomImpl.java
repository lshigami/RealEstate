package com.javaweb.repository.custom.impl;


import java.lang.reflect.Field;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.utils.StringUtils;
import org.springframework.stereotype.Repository;

import com.javaweb.repository.custom.BuildingRepositoryCustom;


@Repository
public class BuildingRepositoryCustomImpl implements BuildingRepositoryCustom{

    @PersistenceContext
    private EntityManager entityManager;

    public void joinWith(BuildingSearchRequest builder, StringBuilder sql) {
        Long rentAreaFrom = builder.getAreaFrom();
        Long rentAreaTo = builder.getAreaTo();
        Long staffId = builder.getStaffId();
        List<String> typeCodeList = builder.getTypeCode();

        if (rentAreaFrom != null || rentAreaTo != null)
            sql.append(" JOIN rentarea ra ON ra.buildingid=b.id ");
        if (staffId != null)
            sql.append(" JOIN assignmentbuilding ab ON ab.buildingid=b.id ");
    }

    public void joinWhere(BuildingSearchRequest builder, StringBuilder sql) {
        try {
            Field[] fields = BuildingSearchRequest.class.getDeclaredFields();
            for (Field x : fields) {
                x.setAccessible(true);
                if (x.get(builder) == null) {
                    continue;
                }
                String fieldName = x.getName();
                if (!fieldName.startsWith("area") && !fieldName.equals("staffId") && !fieldName.startsWith("rentPrice")
                        && !fieldName.equals("typeCode")) {

                    String value = x.get(builder).toString();
                    if (StringUtils.check(value)) {

                        // is digit
                        if (value.matches("\\d+")) {
                            sql.append(" AND b." + fieldName + " = " + value);
                        } else {
                            sql.append(" AND b. " + fieldName + " LIKE '%" + value + "%' ");
                        }

                    }
                }

                if (fieldName.equals("staffId")) {
                    String data = x.get(builder).toString();
                    if (StringUtils.check(data)) {
                        sql.append(" AND ab.staffid = " + data);
                    }
                } else if (fieldName.equals("areaFrom")) {
                    String data = x.get(builder).toString();
                    System.out.println(data);
                    if (StringUtils.check(data)) {
                        sql.append(" AND ra.value >= " + data);
                    }
                } else if (fieldName.equals("areaTo")) {
                    String data = x.get(builder).toString();
                    if (StringUtils.check(data)) {
                        sql.append(" AND ra.value <= " + data);
                    }
                } else if (fieldName.equals("rentPriceFrom")) {
                    String data = x.get(builder).toString();
                    if (StringUtils.check(data)) {
                        sql.append(" AND b.rentprice >= " + data);
                    }
                } else if (fieldName.equals("rentPriceTo")) {
                    String data = x.get(builder).toString();
                    if (StringUtils.check(data)) {
                        sql.append(" AND b.rentprice <= " + data);
                    }
                }
                if (fieldName.equals("typeCode") && builder.getTypeCode() != null && builder.getTypeCode().size() > 0) {
                    for (String typeCode : builder.getTypeCode()) {
                        sql.append(" AND b.type like N'%" + typeCode + "%' ");
                    }
                    //ANd b.type like('%TANG_TRET%') and b.type like('%NOi_THAT%')
                }
            }
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        }
    }
    @Override
    public List<BuildingEntity> search(BuildingSearchRequest builder) {
        StringBuilder sql = new StringBuilder(" SELECT DISTINCT b.* FROM BUILDING b ");
        joinWith(builder, sql);
        StringBuilder where = new StringBuilder(" WHERE 1=1 ");
        joinWhere(builder, where);
        sql.append(where);
        System.out.println(sql.toString());
        Query sqlnativeQuery = entityManager.createNativeQuery(sql.toString(), BuildingEntity.class);
        return sqlnativeQuery.getResultList();
    }

}