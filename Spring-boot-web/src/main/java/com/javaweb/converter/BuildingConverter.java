package com.javaweb.converter;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.enums.districtCode;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.response.BuildingSearchResponse;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

@Component
public class BuildingConverter {
    @Autowired
    private ModelMapper modelMapper;

    public BuildingSearchResponse convertToResponse(BuildingEntity object){
        BuildingSearchResponse buildingSearchResponse = modelMapper.map(object, BuildingSearchResponse.class);
        Map<String, String> listDistrict = districtCode.district();
        String district = listDistrict.get(object.getDistrict());
        buildingSearchResponse.setAddress(object.getStreet()+", "+object.getWard()+", "+district);
        List<RentAreaEntity> rentAreaEntityList = object.getAreaEntities();
        String rentArea = "";
        for(int i=0; i<rentAreaEntityList.size(); i++){
            rentArea += rentAreaEntityList.get(i).getValue();
            if(i<rentAreaEntityList.size()-1){
                rentArea += ", ";
            }
        }
        buildingSearchResponse.setRentArea(rentArea);
        return buildingSearchResponse;
    }

    public BuildingEntity convertToEntity(BuildingDTO object){
        BuildingEntity buildingEntity = modelMapper.map(object, BuildingEntity.class);
        if(object.getId()!=null){
            buildingEntity.setId(object.getId());
        }
        String typeCode = "";
        for(int i=0; i<object.getTypeCode().size(); i++) {
            typeCode += object.getTypeCode().get(i);
            if (i < object.getTypeCode().size() - 1) {
                typeCode += ",";
            }
        }
        buildingEntity.setType(typeCode);
        return buildingEntity;
    }

    public BuildingDTO convertToDTO(BuildingEntity object){
        BuildingDTO buildingDTO = modelMapper.map(object, BuildingDTO.class);

        if(object.getType()!=null){
            String[] typeCode = object.getType().split(",");
            buildingDTO.setTypeCode(Arrays.asList(typeCode));
        }
        String rentArea="";
        for(int i=0; i<object.getAreaEntities().size(); i++){
            rentArea += object.getAreaEntities().get(i).getValue();
            if(i<object.getAreaEntities().size()-1){
                rentArea += ",";
            }
        }
        buildingDTO.setRentArea(rentArea);
        return buildingDTO;
    }
}
