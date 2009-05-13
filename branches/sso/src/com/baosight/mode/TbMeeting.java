package com.baosight.mode;

import java.util.Date;

/**
 * TbMeeting generated by MyEclipse Persistence Tools
 */

public class TbMeeting implements java.io.Serializable {

	// Fields

	private String id;

	private String meetingSn;

	private String title;

	private Date startTime;

	private Date endTime;

	private String meetingroom;

	private String presider;

	private Float fee;

	private String participant;

	private Integer notify;

	private Integer status;

	private Integer lvl;

	private String topic;

	private String rem;

	private String dept;

	private String yearMonth;

	private String attr2;

	private String presidername;

	private String participantname;

	private String presideDept;

	private String participantDept;

	private Integer schedule;

	private String pid;

	// Constructors

	/** default constructor */
	public TbMeeting() {
	}

	public TbMeeting(String meetingSn, String title, Date startTime,
			Date endTime, String meetingroom, Float fee, String presider,
			String participant, Integer lvl, String topic, String rem,
			String dept, String yearMonth, String attr2, Integer status,
			String presidername, String participantname, String presideDept,
			String participantDept, Integer schedule) {
		this.meetingSn = meetingSn;
		this.title = title;
		this.startTime = startTime;
		this.endTime = endTime;
		this.meetingroom = meetingroom;
		this.presider = presider;
		this.fee = fee;
		this.participant = participant;
		this.lvl = lvl;
		this.topic = topic;
		this.rem = rem;
		this.dept = dept;
		this.yearMonth = yearMonth;
		this.attr2 = attr2;

		this.status = status;
		this.presidername = presidername;
		this.participantname = participantname;
		
		this.presideDept=presideDept;
		this.participantDept=participantDept;
		this.schedule=schedule;
	}

	/** full constructor */
	public TbMeeting(String meetingSn, String title, Date startTime,
			Date endTime, String meetingroom, String presider, Float fee,
			String participant, Integer notify, Integer status, Integer lvl,
			String topic, String rem, String dept, String yearMonth,
			String attr2) {
		this.meetingSn = meetingSn;
		this.title = title;
		this.startTime = startTime;
		this.endTime = endTime;
		this.meetingroom = meetingroom;
		this.presider = presider;
		this.fee = fee;
		this.participant = participant;
		this.notify = notify;
		this.status = status;
		this.lvl = lvl;
		this.topic = topic;
		this.rem = rem;
		this.dept = dept;
		this.yearMonth = yearMonth;
		this.attr2 = attr2;
	}

	// Property accessors

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getMeetingSn() {
		return this.meetingSn;
	}

	public void setMeetingSn(String meetingSn) {
		this.meetingSn = meetingSn;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Date getStartTime() {
		return this.startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public Date getEndTime() {
		return this.endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public String getMeetingroom() {
		return this.meetingroom;
	}

	public void setMeetingroom(String meetingroom) {
		this.meetingroom = meetingroom;
	}

	public String getPresider() {
		return this.presider;
	}

	public void setPresider(String presider) {
		this.presider = presider;
	}

	public Float getFee() {
		return this.fee;
	}

	public void setFee(Float fee) {
		this.fee = fee;
	}

	public String getParticipant() {
		return this.participant;
	}

	public void setParticipant(String participant) {
		this.participant = participant;
	}

	public Integer getNotify() {
		return this.notify;
	}

	public void setNotify(Integer notify) {
		this.notify = notify;
	}

	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getLvl() {
		return this.lvl;
	}

	public void setLvl(Integer lvl) {
		this.lvl = lvl;
	}

	public String getTopic() {
		return this.topic;
	}

	public void setTopic(String topic) {
		this.topic = topic;
	}

	public String getRem() {
		return this.rem;
	}

	public void setRem(String rem) {
		this.rem = rem;
	}

	public String getDept() {
		return this.dept;
	}

	public void setDept(String dept) {
		this.dept = dept;
	}

	public String getYearMonth() {
		return this.yearMonth;
	}

	public void setYearMonth(String yearMonth) {
		this.yearMonth = yearMonth;
	}

	public String getAttr2() {
		return this.attr2;
	}

	public void setAttr2(String attr2) {
		this.attr2 = attr2;
	}

	public String getParticipantname() {
		return participantname;
	}

	public void setParticipantname(String participantname) {
		this.participantname = participantname;
	}

	public String getPresidername() {
		return presidername;
	}

	public void setPresidername(String presidername) {
		this.presidername = presidername;
	}

	public String getParticipantDept() {
		return participantDept;
	}

	public void setParticipantDept(String participantDept) {
		this.participantDept = participantDept;
	}

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public String getPresideDept() {
		return presideDept;
	}

	public void setPresideDept(String presideDept) {
		this.presideDept = presideDept;
	}

	public Integer getSchedule() {
		return schedule;
	}

	public void setSchedule(Integer schedule) {
		this.schedule = schedule;
	}

}