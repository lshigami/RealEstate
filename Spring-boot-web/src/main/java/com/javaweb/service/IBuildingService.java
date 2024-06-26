package com.javaweb.service;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
public interface IBuildingService {
    List<BuildingSearchResponse> queryBuildings(BuildingSearchRequest buildingSearchRequest, Pageable pageable);

    void createBuilding(BuildingDTO buildingDTO);

    void deleteBuilding(List<Long> ids);

    public BuildingEntity findBuildingById(Long id);

    int countTotalItem(BuildingSearchRequest buildingSearchRequest);
}
