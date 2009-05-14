package com.baosight.mode;

/**
 * TbDocAttach generated by MyEclipse Persistence Tools
 */

public class TbDocAttach implements java.io.Serializable {

	// Fields

	private String id;

	private String foreignId;

	private String path;

	private String originallyName;

	private String serverName;

	private String type;

	// Constructors

	/** default constructor */
	public TbDocAttach() {
	}

	/** full constructor */
	public TbDocAttach(String foreignId, String path, String originallyName,
			String serverName, String type) {
		this.foreignId = foreignId;
		this.path = path;
		this.originallyName = originallyName;
		this.serverName = serverName;
		this.type = type;
	}

	// Property accessors

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getForeignId() {
		return this.foreignId;
	}

	public void setForeignId(String foreignId) {
		this.foreignId = foreignId;
	}

	public String getPath() {
		return this.path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getOriginallyName() {
		return this.originallyName;
	}

	public void setOriginallyName(String originallyName) {
		this.originallyName = originallyName;
	}

	public String getServerName() {
		return this.serverName;
	}

	public void setServerName(String serverName) {
		this.serverName = serverName;
	}

	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

}