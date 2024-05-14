package com.javaweb.service.impl;

import com.javaweb.converter.BuildingConverter;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.javaweb.repository.AssignmentBuildingRepository;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.RentAreaRepository;
import com.javaweb.service.IBuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
public class BuildingServiceImpl implements IBuildingService {
    @Autowired
    private BuildingRepository buildingRepository;
    @Autowired
    private RentAreaRepository rentAreaRepository;
    @Autowired
    private AssignmentBuildingRepository assignmentBuildingRepository;
    @Autowired
    private BuildingConverter buildingConverter;
    @Override
    public List<BuildingSearchResponse> queryBuildings(BuildingSearchRequest buildingSearchRequest) {
        List<BuildingEntity> buildingEntities = buildingRepository.search(buildingSearchRequest);
        List<BuildingSearchResponse> result = new ArrayList<>();
        for (BuildingEntity buildingEntity : buildingEntities) {
            BuildingSearchResponse buildingSearchResponse = buildingConverter.convertToResponse(buildingEntity);
            result.add(buildingSearchResponse);
        }
        return result;
    }

    @Override
    public BuildingEntity findBuildingById(Long id){
        return buildingRepository.findById(id).get();
    }

    @Override
    @Transactional
    public void createBuilding(BuildingDTO buildingDTO) {
        BuildingEntity buildingEntity = buildingConverter.convertToEntity(buildingDTO);
        System.out.println(buildingEntity.getId());
        buildingRepository.save(buildingEntity);
        rentAreaRepository.deleteAllByBuildingEntity(buildingEntity);
        if(buildingDTO.getRentArea()==null || buildingDTO.getRentArea().isEmpty()){
            return;
        }
        List<RentAreaEntity> rentAreaEntities = new ArrayList<>();
        List<String>rentAreaString= Arrays.asList(buildingDTO.getRentArea().split(","));
        for (String rentArea : rentAreaString) {
            RentAreaEntity rentAreaEntity = new RentAreaEntity();
            rentAreaEntity.setValue(rentArea);
            rentAreaEntity.setBuildingEntity(buildingEntity);
            rentAreaEntities.add(rentAreaEntity);
            rentAreaRepository.save(rentAreaEntity);
        }
    }

    @Override
    @Transactional
    public void deleteBuilding(Long id) {
        BuildingEntity buildingEntity=buildingRepository.findById(id).get();
        assignmentBuildingRepository.deleteAllByBuildingEntity(buildingEntity);
        rentAreaRepository.deleteAllByBuildingEntity(buildingEntity);
        buildingRepository.deleteById(id);
    }

}
