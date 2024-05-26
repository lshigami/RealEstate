package com.javaweb.service.impl;

import com.javaweb.converter.BuildingConverter;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.RentAreaRepository;
import com.javaweb.service.IBuildingService;
import com.javaweb.utils.UploadFileUtils;
import org.apache.tomcat.util.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
public class BuildingServiceImpl implements IBuildingService {
    @Autowired
    private BuildingRepository buildingRepository;
    @Autowired
    private RentAreaRepository rentAreaRepository;
    @Autowired
    private BuildingConverter buildingConverter;

    @Autowired
    private UploadFileUtils uploadFileUtils;
    @Override
    public List<BuildingSearchResponse> queryBuildings(BuildingSearchRequest buildingSearchRequest, Pageable pageable) {
        List<BuildingEntity> buildingEntities = buildingRepository.search(buildingSearchRequest,pageable);
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
        if (buildingDTO.getId() != null) { // update
            buildingEntity.setImage(buildingRepository.findById(buildingDTO.getId()).get().getImage());
            List<UserEntity> userEntities = buildingRepository.findById(buildingDTO.getId()).get().getUserEntities();
            buildingEntity.setUserEntities(userEntities);
        }
        saveThumbnail(buildingDTO, buildingEntity);
        List<RentAreaEntity> rentAreaEntities = new ArrayList<>();
        if(buildingDTO.getRentArea()!=null && !buildingDTO.getRentArea().isEmpty()){
            List<String>rentAreaString= Arrays.asList(buildingDTO.getRentArea().split(","));
            for (String rentArea : rentAreaString) {
                RentAreaEntity rentAreaEntity = new RentAreaEntity();
                rentAreaEntity.setValue(rentArea);
                rentAreaEntity.setBuildingEntity(buildingEntity);
                rentAreaEntities.add(rentAreaEntity);
            }
        }
        buildingEntity.setAreaEntities(rentAreaEntities);
        buildingRepository.save(buildingEntity);

    }

    private void saveThumbnail(BuildingDTO buildingDTO, BuildingEntity buildingEntity) {
        String path = "/building/" + buildingDTO.getImageName();
        if (null != buildingDTO.getImageBase64()) {
            if (null != buildingEntity.getImage()) {
                if (!path.equals(buildingEntity.getImage())) {
                    File file = new File("C://home/office" + buildingEntity.getImage());
                    file.delete();
                }
            }
            byte[] bytes = Base64.decodeBase64(buildingDTO.getImageBase64().getBytes());
            uploadFileUtils.writeOrUpdate(path, bytes);
            buildingEntity.setImage(path);
        }
    }
    @Override
    @Transactional
    public void deleteBuilding(List<Long> ids) {
        for (Long id : ids) {
            buildingRepository.deleteById(id);
        }
    }



    @Override
    public int countTotalItem(BuildingSearchRequest buildingSearchRequest) {
        return buildingRepository.countTotalItem(  buildingSearchRequest);
    }

}
