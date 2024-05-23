package com.javaweb.entity;


import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "building")
@Getter
@Setter
public class BuildingEntity extends BaseEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @OneToMany(mappedBy = "buildingEntity",fetch = FetchType.LAZY,cascade = CascadeType.ALL,orphanRemoval = true)
    List<RentAreaEntity> areaEntities = new ArrayList<>();

//    @OneToMany(mappedBy = "buildingEntity",fetch = FetchType.LAZY,cascade = CascadeType.ALL)
//    List<AssignmentBuilding> assignmentBuildings = new ArrayList<>();

    @ManyToMany(mappedBy = "buildingEntities",fetch = FetchType.LAZY,cascade = CascadeType.ALL)
    private List<UserEntity> userEntities = new ArrayList<>();

    @Column(name = "name")
    private String name;

    @Column(name = "street")
    private String street;

    @Column(name = "ward")
    private String ward;

    @Column(name = "district")
    private String district;

    @Column(name = "structure")
    private String structure;

    @Column(name = "numberofbasement")
    private Integer numberOfBasement;

    @Column(name = "floorarea")
    private Double floorArea;

    @Column(name = "direction")
    private String direction;

    @Column(name = "level")
    private Integer level;

    @Column(name = "rentprice")
    private Double rentPrice;

    @Column(name = "rentpricedescription")
    private String rentPriceDescription;

    @Column(name = "servicefee")
    private Double serviceFee;

    @Column(name = "carfee")
    private Double carFee;

    @Column(name = "motofee")
    private Double motoFee;

    @Column(name = "overtimefee")
    private Double overtimeFee;

    @Column(name = "waterfee")
    private Double waterFee;

    @Column(name = "electricityfee")
    private Double electricityFee;

    @Column(name = "deposit")
    private Double deposit;

    @Column(name = "payment")
    private String payment;

    @Column(name = "renttime")
    private String rentTime;

    @Column(name = "decorationtime")
    private String decorationTime;

    @Column(name = "brokeragefee")
    private Double brokerageFee;

    @Column(name = "type")
    private String type;

    @Column(name = "note")
    private String note;

    @Column(name = "linkofbuilding")
    private String linkOfBuilding;

    @Column(name = "map")
    private String map;

    @Column(name = "avatar")
    private String image;

    @Column(name = "managername")
    private String managerName;

    @Column(name = "managerphone")
    private String managerPhone;


}
