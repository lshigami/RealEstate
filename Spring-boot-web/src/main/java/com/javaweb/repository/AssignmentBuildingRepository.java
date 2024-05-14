package com.javaweb.repository;

import com.javaweb.entity.AssignmentBuilding;
import com.javaweb.entity.BuildingEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface AssignmentBuildingRepository extends JpaRepository<AssignmentBuilding, Long>{
    void deleteAllByBuildingEntity(BuildingEntity buildingEntity);

    List<AssignmentBuilding> findByBuildingEntity(BuildingEntity buildingEntity);
}
