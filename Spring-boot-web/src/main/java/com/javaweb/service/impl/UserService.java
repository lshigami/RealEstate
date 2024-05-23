package com.javaweb.service.impl;

import com.javaweb.constant.SystemConstant;
import com.javaweb.converter.UserConverter;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.PasswordDTO;
import com.javaweb.model.dto.UserDTO;
import com.javaweb.entity.RoleEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.exception.MyException;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.RoleRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.service.IUserService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@Service
public class UserService implements IUserService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private RoleRepository roleRepository;


    @Autowired
    private BuildingRepository buildingRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private UserConverter userConverter;



    @Override
    public UserDTO findOneByUserNameAndStatus(String name, int status) {
        return userConverter.convertToDto(userRepository.findOneByUserNameAndStatus(name, status));
    }

    @Override
    public List<UserDTO> getUsers(String searchValue, Pageable pageable) {
        Page<UserEntity> users = null;
        if (StringUtils.isNotBlank(searchValue)) {
            users = userRepository.findByUserNameContainingIgnoreCaseOrFullNameContainingIgnoreCaseAndStatusNot(searchValue, searchValue, 0, pageable);
        } else {
            users = userRepository.findByStatusNot(0, pageable);
        }
        List<UserEntity> newsEntities = users.getContent();
        List<UserDTO> result = new ArrayList<>();
        for (UserEntity userEntity : newsEntities) {
            UserDTO userDTO = userConverter.convertToDto(userEntity);
            userDTO.setRoleCode(userEntity.getRoles().get(0).getCode());
            result.add(userDTO);
        }
        return result;
    }



    @Override
    public List<UserDTO> getAllUsers(Pageable pageable) {
        List<UserEntity> userEntities = userRepository.getAllUsers(pageable);
        List<UserDTO> results = new ArrayList<>();
        for (UserEntity userEntity : userEntities) {
            UserDTO userDTO = userConverter.convertToDto(userEntity);
            userDTO.setRoleCode(userEntity.getRoles().get(0).getCode());
            results.add(userDTO);
        }
        return results;
    }

    @Override
    public int countTotalItems() {
        return userRepository.countTotalItem();
    }

    @Override
    public Map<Long, String> getStaffs() {
        Map<Long, String> staffs = new HashMap<>();
        List<UserEntity> userEntities = userRepository.findByStatusAndRoles_Code(1, "STAFF");
        for(UserEntity it : userEntities) {
            staffs.put(it.getId(),it.getFullName());
        }
        return staffs;
    }

    @Override
    public  List<StaffResponseDTO> getStaffsByBuildingId(Long id) {
        List<UserEntity> userEntities = userRepository.findByStatusAndRoles_Code(1, "STAFF");
        //Lấy tất cả nhân viên quản lý toà nhà có giá trị id gửi về List<UserEntity> userEntities
        List<StaffResponseDTO> staffAssignment = new ArrayList<>();
        for (UserEntity userEntity : userEntities) {
//            List<AssignmentBuilding> assignmentBuildings = userEntity.getAssignmentBuildingEntities();
            List<BuildingEntity>buildingEntities=userEntity.getBuildingEntities();
            boolean check = false;
//            for (AssignmentBuilding assignmentBuilding : assignmentBuildings) {
//                if (assignmentBuilding.getBuildingEntity().getId().equals(id)) {
//                    check = true;
//                    StaffResponseDTO staffResponseDTO = userConverter.convertToStaffResponseDTO(userEntity);
//                    staffAssignment.add(staffResponseDTO);
//                }
//            }
            for(BuildingEntity buildingEntity:buildingEntities){
                if(buildingEntity.getId().equals(id)){
                    check=true;
                    StaffResponseDTO staffResponseDTO = userConverter.convertToStaffResponseDTO(userEntity);
                    staffAssignment.add(staffResponseDTO);
                }
            }
            if (!check) {
                StaffResponseDTO staffResponseDTO = userConverter.convertToStaffResponseDTO(userEntity);
                staffResponseDTO.setChecked("unchecked");
                staffAssignment.add(staffResponseDTO);
            }
        }
        return staffAssignment;
    }


    @Override
    public int getTotalItems(String searchValue) {
        int totalItem = 0;
        if (StringUtils.isNotBlank(searchValue)) {
            totalItem = (int) userRepository.countByUserNameContainingIgnoreCaseOrFullNameContainingIgnoreCaseAndStatusNot(searchValue, searchValue, 0);
        } else {
            totalItem = (int) userRepository.countByStatusNot(0);
        }
        return totalItem;
    }

    @Override
    public UserDTO findOneByUserName(String userName) {
        UserEntity userEntity = userRepository.findOneByUserName(userName);
        UserDTO userDTO = userConverter.convertToDto(userEntity);
        return userDTO;
    }

    @Override
    public UserDTO findUserById(long id) {
        UserEntity entity = userRepository.findById(id).get();
        List<RoleEntity> roles = entity.getRoles();
        UserDTO dto = userConverter.convertToDto(entity);
        roles.forEach(item -> {
            dto.setRoleCode(item.getCode());
        });
        return dto;
    }

    @Override
    @Transactional
    public UserDTO insert(UserDTO newUser) {
        RoleEntity role = roleRepository.findOneByCode(newUser.getRoleCode());
        UserEntity userEntity = userConverter.convertToEntity(newUser);
        userEntity.setRoles(Stream.of(role).collect(Collectors.toList()));
        userEntity.setStatus(1);
        userEntity.setPassword(passwordEncoder.encode(SystemConstant.PASSWORD_DEFAULT));
        return userConverter.convertToDto(userRepository.save(userEntity));
    }

    @Override
    @Transactional
    public UserDTO update(Long id, UserDTO updateUser) {
        RoleEntity role = roleRepository.findOneByCode(updateUser.getRoleCode());
        UserEntity oldUser = userRepository.findById(id).get();
        UserEntity userEntity = userConverter.convertToEntity(updateUser);
        userEntity.setUserName(oldUser.getUserName());
        userEntity.setStatus(oldUser.getStatus());
        userEntity.setRoles(Stream.of(role).collect(Collectors.toList()));
        userEntity.setPassword(oldUser.getPassword());
        return userConverter.convertToDto(userRepository.save(userEntity));
    }

    @Override
    @Transactional
    public void updatePassword(long id, PasswordDTO passwordDTO) throws MyException {
        UserEntity user = userRepository.findById(id).get();
        if (passwordEncoder.matches(passwordDTO.getOldPassword(), user.getPassword())
                && passwordDTO.getNewPassword().equals(passwordDTO.getConfirmPassword())) {
            user.setPassword(passwordEncoder.encode(passwordDTO.getNewPassword()));
            userRepository.save(user);
        } else {
            throw new MyException(SystemConstant.CHANGE_PASSWORD_FAIL);
        }
    }

    @Override
    @Transactional
    public UserDTO resetPassword(long id) {
        UserEntity userEntity = userRepository.findById(id).get();
        userEntity.setPassword(passwordEncoder.encode(SystemConstant.PASSWORD_DEFAULT));
        return userConverter.convertToDto(userRepository.save(userEntity));
    }

    @Override
    @Transactional
    public UserDTO updateProfileOfUser(String username, UserDTO updateUser) {
        UserEntity oldUser = userRepository.findOneByUserName(username);
        oldUser.setFullName(updateUser.getFullName());
        return userConverter.convertToDto(userRepository.save(oldUser));
    }

    @Override
    @Transactional
    public void delete(long[] ids) {
        for (Long item : ids) {
            UserEntity userEntity = userRepository.findById(item).get();
            userEntity.setStatus(0);
            userRepository.save(userEntity);
        }
    }

    @Transactional
    @Override
    public void updateAssignmentBuilding(AssignmentBuildingDTO assignmentBuildingDTO) {
//        // Delete all existing assignments of the building
//        List<AssignmentBuilding> existingAssignments = assignmentBuildingRepository.findByBuildingEntity(buildingRepository.findById(assignmentBuildingDTO.getBuildingId()).get());
//        assignmentBuildingRepository.deleteAll(existingAssignments);
//
//        // Assign the building to new staffs
//        for (Long staffId : assignmentBuildingDTO.getStaffs()) {
//            AssignmentBuilding newAssignment = new AssignmentBuilding();
//            newAssignment.setBuildingEntity(buildingRepository.findById(assignmentBuildingDTO.getBuildingId()).get());
//            newAssignment.setStaffs(userRepository.findById(staffId).get());
//            assignmentBuildingRepository.save(newAssignment);
//        }
        BuildingEntity buildingEntity = buildingRepository.findById(assignmentBuildingDTO.getBuildingId()).get();
        List<UserEntity>oldUserEntities=buildingEntity.getUserEntities();
        for(UserEntity userEntity:oldUserEntities){
            List<BuildingEntity> buildingEntities = userEntity.getBuildingEntities();
            buildingEntities.remove(buildingEntity);
            userEntity.setBuildingEntities(buildingEntities);
            userRepository.save(userEntity);
        }
        List<UserEntity> userEntities = new ArrayList<>();
        for (Long staffId : assignmentBuildingDTO.getStaffs()) {
            UserEntity userEntity = userRepository.findById(staffId).get();
            userEntities.add(userEntity);
        }
        buildingEntity.setUserEntities(userEntities);

        for(UserEntity userEntity:userEntities){
            List<BuildingEntity> buildingEntities = userEntity.getBuildingEntities();
            boolean find=false;
            for(BuildingEntity buildingEntity1:buildingEntities){
                if(buildingEntity1.getId().equals(assignmentBuildingDTO.getBuildingId())){
                    find=true;
                    break;
                }
            }
            if(find==false){
                buildingEntities.add(buildingEntity);
                userEntity.setBuildingEntities(buildingEntities);
                userRepository.save(userEntity);
            }
        }

        buildingRepository.save(buildingEntity);

    }

}
