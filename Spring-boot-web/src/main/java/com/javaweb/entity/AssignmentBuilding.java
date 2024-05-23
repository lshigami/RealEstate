//package com.javaweb.entity;
//
//
//import lombok.Getter;
//import lombok.Setter;
//
//import javax.persistence.*;
//
//@Entity
//@Table(name = "assignmentbuilding")
//@Getter
//@Setter
//public class AssignmentBuilding  extends BaseEntity{
//    @Id
//    @GeneratedValue(strategy = GenerationType.IDENTITY)
//    private Long id;
//
//    @ManyToOne
//    @JoinColumn(name = "buildingid")
//    private BuildingEntity buildingEntity;
//
//    @ManyToOne
//    @JoinColumn(name = "staffid")
//    private UserEntity staffs;
//
//}
