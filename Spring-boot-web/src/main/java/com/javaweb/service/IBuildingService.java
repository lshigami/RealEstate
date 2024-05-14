package com.javaweb.service;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import org.springframework.stereotype.Service;

import java.util.List;
public interface IBuildingService {
    List<BuildingSearchResponse> queryBuildings(BuildingSearchRequest buildingSearchRequest);

    void createBuilding(BuildingDTO buildingDTO);

    void deleteBuilding(Long id);

    public BuildingEntity findBuildingById(Long id);
}
