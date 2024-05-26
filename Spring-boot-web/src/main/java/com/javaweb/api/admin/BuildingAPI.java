package com.javaweb.api.admin;

import com.javaweb.converter.UserConverter;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.repository.UserRepository;
import com.javaweb.service.IBuildingService;
import com.javaweb.service.impl.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.data.domain.PageRequest;
import org.springframework.web.bind.annotation.*;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;

@RestController
    @RequestMapping("/api/buildings")
    public class BuildingAPI {
    @Autowired
    private IBuildingService buildingService;
    @Autowired
    private UserService userService;
    private final UserRepository userRepository;


    @Autowired
    private UserConverter userConverter;

    public BuildingAPI(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

        @GetMapping
        public List<BuildingSearchResponse> loadBuildings(@RequestParam BuildingSearchRequest buildingSearchRequest) {
            List<BuildingSearchResponse> result = buildingService.queryBuildings(buildingSearchRequest, PageRequest.of(buildingSearchRequest.getPage() - 1, buildingSearchRequest.getMaxPageItems()));
            return result;
        }


        @PostMapping
        public String addOrUpdateBuilding(@RequestBody BuildingDTO buildingDTO) {
            System.out.println(buildingDTO.getId());
            buildingService.createBuilding(buildingDTO);
            return new String("Add OR Update Building Success");
        }

       @DeleteMapping
        public String deleteBuilding(@RequestBody List<Long> ids) {
            //Xuong DB xoá data
           buildingService.deleteBuilding(ids);
            return new String("Delete Building Success");
        }

        @GetMapping("/{id}/staffs")
        public ResponseDTO loafStaffs(@PathVariable Long id) {
            List<StaffResponseDTO> staffAssignment = userService.getStaffsByBuildingId(id);
            ResponseDTO result = new ResponseDTO();
            result.setData(staffAssignment);
            result.setMessage("Success");
            return result;
        }

        @PutMapping()
        public void updateAssignmentBuilding(@RequestBody AssignmentBuildingDTO assignmentBuildingDTO) {
            userService.updateAssignmentBuilding(assignmentBuildingDTO);

        }
}
