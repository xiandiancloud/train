package com.dhl.domain;

import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;
import javax.persistence.Transient;

/**
 * @author dhl
 * 
 */

@Entity
@Table(name = "t_vertical")
public class Vertical extends BaseDomain {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;
	private String name;
	// private int sequentialId;
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "sequentialId")
	private Sequential sequential;

//	@Transient
//	private List<Train> trainList;

	@OneToMany(cascade = CascadeType.MERGE,fetch = FetchType.EAGER,mappedBy = "vertical")
	@OrderBy(value="id ASC")
	private Set<VerticalTrain> verticalTrains;

	public Set<VerticalTrain> getVerticalTrains() {
		return verticalTrains;
	}

	public void setVerticalTrains(Set<VerticalTrain> verticalTrains) {
		this.verticalTrains = verticalTrains;
	}

//	public List<Train> getTrainList() {
//		return trainList;
//	}
//
//	public void setTrainList(List<Train> trainList) {
//		this.trainList = trainList;
//	}

	public Sequential getSequential() {
		return sequential;
	}

	public void setSequential(Sequential sequential) {
		this.sequential = sequential;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
}
